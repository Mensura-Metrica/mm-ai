# Gate 7: Deployment → Maintenance

## Gate Purpose
Verify that the system is successfully deployed, stable, and ready for ongoing operation. This gate transitions from project mode to operational mode.

## Checklist

### Deployment Verification
- [ ] All services deployed in correct dependency order — *Architecture-aligned deployment?*
- [ ] Health checks pass for all services — *Everything running?*
- [ ] Smoke tests pass in production — *Core workflows work?*
- [ ] Error rates at or below baseline — *No new error patterns?*
- [ ] Performance within thresholds — *Meeting NFR targets?*

### Operational Readiness
- [ ] Monitoring dashboards operational — *Can we see what's happening?*
- [ ] Alerting configured for all services — *Will we know when something breaks?*
- [ ] Rollback procedure tested and documented — *Can we revert?*
- [ ] Incident response procedure documented — *Does the team know what to do?*
- [ ] On-call rotation defined (if applicable) — *Who responds to issues?*

### Documentation
- [ ] Release notes published — *Stakeholders know what's new?*
- [ ] Operations runbook complete — *How to operate the system?*
- [ ] Architecture documentation up to date — *Reflects what was actually built?*
- [ ] Known issues documented — *What's not perfect and why?*

### Stakeholder Sign-off
- [ ] Product Owner accepts the release — *Business requirements met?*
- [ ] Technical lead accepts the release — *Architecture integrity maintained?*
- [ ] Operations team accepts the release — *System is operable?*

## Gate Decision
- **PASS**: All items checked. Transition to Maintenance & Evolution.
- **FAIL**: Address issues before completing the transition.

## Gate Owner
Product Owner, Technical Lead, and Operations jointly make the gate decision.
