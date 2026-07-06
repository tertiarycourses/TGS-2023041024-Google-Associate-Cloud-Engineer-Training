# Lab 01 - Google Cloud Foundations, Projects, Billing, IAM

## Objectives

- Navigate the Google Cloud Console.
- Identify the resource hierarchy.
- Create or select a lab project.
- Configure billing awareness and budget alerts.
- Review IAM principals, roles, and service accounts.
- Apply labels for governance and cost tracking.

## Scenario

You are preparing a new Google Cloud project for a small application team. The project must have billing controls, clear labels, and least privilege access.

## Steps

### 1. Select or Create a Project

1. Open https://console.cloud.google.com/.
2. Open the project selector.
3. Select the instructor-provided lab project or create a new project.
4. Record the project ID in your lab notes.
5. Confirm that the project appears in the top navigation bar.

### 2. Review Billing

1. Search for `Billing`.
2. Confirm the project is linked to a billing account.
3. Open `Budgets & alerts`.
4. Create a small budget for the lab environment.
5. Add alert thresholds at 50 percent, 90 percent, and 100 percent.

### 3. Add Project Labels

1. Search for `Manage resources`.
2. Select your project.
3. Add labels such as:

```text
course=ace
environment=lab
owner=<your-name>
```

4. Save the labels.

### 4. Review IAM

1. Search for `IAM`.
2. Review existing principals and roles.
3. Identify which accounts have broad roles such as `Owner`, `Editor`, or `Viewer`.
4. Discuss why predefined and custom roles are preferred over broad primitive roles.

### 5. Create a Service Account

1. Search for `Service Accounts`.
2. Create a service account named `ace-lab-sa`.
3. Add a description explaining that it is for lab workloads.
4. Grant only the role required by your instructor or leave permissions blank for now.
5. Do not create a JSON key unless specifically required.

### 6. Validate with Cloud Shell

1. Open Cloud Shell.
2. Run:

```bash
gcloud config get-value project
gcloud projects describe $(gcloud config get-value project)
gcloud iam service-accounts list
```

3. Confirm the project and service account details.

## Checkpoint Questions

1. What is the difference between a project ID and a project name?
2. Why should lab projects use budget alerts?
3. Why are service account keys considered sensitive?
4. When would you use labels instead of folders?

## Cleanup

Keep the project, labels, and service account if you will continue with the next lab. Remove any service account keys if you accidentally created them.

## Exam Focus

Associate Cloud Engineers must be comfortable setting up projects, billing, IAM, and governance basics before deploying resources.
