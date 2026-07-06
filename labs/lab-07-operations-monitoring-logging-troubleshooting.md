# Lab 07 - Operations, Monitoring, Logging, Troubleshooting

## Objectives

- Use Cloud Monitoring dashboards.
- Search logs with Cloud Logging.
- Create uptime checks and alerting policies.
- Use log-based metrics.
- Practice a structured troubleshooting workflow.

## Scenario

A web service is intermittently unavailable. You must use Google Cloud operations tools to confirm health, inspect logs, and define an alert.

## Steps

### 1. Open Monitoring

1. Search for `Monitoring`.
2. Open the Metrics Explorer.
3. Select a resource type such as VM instance or Cloud Run revision, depending on resources available.
4. Review CPU, request count, latency, or uptime metrics.

### 2. Create a Dashboard

1. Open `Dashboards`.
2. Create a dashboard named `ACE Lab Dashboard`.
3. Add charts for available resources.
4. Save the dashboard.

### 3. Search Logs

1. Search for `Logs Explorer`.
2. Select the current project.
3. Filter by a resource type such as:

```text
gce_instance
cloud_run_revision
```

4. Search for warning or error severity.
5. Save a useful query in your notes.

### 4. Create an Uptime Check

1. Open `Uptime checks`.
2. Create a check for a public lab endpoint if one is available.
3. Use HTTP or HTTPS.
4. Set a short path such as `/`.
5. Save the check.

### 5. Create an Alerting Policy

1. Open `Alerting`.
2. Create a policy based on an uptime check or metric threshold.
3. Add a notification channel only if instructed.
4. Name the policy clearly.
5. Save the policy.

### 6. Create a Log-Based Metric

1. In Logs Explorer, search for an error pattern.
2. Create a counter metric from the query.
3. Name it `ace_lab_error_count`.
4. Review where the metric appears in Monitoring.

### 7. Troubleshooting Drill

Use this sequence for an incident:

1. Confirm the affected service and region.
2. Check recent deployments or configuration changes.
3. Review metrics for saturation or errors.
4. Search logs for matching timestamps.
5. Confirm IAM, firewall, DNS, and health checks.
6. Apply the smallest safe fix.
7. Verify recovery and document the root cause.

## Checkpoint Questions

1. What is the difference between metrics and logs?
2. Why are uptime checks useful?
3. How can log-based metrics support alerting?
4. What should you check before assuming application code is at fault?

## Cleanup

Remove dashboards, alerting policies, uptime checks, and log-based metrics that are only for the lab.

## Exam Focus

Operations questions frequently require choosing the fastest way to identify service health, read logs, configure alerts, and troubleshoot access or networking problems.
