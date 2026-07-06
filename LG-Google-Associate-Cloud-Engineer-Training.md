# Learner Guide - Google Associate Cloud Engineer Training

## Course Information

| Item | Details |
| --- | --- |
| Course Code | TGS-2023041024 |
| Course Title | Google Associate Cloud Engineer Training |
| Registration | https://www.tertiarycourses.com.sg/wsq-google-associate-cloud-engineer-training.html |
| Certification Reference | https://cloud.google.com/learn/certification/cloud-engineer |

## Course Goal

This course prepares learners to perform the common duties of a Google Associate Cloud Engineer: setting up cloud environments, planning and implementing cloud solutions, operating deployed services, and configuring access and security. The labs are designed as guided practice for real Google Cloud administration tasks and certification readiness.

## Prerequisites

- Basic understanding of cloud computing concepts.
- Familiarity with command-line tools.
- Basic networking knowledge such as IP addresses, subnets, DNS, and firewalls.
- Access to a Google Cloud training account, sandbox, or free trial.
- Billing budget or instructor-provided cost controls enabled before creating resources.

## Learning Outcomes

By the end of the course, learners should be able to:

- Create and organize Google Cloud projects.
- Configure billing, budgets, labels, IAM principals, and service accounts.
- Use Google Cloud Console, Cloud Shell, and the Google Cloud CLI.
- Configure VPC networks, subnets, firewall rules, DNS, NAT, and load balancing.
- Deploy Compute Engine workloads using instance templates and managed instance groups.
- Use Cloud Storage and managed database services with backup and lifecycle controls.
- Deploy container and serverless workloads with GKE and Cloud Run.
- Monitor, log, troubleshoot, and secure Google Cloud resources.
- Map hands-on tasks to Associate Cloud Engineer exam domains.

## Recommended Course Flow

### Day 1 - Core Google Cloud Administration

1. Course briefing and Google Cloud certification overview.
2. Lab 01: Google Cloud Foundations, Projects, Billing, IAM.
3. Lab 02: Cloud Shell, `gcloud`, Resource Management.
4. Lab 03: VPC Networking, Firewall, DNS, Load Balancing.
5. Lab 04: Compute Engine, Instance Groups, Autoscaling.
6. Day 1 review and troubleshooting clinic.

### Day 2 - Deployment, Operations, and Security

1. Recap of Day 1 and cloud architecture discussion.
2. Lab 05: Storage, Databases, Backup, Lifecycle.
3. Lab 06: Containers, Serverless, Deployment.
4. Lab 07: Operations, Monitoring, Logging, Troubleshooting.
5. Lab 08: Security, Access, Capstone, Exam Review.
6. Final cleanup, exam readiness checklist, and next steps.

## Lab Environment Setup

### Step 1 - Confirm Account Access

1. Open https://console.cloud.google.com/.
2. Sign in using the account provided by your instructor or your own Google account.
3. Confirm that you can access the project selector at the top of the console.
4. If you are using a personal free trial, confirm that billing is enabled.
5. If you are using an instructor sandbox, follow the instructor's project naming convention.

### Step 2 - Set a Budget Alert

1. In the Google Cloud Console, search for `Billing`.
2. Open the billing account linked to your lab project.
3. Select `Budgets & alerts`.
4. Create a small budget for the lab environment.
5. Add alert thresholds such as 50 percent, 90 percent, and 100 percent.
6. Save the budget before creating compute or networking resources.

### Step 3 - Open Cloud Shell

1. Click the Cloud Shell icon in the Google Cloud Console.
2. Wait for the terminal to initialize.
3. Run:

```bash
gcloud auth list
gcloud config list
```

4. Confirm that the active account and project are correct.
5. Set a default region and zone:

```bash
gcloud config set compute/region asia-southeast1
gcloud config set compute/zone asia-southeast1-b
```

### Step 4 - Create a Lab Notes File

1. In Cloud Shell, create a notes file:

```bash
touch ace-lab-notes.md
```

2. Record the project ID, region, zone, and important resource names.
3. Add notes after every lab, especially commands that failed and how you fixed them.

## Lab Completion Standard

For each lab, learners should complete the following:

1. Follow all guided steps.
2. Capture screenshots or command outputs requested by the instructor.
3. Answer the checkpoint questions.
4. Clean up resources unless the next lab explicitly reuses them.
5. Record one exam-style takeaway.

## Safety and Cost Guidelines

- Use small machine types such as `e2-micro` or `e2-small` where possible.
- Delete unused VM instances, static IP addresses, disks, load balancers, and clusters.
- Avoid creating large GKE clusters unless instructed.
- Do not grant broad roles such as `Owner` unless a lab specifically explains why it is risky.
- Do not store secrets in plain text files or shell history.
- Always review IAM and firewall settings before leaving the lab.

## Assessment Activities

Learners should demonstrate:

- Correct use of Cloud Console and Cloud Shell.
- Accurate `gcloud` configuration and command execution.
- Ability to explain resource hierarchy and IAM role choices.
- Ability to deploy a simple workload and expose it securely.
- Ability to use monitoring and logs to troubleshoot a service.
- Ability to identify cleanup steps and cost risks.

## Final Exam Readiness Checklist

Before attempting the Associate Cloud Engineer exam, confirm that you can:

- Explain projects, folders, organizations, billing accounts, and labels.
- Create and manage IAM policies, service accounts, and least privilege access.
- Configure VPC networks, firewall rules, routes, DNS, NAT, and load balancers.
- Deploy and maintain Compute Engine, GKE, Cloud Run, Cloud Storage, and Cloud SQL resources.
- Monitor resource health, read logs, create alerts, and troubleshoot incidents.
- Choose appropriate managed services for common business requirements.
- Clean up or resize resources to control cost.
- Recognize where Google Cloud AI-assisted tooling can support routine cloud tasks.
