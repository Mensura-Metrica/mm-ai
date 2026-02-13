# Release Planning

## Purpose
Plan and execute a controlled release of the software. In an IDesign architecture, the service decomposition enables independent service deployment — but dependencies must be respected.

## Agent Persona
[DevOps Agent](devops-agent.md)

## Instructions

### Step 1: Release Strategy

Choose a deployment strategy based on risk tolerance:

| Strategy | Risk Level | Rollback Speed | Complexity | Best For |
|----------|-----------|----------------|------------|----------|
| **Blue-Green** | Low | Instant | Medium | Critical systems |
| **Canary** | Low | Fast | High | High-traffic systems |
| **Rolling** | Medium | Moderate | Low | Standard deployments |
| **Big Bang** | High | Slow | Low | Simple systems, initial launch |

### Step 2: Deployment Order
The architecture dictates deployment order (mirror the build order):

1. **Utilities** — No dependencies; deploy first
2. **Resource Accessors** — Depend only on Utilities
3. **Engines** — Depend only on Utilities
4. **Managers** — Depend on Engines and Resource Accessors
5. **Clients** — Depend on Managers; deploy last

**Why this order?** Each layer can be tested against its already-deployed dependencies. Deploying top-down would mean deploying code that can't be verified yet.

### Step 3: Environment Strategy

| Environment | Purpose | Data | Access |
|------------|---------|------|--------|
| **Development** | Active development and debugging | Synthetic | Developers |
| **Integration/Staging** | Integration testing, pre-production validation | Production-like | Development + QA |
| **Production** | Live system | Real | Operations + Users |

- Staging must be **as close to production as possible** — same infrastructure, same configuration, same scale (or close)
- Environment-specific configuration through environment variables or config services, never hard-coded

### Step 4: Deployment Checklist

**Pre-Deployment:**
- [ ] All Gate 6 criteria passed
- [ ] Release notes reviewed and approved
- [ ] Database migrations tested in staging
- [ ] Rollback procedure tested in staging
- [ ] Monitoring and alerts configured for new features
- [ ] Team notified of deployment window

**During Deployment:**
- [ ] Deploy in the correct service order
- [ ] Verify health checks after each service deployment
- [ ] Run smoke tests after each layer is deployed
- [ ] Monitor error rates and performance metrics
- [ ] Keep the rollback decision-maker available

**Post-Deployment:**
- [ ] Full smoke test suite passes in production
- [ ] Error rates are at or below baseline
- [ ] Performance metrics are within thresholds
- [ ] Stakeholders notified of successful deployment
- [ ] Release notes published

### Step 5: Rollback Procedure

Define a clear rollback trigger and process:

**Trigger Criteria** — Rollback if any of these occur:
- Error rate exceeds 2x baseline
- Response time exceeds 2x baseline
- Critical functionality is broken
- Data integrity is compromised

**Rollback Steps:**
1. Decision maker authorizes rollback
2. Deploy previous version in reverse order (Clients → Managers → Engines/ResourceAccessors → Utilities)
3. Verify rollback with smoke tests
4. Investigate root cause
5. Fix and re-deploy through normal process

## Inputs
- Tested, QA-approved software (from Phase 6)
- Architecture: Service Catalog and Call Graph (for deployment ordering)
- Infrastructure requirements
- Monitoring requirements

## Outputs
- **Release Plan** — Strategy, order, schedule, responsible parties
- **Deployment Runbook** — Step-by-step deployment procedure
- **Rollback Runbook** — Step-by-step rollback procedure
- **Monitoring Configuration** — Dashboards, alerts, thresholds
- **Release Notes** — What's new, what's changed, known issues

## Quality Criteria
- [ ] Deployment order follows architecture dependency graph
- [ ] Rollback procedure is documented and tested
- [ ] Monitoring covers all deployed services
- [ ] Staging deployment validates the production deployment process
- [ ] Release notes are complete and reviewed
