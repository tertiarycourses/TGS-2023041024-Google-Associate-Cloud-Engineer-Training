#!/usr/bin/env bash
set -euo pipefail
gcloud compute networks create ace-vpc --subnet-mode=custom
gcloud compute networks subnets create app-sg --network=ace-vpc --region=asia-southeast1 --range=10.20.0.0/24 --enable-private-ip-google-access
gcloud compute firewall-rules create allow-web-internal --network=ace-vpc --allow=tcp:80 --source-ranges=10.20.0.0/16 --target-tags=web --enable-logging
