# Tools Guide

## Required Tools

| Tool | Purpose |
| --- | --- |
| Google Cloud Console | Browser-based administration for Google Cloud resources. |
| Cloud Shell | Browser-based terminal with Google Cloud CLI preinstalled. |
| Google Cloud CLI | Command-line administration using `gcloud`, `gsutil`, and related commands. |
| Cloud Monitoring | Metrics, dashboards, uptime checks, and alerting. |
| Cloud Logging | Log search, log-based metrics, and troubleshooting. |

## Optional Tools

| Tool | Purpose |
| --- | --- |
| diagrams.net | Architecture and network diagrams. |
| Visual Studio Code | Editing scripts, YAML files, and notes. |
| Google Cloud Skills Boost | Additional guided practice. |

## Recommended Naming Convention

Use a consistent prefix so resources are easy to find and delete:

```text
ace-lab-<number>-<resource>
```

Examples:

```text
ace-lab-03-vpc
ace-lab-04-template
ace-lab-06-cloudrun
```

## Cleanup Checklist

At the end of each lab, check for:

- Running VM instances.
- Unattached persistent disks.
- Static external IP addresses.
- Load balancers, forwarding rules, target pools, backend services, and health checks.
- GKE clusters.
- Cloud SQL instances.
- Storage buckets containing test data.
- IAM bindings created only for the lab.
