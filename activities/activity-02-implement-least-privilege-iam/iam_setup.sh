#!/usr/bin/env bash
set -euo pipefail
SA=app-runtime@$PROJECT_ID.iam.gserviceaccount.com
gcloud iam service-accounts create app-runtime --display-name='ACE app runtime'
gcloud projects add-iam-policy-binding "$PROJECT_ID" --member=serviceAccount:$SA --role=roles/storage.objectViewer
gcloud projects get-iam-policy "$PROJECT_ID" --format=json > iam-policy-after.json
