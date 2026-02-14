[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$ReportPath,

    [Parameter(Mandatory = $true)]
    [string]$ConfigPath
)

$ErrorActionPreference = 'Stop'

function Read-JsonFile {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        throw "File not found: $Path"
    }

    $raw = Get-Content -LiteralPath $Path -Raw
    if ([string]::IsNullOrWhiteSpace($raw)) {
        throw "File is empty: $Path"
    }

    return $raw | ConvertFrom-Json
}

function Get-RuleBand {
    param(
        [double]$Score,
        [double]$GreenMin,
        [double]$YellowMin
    )

    if ($Score -ge $GreenMin) { return 'Green' }
    if ($Score -ge $YellowMin) { return 'Yellow' }
    return 'Red'
}

$report = Read-JsonFile -Path $ReportPath
$config = Read-JsonFile -Path $ConfigPath

if (-not $report.rules -or $report.rules.Count -eq 0) {
    throw 'Report must include at least one rule result.'
}

$totalWeight = 0.0
$weightedSum = 0.0
$criticalFailures = 0
$highFailures = 0

$reportedRuleIds = @{}

foreach ($rule in $report.rules) {
    if (-not $rule.rule_id) {
        throw 'Each rule entry must include rule_id.'
    }

    $reportedRuleIds[$rule.rule_id] = $true

    $result = [double]$rule.result
    $weight = [double]$rule.weight

    if ($weight -lt 0) {
        throw "Rule $($rule.rule_id) has negative weight."
    }

    $totalWeight += $weight
    $weightedSum += ($result * $weight)

    $isFailure = $result -lt 1
    if ($isFailure -and $rule.severity -eq 'Critical') { $criticalFailures++ }
    if ($isFailure -and $rule.severity -eq 'High') { $highFailures++ }
}

if ($totalWeight -le 0) {
    throw 'Total rule weight must be greater than 0.'
}

$weightedScore = [Math]::Round((($weightedSum / $totalWeight) * 100), 2)
$band = Get-RuleBand -Score $weightedScore -GreenMin ([double]$config.bands.green_min) -YellowMin ([double]$config.bands.yellow_min)

$missingRequiredRules = @()
foreach ($requiredRule in $config.required_rules) {
    if (-not $reportedRuleIds.ContainsKey([string]$requiredRule)) {
        $missingRequiredRules += [string]$requiredRule
    }
}

$blockingConditions = @()
if ($report.blocking_conditions) {
    $blockingConditions = @($report.blocking_conditions)
}

$policy = $config.policy
$failedChecks = @()

if ($weightedScore -lt [double]$policy.minimum_weighted_score) {
    $failedChecks += "Weighted score $weightedScore is below minimum $($policy.minimum_weighted_score)."
}

if ($criticalFailures -gt [int]$policy.max_critical_failures) {
    $failedChecks += "Critical failures $criticalFailures exceed max $($policy.max_critical_failures)."
}

if ($highFailures -gt [int]$policy.max_high_failures) {
    $failedChecks += "High failures $highFailures exceed max $($policy.max_high_failures)."
}

if ([bool]$policy.require_blocking_conditions_empty -and $blockingConditions.Count -gt 0) {
    $failedChecks += "Blocking conditions are not empty ($($blockingConditions.Count))."
}

if ([bool]$config.fail_on_missing_required_rules -and $missingRequiredRules.Count -gt 0) {
    $failedChecks += "Missing required rules: $($missingRequiredRules -join ', ')."
}

Write-Host "Compliance score: $weightedScore ($band)"
Write-Host "Critical failures: $criticalFailures"
Write-Host "High failures: $highFailures"

if ($missingRequiredRules.Count -gt 0) {
    Write-Host "Missing required rules: $($missingRequiredRules -join ', ')"
}

if ($failedChecks.Count -gt 0) {
    Write-Error ("Compliance check FAILED:`n - " + ($failedChecks -join "`n - "))
    exit 1
}

Write-Host 'Compliance check PASSED.'
exit 0
