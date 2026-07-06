# Lab 02 - Cloud Shell, gcloud, Resource Management

## Objectives

- Use Cloud Shell for administration.
- Configure default project, region, and zone.
- Enable Google Cloud APIs.
- Inspect resources with `gcloud`.
- Understand when to use Console, CLI, and automation.

## Scenario

Your team wants repeatable administration steps. You will use Cloud Shell and the Google Cloud CLI to inspect and configure a lab project.

## Steps

### 1. Open Cloud Shell

1. Open the Google Cloud Console.
2. Click the Cloud Shell icon.
3. Wait for the shell prompt.
4. Confirm the active identity:

```bash
gcloud auth list
```

### 2. Configure Defaults

1. Set the project:

```bash
gcloud config set project PROJECT_ID
```

2. Set default region and zone:

```bash
gcloud config set compute/region asia-southeast1
gcloud config set compute/zone asia-southeast1-b
```

3. Validate settings:

```bash
gcloud config list
```

### 3. Enable Required APIs

1. List enabled services:

```bash
gcloud services list --enabled
```

2. Enable common lab APIs:

```bash
gcloud services enable compute.googleapis.com
gcloud services enable monitoring.googleapis.com
gcloud services enable logging.googleapis.com
```

3. Confirm the services are enabled:

```bash
gcloud services list --enabled --filter="compute OR monitoring OR logging"
```

### 4. Inspect Project Metadata

1. Describe the project:

```bash
gcloud projects describe PROJECT_ID
```

2. View IAM policy:

```bash
gcloud projects get-iam-policy PROJECT_ID
```

3. List service accounts:

```bash
gcloud iam service-accounts list
```

### 5. Use Cloud Shell Editor

1. Open Cloud Shell Editor.
2. Create a file named `ace-resource-notes.md`.
3. Add your project ID, region, zone, and enabled APIs.
4. Save the file.

### 6. Compare Admin Methods

1. Locate the same settings in the Google Cloud Console.
2. Compare the Console view with CLI output.
3. Discuss which method is better for one-time learning and which is better for repeatable operations.

## Checkpoint Questions

1. Why should default region and zone be configured?
2. What happens if an API is disabled?
3. What is the risk of running commands against the wrong project?
4. Why is CLI output useful during troubleshooting?

## Cleanup

No cleanup is required unless you enabled APIs that your instructor asks you to disable.

## Exam Focus

Expect exam scenarios that require selecting the right command, confirming active configuration, and enabling services before deployment.
