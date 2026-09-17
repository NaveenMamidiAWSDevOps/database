# Database CI Guide

## Purpose
Validate selected database scripts in a temporary PostgreSQL 16
database using GitHub Actions.

## Where it runs
- Repository: NaveenMamidiAWSDevOps/database
- Branch: feature/database-cicd-naveen
- Trigger: Push to this branch
- Workflow: .github/workflows/database-ci.yml

The workflow does not deploy to AWS or connect to a live database.

## Checks included

### Supporting languages
- Create the table and load seed data.
- Verify 12 active languages and 2 RTL languages.
- Check for duplicate language/locale pairs.
- Run the table and seed scripts again, then repeat the checks.

### Volunteer onboarding
- Create the required tables in dependency order.
- Create a test user and capture the generated user ID.
- Create and update a volunteer application.
- Accept the application.
- Verify volunteer details and both selected skills are transferred.
- Verify the accepted application is removed.
- Roll back the test rows.

## How to run
Commit changes on the feature branch, then push:

git push origin feature/database-cicd-naveen

Open the repository's Actions tab and select the latest run.
Expand the job and individual steps to inspect their logs.

## Failure handling
SQL commands use ON_ERROR_STOP=1.
Test assertions raise SQL errors when expectations are not met.
A failed step stops subsequent normal test steps.

Failure detection was verified by temporarily expecting 13 languages
instead of 12. The test failed, and reverting the change restored
a passing run.

## Limitations and remaining work
- Coverage currently includes languages and volunteer onboarding,
  not the entire database.
- Onboarding setup must run once in a fresh test database.
- Some setup scripts contain DROP TABLE statements and must only
  be used in the disposable test environment.
- PostgreSQL 16 testing does not establish Aurora compatibility.
- Deployment/CD is not implemented.
- Confirm the team's database version, extensions, deployment
  process, and required coverage before expanding the pipeline.