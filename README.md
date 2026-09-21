<div align="center">

# Google Associate Cloud Engineer Training

[![Course Code](https://img.shields.io/badge/Course-TGS--2023041024-1f6feb)](https://www.tertiarycourses.com.sg/wsq-google-associate-cloud-engineer-training.html)
![Activities](https://img.shields.io/badge/Activities-10-108a73)
![Version](https://img.shields.io/badge/Courseware-v8.0-6d3fd2)

**Learner-safe course materials for deploying, securing, operating, and troubleshooting Google Cloud workloads.**

[Course page](https://www.tertiarycourses.com.sg/wsq-google-associate-cloud-engineer-training.html) · [Google ACE certification](https://cloud.google.com/learn/certification/cloud-engineer) · [Practice exam](https://exams.tertiaryinfotech.com/practice-exams/google/google-ace)

</div>

## Course details

| Course detail | Information |
|---|---|
| Course title | WSQ - Google Associate Cloud Engineer Training |
| Course code | `TGS-2023041024` |
| Programme | WSQ |
| Duration | 4 days / 32 hours (includes a 2-hour assessment) |
| Courseware version | v8.0 |
| Registration | [View course details and register](https://www.tertiarycourses.com.sg/wsq-google-associate-cloud-engineer-training.html) |
| Funding | Up to 70% SSG funding for eligible applicants. SkillsFuture Credit, PSEA, UTAP and SFEC may also apply. Eligibility and terms apply. |


## About

This repository accompanies the four-day WSQ Google Associate Cloud Engineer Training course delivered by Tertiary Infotech Academy Pte. Ltd. The v8.0 materials use mechanism-led explanations, executable Google Cloud commands, controlled failure tests, and evidence-based verification aligned to the course's K1-K5 knowledge and A1-A6 ability criteria.

The detailed learner procedures are in the [Learner Guide](LG-Google%20Associate%20Cloud%20Engineer%20Training-v8.0.md). Each hands-on exercise is named an **Activity** and has its own folder containing a PDF guide plus mock data, scripts, or configuration files.

## Learning outcomes

- Set up and operate a safe Google Cloud training environment with project, billing, identity, and API controls.
- Plan and implement compute, storage, database, container, serverless, and networking solutions.
- Diagnose failures with resource state, IAM, connectivity, logs, metrics, quotas, and service-specific evidence.
- Test availability and scaling behaviour, apply bounded remediation, and prepare an escalation evidence pack.

## Activity catalogue

| Activity | Work product | Duration |
| --- | --- | ---: |
| [01 - Create a Safe Google Cloud Training Environment](activities/activity-01-create-a-safe-google-cloud-training-environment/) | Account, project, billing guardrails, API and CLI evidence | 75 min |
| [02 - Implement Least-Privilege IAM](activities/activity-02-implement-least-privilege-iam/) | IAM before/after policies and allowed/denied tests | 75 min |
| [03 - Build and Diagnose a Custom VPC](activities/activity-03-build-and-diagnose-a-custom-vpc/) | Network inventory, connectivity test, firewall evidence | 90 min |
| [04 - Deploy and Recover a Compute Engine Web VM](activities/activity-04-deploy-and-recover-a-compute-engine-web-vm/) | Startup logs, snapshot, recovery verification | 90 min |
| [05 - Operate Cloud Storage and Diagnose Cloud SQL](activities/activity-05-operate-cloud-storage-and-diagnose-cloud-sql/) | Lifecycle policy, query evidence, incident report | 105 min |
| [06 - Model Hybrid Connectivity and BGP Failure](activities/activity-06-model-hybrid-connectivity-and-bgp-failure/) | Connectivity decision, route analysis, corrected configuration | 90 min |
| [07 - Build a Pub/Sub to Cloud Run Event Pipeline](activities/activity-07-build-a-pub-sub-to-cloud-run-event-pipeline/) | Revision, subscription/trigger, processed-event log | 105 min |
| [08 - Deploy and Test a GKE Autopilot Workload](activities/activity-08-deploy-and-test-a-gke-autopilot-workload/) | Kubernetes manifests, load results, HPA evidence | 120 min |
| [09 - Create Monitoring Evidence and an Incident Pack](activities/activity-09-create-monitoring-evidence-and-an-incident-pack/) | Alert policy, incident timeline, filtered logs | 90 min |
| [10 - Load Test a Managed Instance Group and Escalate](activities/activity-10-load-test-a-managed-instance-group-and-escalate/) | Load results, MIG/autoscaler evidence, escalation report | 120 min |

## Courseware

The full v8.0 course package is published in this repository:

| Item | Editable | Rendered |
|---|---|---|
| Slide deck | [PPT v8.0 (.pptx)](courseware/PPT-Google%20Associate%20Cloud%20Engineer%20Training-v8.0.pptx) | [PPT v8.0 (.pdf)](courseware/PPT-Google%20Associate%20Cloud%20Engineer%20Training-v8.0.pdf) |
| Learner Guide | [LG v8.0 (.docx)](courseware/LG-Google%20Associate%20Cloud%20Engineer%20Training-v8.0.docx) | [LG v8.0 (.pdf)](courseware/LG-Google%20Associate%20Cloud%20Engineer%20Training-v8.0.pdf) |
| Lesson Plan | [LP v8.0 (.docx)](courseware/LP-Google%20Associate%20Cloud%20Engineer%20Training-v8.0.docx) | [LP v8.0 (.pdf)](courseware/LP-Google%20Associate%20Cloud%20Engineer%20Training-v8.0.pdf) |

A Markdown mirror of the Learner Guide is at [LG v8.0 (.md)](LG-Google%20Associate%20Cloud%20Engineer%20Training-v8.0.md). Slide and content build metadata are in [build/slide_map.json](build/slide_map.json) and [build/technical_anchor_inventory.json](build/technical_anchor_inventory.json). Deck imagery is in [courseware/assets/](courseware/assets/).


## Evidence workflow

```text
scope -> configure -> observe -> controlled failure -> diagnose
      -> remediate -> retest -> capture evidence -> clean up
```

A successful command is not sufficient evidence by itself. Record the active identity and project, resource configuration, expected and observed output, UTC timestamp, failure diagnosis, remediation result, and final billable-resource inventory.

## Safety and cost controls

- Use only the assigned training project or trainer-approved sandbox.
- Confirm the active account, project, region, and zone before every mutation.
- Never commit credentials, access tokens, private keys, payment details, or screenshots containing them.
- Create budget alerts before billable resources; remember that alerts do not cap spending.
- Stop or delete billable resources as directed and verify the final inventory.
- Use the supplied mock-data path when live provisioning is not approved.

## Repository structure

```text
.
├── README.md
├── LG-Google Associate Cloud Engineer Training-v8.0.md
├── courseware/
│   ├── PPT-Google Associate Cloud Engineer Training-v8.0.pptx / .pdf
│   ├── LG-Google Associate Cloud Engineer Training-v8.0.docx / .pdf
│   ├── LP-Google Associate Cloud Engineer Training-v8.0.docx / .pdf
│   └── assets/
├── build/
│   ├── slide_map.json
│   └── technical_anchor_inventory.json
└── activities/
    ├── activity-01-create-a-safe-google-cloud-training-environment/
    │   ├── Activity 01 Guide.pdf
    │   ├── README.md
    │   └── mock data and scripts
    └── ... activity-10 ...
```

Trainer answer keys, assessment administration files, source references, build tooling, QA renders, and local environment files are deliberately excluded from this public repository.

## References

- [Google Cloud documentation](https://docs.cloud.google.com/docs)
- [Get started with Google Cloud](https://docs.cloud.google.com/docs/get-started)
- [Associate Cloud Engineer exam guide](https://cloud.google.com/learn/certification/guides/cloud-engineer)
- [Google Cloud codelabs](https://codelabs.developers.google.com/cloud)
- [Google Skills learning path](https://www.skills.google/paths/8)

## Developed by

[Tertiary Infotech Academy Pte. Ltd.](https://www.tertiarycourses.com.sg/) · Singapore

