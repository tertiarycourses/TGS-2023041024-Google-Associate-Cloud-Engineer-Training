# Lab 06 - Containers, Serverless, Deployment

## Objectives

- Understand Artifact Registry, GKE, and Cloud Run.
- Deploy a simple Cloud Run service.
- Review container deployment settings.
- Compare container orchestration with serverless deployment.
- Practice revision and traffic concepts.

## Scenario

Your application team wants to run a containerized web service. You will deploy a simple service using Cloud Run and compare it with GKE concepts.

## Steps

### 1. Enable Required APIs

In Cloud Shell, run:

```bash
gcloud services enable run.googleapis.com
gcloud services enable artifactregistry.googleapis.com
gcloud services enable cloudbuild.googleapis.com
```

### 2. Deploy a Sample Cloud Run Service

1. Use a sample container image:

```bash
gcloud run deploy ace-lab-cloudrun \
  --image us-docker.pkg.dev/cloudrun/container/hello \
  --region asia-southeast1 \
  --platform managed \
  --allow-unauthenticated
```

2. Open the service URL.
3. Confirm the page loads.

### 3. Review Service Settings

1. Open Cloud Run in the Console.
2. Open `ace-lab-cloudrun`.
3. Review:

```text
Revision
Container image
Region
Authentication
Service account
CPU and memory
Minimum and maximum instances
```

### 4. Create a New Revision

1. Edit and deploy a new revision.
2. Change an environment variable such as:

```text
LAB_VERSION=2
```

3. Deploy the revision.
4. Review revision history.

### 5. Review Traffic Splitting

1. Open the Cloud Run service revisions.
2. Review traffic allocation.
3. Discuss how staged rollout and rollback work.
4. Do not leave unnecessary revisions running with minimum instances.

### 6. Compare with GKE

1. Search for `Kubernetes Engine`.
2. Review cluster, node pool, workload, service, and ingress concepts.
3. Discuss when GKE is appropriate compared with Cloud Run.
4. Do not create a GKE cluster unless instructed because clusters can incur cost.

## Checkpoint Questions

1. Why is Cloud Run useful for stateless web services?
2. What is a revision?
3. When would GKE be more appropriate than Cloud Run?
4. Why should service account permissions be reviewed for deployed workloads?

## Cleanup

Delete the Cloud Run service:

```bash
gcloud run services delete ace-lab-cloudrun --region asia-southeast1
```

## Exam Focus

Deployment scenarios often test whether you can choose Compute Engine, GKE, Cloud Run, App Engine, or managed services based on operational needs.
