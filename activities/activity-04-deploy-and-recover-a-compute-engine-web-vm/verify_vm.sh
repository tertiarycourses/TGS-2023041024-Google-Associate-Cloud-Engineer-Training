#!/usr/bin/env bash
set -euo pipefail
gcloud compute instances describe web-1 --zone=asia-southeast1-b
gcloud compute instances get-serial-port-output web-1 --zone=asia-southeast1-b --port=1 | tail -80
