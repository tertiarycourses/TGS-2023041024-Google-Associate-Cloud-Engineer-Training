# Lab 08 - Security, Access, Capstone, Exam Review

## Objectives

- Review IAM and least privilege.
- Inspect service accounts and firewall exposure.
- Review Secret Manager, Cloud KMS, and Security Command Center concepts.
- Complete a small capstone design.
- Map course activities to exam objectives.

## Scenario

You are asked to review a small Google Cloud environment before handover. The environment must be secure, observable, and cost controlled.

## Steps

### 1. Review IAM Access

1. Open `IAM`.
2. Identify users, groups, and service accounts.
3. Look for broad roles such as `Owner` and `Editor`.
4. For each broad role, propose a more specific predefined role.
5. Record findings in your notes.

### 2. Review Service Accounts

1. Open `Service Accounts`.
2. Identify service accounts created during labs.
3. Check whether any keys exist.
4. Remove unused keys if instructed.
5. Confirm which workloads use each service account.

### 3. Review Firewall Exposure

1. Open `VPC network > Firewall`.
2. Identify rules with source range `0.0.0.0/0`.
3. Confirm whether each rule is required.
4. Tighten or delete unnecessary rules.
5. Confirm SSH is not open broadly unless required for the lab.

### 4. Review Secrets and Encryption

1. Search for `Secret Manager`.
2. Review how secrets are stored and versioned.
3. Search for `Cloud KMS`.
4. Review key rings and crypto keys.
5. Discuss when customer-managed encryption keys are required.

### 5. Review Security Command Center Concepts

1. Search for `Security Command Center`.
2. Review available findings if your environment has access.
3. Discuss how misconfiguration, vulnerability, and threat findings help operations teams.

### 6. Capstone Design

Design a small web application environment with:

```text
Project labels and budget alert
Custom VPC and subnet
HTTP workload on Cloud Run or Compute Engine managed instance group
Cloud Storage bucket for static objects
Least privilege service account
Monitoring dashboard and uptime check
Clear cleanup plan
```

Draw the architecture and write down the reason for each service choice.

### 7. Exam Review Mapping

Map your capstone to the exam skill areas:

| Skill Area | Evidence from Labs |
| --- | --- |
| Set up a cloud solution environment | Projects, billing, labels, APIs, IAM |
| Plan and implement a cloud solution | VPC, compute, storage, deployment |
| Ensure successful operation | Monitoring, logging, alerts, troubleshooting |
| Configure access and security | IAM, service accounts, firewall, secrets |

## Checkpoint Questions

1. What is least privilege?
2. Why should service account keys be avoided where possible?
3. What are common signs of an overly permissive firewall rule?
4. Which services would you choose for a low-operations web application?
5. What cleanup tasks should be completed before closing a lab project?

## Cleanup

Perform a final project cleanup:

1. Delete unused VM instances, instance groups, and templates.
2. Delete Cloud Run services created for labs.
3. Delete unused storage buckets and objects.
4. Delete Cloud SQL instances if created.
5. Delete unused firewall rules.
6. Remove test IAM bindings and service accounts.
7. Review billing reports for unexpected active resources.

## Exam Focus

The exam expects practical judgment. Focus on what a cloud engineer should do first, what is safest, what is least operationally complex, and what best matches the stated requirement.
