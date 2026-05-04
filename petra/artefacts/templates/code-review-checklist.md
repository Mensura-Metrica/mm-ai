# Code Review Checklist

## Pull Request Information

| Field | Value |
|-------|-------|
| PR Number | |
| Title | |
| Author | |
| Reviewers | |
| Branch | |
| Review Date | |

## Pre-Review Self-Check

- [ ] Code compiles without errors
- [ ] All tests pass locally
- [ ] No console.log/debug statements left
- [ ] No commented-out code
- [ ] No secrets/credentials in code

## Review Criteria

### Correctness

- [ ] Code does what it claims to do
- [ ] Edge cases handled
- [ ] Error handling appropriate
- [ ] No null pointer exceptions possible

### Architecture

- [ ] Service taxonomy followed (M/E/RA/U/C)
- [ ] No forbidden calls in call graph
- [ ] Interface contracts respected
- [ ] No circular dependencies

### Code Quality

- [ ] Clear naming (functions, variables, classes)
- [ ] Single responsibility per method/class
- [ ] No magic numbers or strings
- [ ] DRY principle followed
- [ ] Complexity is reasonable

### Testing

- [ ] Unit tests present
- [ ] Test coverage adequate (90%+)
- [ ] Tests are maintainable
- [ ] Edge cases covered

### Security

- [ ] Input validation present
- [ ] No SQL injection possible
- [ ] No XSS vulnerabilities
- [ ] Secrets not exposed

### Performance

- [ ] No obvious performance issues
- [ ] N+1 queries avoided
- [ ] Appropriate caching considered

### Documentation

- [ ] Purpose of code is clear
- [ ] Non-obvious logic explained
- [ ] Public APIs documented

## Review Comments

| Line # | Comment | Severity |
|--------|---------|----------|
| | | |

## Decision

| Reviewer | Decision | Date |
|---------|----------|------|
| | Approve / Request Changes / Reject | |

## Notes

- Strengths:
- Suggestions for future improvement: