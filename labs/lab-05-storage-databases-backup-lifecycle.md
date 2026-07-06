# Lab 05 - Storage, Databases, Backup, Lifecycle

## Objectives

- Create a Cloud Storage bucket.
- Configure access, versioning, and lifecycle rules.
- Review storage classes.
- Create or review Cloud SQL backup settings.
- Choose storage and database services for common scenarios.

## Scenario

Your team needs object storage for application files and a managed relational database for application data. You must configure access and lifecycle controls.

## Steps

### 1. Create a Cloud Storage Bucket

1. Search for `Cloud Storage`.
2. Create a bucket with a globally unique name.
3. Select a region close to your lab region, such as `asia-southeast1`.
4. Choose Standard storage class.
5. Enable uniform bucket-level access.
6. Create the bucket.

### 2. Upload Test Files

1. Upload a small text file.
2. Open the object details.
3. Review object metadata, generation, and storage class.
4. Confirm the object is not publicly accessible unless explicitly allowed.

### 3. Enable Versioning

1. Open the bucket `Protection` settings.
2. Enable object versioning.
3. Upload a changed version of the same file.
4. View object version history.

### 4. Add a Lifecycle Rule

1. Open `Lifecycle`.
2. Add a rule to delete older noncurrent versions after a short training period.
3. Review the rule before saving.
4. Discuss why lifecycle policies matter for cost control.

### 5. Review Cloud SQL

1. Search for `Cloud SQL`.
2. Review available engines such as MySQL, PostgreSQL, and SQL Server.
3. If instructed, create a small Cloud SQL instance.
4. Enable automated backups and point-in-time recovery if available.
5. Review authorized networks and private IP options.

### 6. Compare Data Services

In your notes, map each scenario to a service:

| Scenario | Candidate Service |
| --- | --- |
| Static files and object storage | Cloud Storage |
| Managed relational database | Cloud SQL |
| Globally scalable relational workloads | Cloud Spanner |
| NoSQL document database | Firestore |
| Large analytical warehouse | BigQuery |
| Low-latency wide-column workloads | Bigtable |

## Checkpoint Questions

1. Why should public access be controlled carefully on buckets?
2. What is the benefit of object versioning?
3. How do lifecycle rules reduce cost?
4. When would Cloud SQL be a better fit than a self-managed database on Compute Engine?

## Cleanup

1. Delete test objects and old versions.
2. Delete the bucket if it is no longer needed.
3. Delete any Cloud SQL instance created for the lab.

## Exam Focus

Storage questions often test service selection, access control, backups, lifecycle management, and cost-aware operations.
