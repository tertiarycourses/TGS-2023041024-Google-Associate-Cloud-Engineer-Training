# Google Associate Cloud Engineer Training Learner Guide

Course code: `TGS-2023041024`  
Version: v8.0 · 12 September 2026

## Learning outcomes

- LO1: Set up and test Google Cloud solutions in accordance with security standards.
- LO2: Detect and resolve Google Cloud integration issues using technical solutions and database administration techniques.
- LO3: Conduct implementation tests against defined metrics and escalate unresolved Google Cloud issues with evidence.

## Google Cloud account and console setup

1. Open https://cloud.google.com/ and select Get started for free. Sign in with a Google Account you control. Create one first if required, then enable multi-factor authentication in the Google Account security settings.
2. Review the current trial eligibility, country, payment and automatic-upgrade terms. Do not use a corporate billing account unless your organisation has approved the training spend.
3. Accept the Google Cloud terms. If prompted, create a Cloud Billing account and add the required payment method. Record only the billing account name; never place card details in an activity submission.
4. Open https://console.cloud.google.com/. Use the project selector at the top and choose New Project. Name it ace-training-<your initials>. Copy the generated project ID exactly; the display name and project ID are different.
5. From Billing, link only the new training project to the training billing account. Verify the Billing overview names the same project ID.
6. From Billing > Budgets & alerts, create ACE training budget. Set a deliberately small amount agreed by the trainer and add thresholds at 50%, 90% and 100%. Remember that a budget alerts but does not stop spending.
7. Open Cloud Shell from the console header. Wait for the terminal prompt, then run gcloud auth list. Confirm the active identity is yours.
8. Set PROJECT_ID to the copied project ID, export it for this shell, and run gcloud config set project $PROJECT_ID. Run gcloud config list and confirm both account and project.
9. Enable the Compute Engine, Service Usage, Cloud Logging and Cloud Monitoring APIs. Wait for the operation to finish and list enabled services.
10. Run the supplied check_environment.sh. Save its output as environment-check.txt. Capture the project ID, billing enabled state, enabled APIs and timestamp.
11. Negative test: switch the script to a deliberately invalid project ID and record the error. Restore the correct project immediately. Explain how this test prevents accidental work in the wrong project.
12. Open Billing reports and record the current cost baseline. Remove any test resource created accidentally. Keep the project for subsequent activities.

## Topic 1 Google Cloud and Cloud Computing

Mapped criteria: A2 · K3

### Projects as operating and trust boundaries

Architecture: Project ID, enabled APIs, billing link, IAM policy.

Runtime trace: create -> link billing -> enable API -> deploy -> verify.

```text
gcloud projects describe $PROJECT_ID
gcloud services list --enabled --project=$PROJECT_ID
```

Acceptance evidence: Project state is ACTIVE; intended APIs are enabled; resources resolve to the same project ID.

Failure modes: wrong active project; billing not linked; API disabled.

### Regions, zones and resource scope

Architecture: global resources, region, zone, multi-region.

Runtime trace: requirement -> scope check -> location choice -> deploy -> failover test.

```text
gcloud compute zones list --filter='region:(asia-southeast1)'
gcloud compute regions describe asia-southeast1
```

Acceptance evidence: Location choice matches latency, residency and availability requirements.

Failure modes: zonal single point; unsupported service location; cross-region egress.

### Shared-responsibility control map

Architecture: Google infrastructure, managed service, customer configuration, customer data.

Runtime trace: classify service -> assign owner -> set control -> collect evidence -> review.

```text
gcloud asset search-all-resources --scope=projects/$PROJECT_NUMBER --format='table(assetType,location)'
```

Acceptance evidence: Every resource has an accountable owner and a testable configuration control.

Failure modes: assuming managed means secured; unowned data; no evidence trail.

### Console, Cloud Shell and local CLI surfaces

Architecture: Cloud console, Cloud Shell, gcloud CLI, REST API.

Runtime trace: authenticate -> select config -> issue request -> receive operation -> inspect result.

```text
gcloud auth list
gcloud config configurations list
gcloud config list
```

Acceptance evidence: The intended account and project are active before any mutation.

Failure modes: wrong account; wrong configuration; expired credentials.

### API enablement and service identities

Architecture: Service Usage API, service agent, IAM grant, service endpoint.

Runtime trace: request enable -> long-running operation -> service agent created -> permission checked -> API ready.

```text
gcloud services enable compute.googleapis.com monitoring.googleapis.com logging.googleapis.com
```

Acceptance evidence: Enabled service appears in the service list and its agent receives only documented roles.

Failure modes: SERVICE_DISABLED; permission denied; quota project mismatch.

### Billing attachment and budget signals

Architecture: billing account, project, budget, notification channel.

Runtime trace: link -> record baseline -> set thresholds -> emit forecast -> act.

```text
gcloud billing projects describe $PROJECT_ID
gcloud billing budgets list --billing-account=$BILLING_ACCOUNT
```

Acceptance evidence: Billing is enabled and budget thresholds are visible before billable resources are created.

Failure modes: budget is not a cap; closed account; wrong currency assumption.

### Installation test pyramid for cloud resources

Architecture: configuration test, connectivity test, load test, failover test.

Runtime trace: define expected -> deploy -> observe -> compare -> record.

```text
gcloud asset search-all-resources --scope=projects/$PROJECT_NUMBER --format=json > inventory.json
```

Acceptance evidence: Each test has expected output, observed output, timestamp and owner.

Failure modes: test without baseline; single happy path; no rollback.

### ACE task-domain traceability

Architecture: environment 20%, planning 17.5%, deploying 25%, operations 20%, security 17.5%.

Runtime trace: read objective -> map service -> practice command -> diagnose failure -> verify evidence.

```text
gcloud version
gcloud info --format='value(config.paths.global_config_dir)'
```

Acceptance evidence: Practice covers both console interpretation and CLI evidence across all five exam domains.

Failure modes: memorising product names; ignoring operations; no hands-on evidence.

### Activity 01 Create a Safe Google Cloud Training Environment

Create an account, project, billing guardrails and CLI configuration, then prove the environment is safe to use.

Submit: environment-check.txt, budget-policy.json and a project inventory

1. Open https://cloud.google.com/ and select Get started for free. Sign in with a Google Account you control. Create one first if required, then enable multi-factor authentication in the Google Account security settings.
2. Review the current trial eligibility, country, payment and automatic-upgrade terms. Do not use a corporate billing account unless your organisation has approved the training spend.
3. Accept the Google Cloud terms. If prompted, create a Cloud Billing account and add the required payment method. Record only the billing account name; never place card details in an activity submission.
4. Open https://console.cloud.google.com/. Use the project selector at the top and choose New Project. Name it ace-training-<your initials>. Copy the generated project ID exactly; the display name and project ID are different.
5. From Billing, link only the new training project to the training billing account. Verify the Billing overview names the same project ID.
6. From Billing > Budgets & alerts, create ACE training budget. Set a deliberately small amount agreed by the trainer and add thresholds at 50%, 90% and 100%. Remember that a budget alerts but does not stop spending.
7. Open Cloud Shell from the console header. Wait for the terminal prompt, then run gcloud auth list. Confirm the active identity is yours.
8. Set PROJECT_ID to the copied project ID, export it for this shell, and run gcloud config set project $PROJECT_ID. Run gcloud config list and confirm both account and project.
9. Enable the Compute Engine, Service Usage, Cloud Logging and Cloud Monitoring APIs. Wait for the operation to finish and list enabled services.
10. Run the supplied check_environment.sh. Save its output as environment-check.txt. Capture the project ID, billing enabled state, enabled APIs and timestamp.
11. Negative test: switch the script to a deliberately invalid project ID and record the error. Restore the correct project immediately. Explain how this test prevents accidental work in the wrong project.
12. Open Billing reports and record the current cost baseline. Remove any test resource created accidentally. Keep the project for subsequent activities.

## Topic 2 GCP Basics and IAM

Mapped criteria: A1 · K1

### Resource hierarchy and inherited policy

Architecture: organization, folder, project, service resource.

Runtime trace: attach policy -> inherit downward -> combine bindings -> evaluate deny -> authorize.

```text
gcloud projects get-iam-policy $PROJECT_ID --format=json
```

Acceptance evidence: Effective access includes direct and inherited allow policies, then applies applicable deny constraints.

Failure modes: granting at too-wide scope; hidden inherited role; project outside organization.

### IAM authorization tuple

Architecture: principal, role, resource, allow policy.

Runtime trace: authenticate -> resolve permission -> collect policies -> evaluate -> allow or deny.

```text
gcloud projects add-iam-policy-binding $PROJECT_ID --member=user:learner@example.com --role=roles/viewer
```

Acceptance evidence: Binding identifies one principal, one role and the narrowest practical resource scope.

Failure modes: basic Owner role; misspelled principal; binding on wrong project.

### Predefined, custom and basic roles

Architecture: permissions, predefined role, custom role, basic role.

Runtime trace: list required actions -> map permissions -> select role -> grant -> retest.

```text
gcloud iam roles describe roles/storage.objectViewer
gcloud iam roles list --project=$PROJECT_ID
```

Acceptance evidence: Selected role contains required permissions without unrelated administrative power.

Failure modes: role drift; unsupported custom permission; basic role in production.

### Service accounts as workload principals

Architecture: service account, attached workload, access token, target API.

Runtime trace: workload identity -> metadata token -> IAM check -> API call -> audit log.

```text
gcloud iam service-accounts create app-runtime --display-name='App runtime'
gcloud projects add-iam-policy-binding $PROJECT_ID --member=serviceAccount:app-runtime@$PROJECT_ID.iam.gserviceaccount.com --role=roles/storage.objectViewer
```

Acceptance evidence: Workload uses an attached user-managed service account; no long-lived key file is required.

Failure modes: default service account; downloaded key; token audience mismatch.

### Service account impersonation

Architecture: operator, Token Creator role, short-lived token, target service account.

Runtime trace: authenticate operator -> authorize impersonation -> mint token -> call API -> expire.

```text
gcloud auth print-access-token --impersonate-service-account=app-runtime@$PROJECT_ID.iam.gserviceaccount.com
```

Acceptance evidence: Token is short-lived and the impersonation event is auditable.

Failure modes: missing Token Creator; self-impersonation confusion; cached wrong identity.

### Organization policy and deny guardrails

Architecture: constraint, policy rule, resource hierarchy, enforcement result.

Runtime trace: define constraint -> set policy -> inherit -> evaluate request -> block or allow.

```text
gcloud resource-manager org-policies describe constraints/compute.vmExternalIpAccess --project=$PROJECT_ID
```

Acceptance evidence: Policy state and inheritance explain why a request is allowed or rejected.

Failure modes: constraint unset; policy attached above project; exception not documented.

### IAM Conditions and time-bound access

Architecture: role binding, CEL expression, request context, resource.

Runtime trace: request -> evaluate time/resource -> grant conditional -> audit -> expire.

```text
gcloud projects get-iam-policy $PROJECT_ID --format='table(bindings.role,bindings.members,bindings.condition)'
```

Acceptance evidence: Condition title, expression and scope match the intended temporary access window.

Failure modes: condition on unsupported role; timezone error; broad inherited grant remains.

### Audit evidence for access changes

Architecture: Admin Activity log, principalEmail, methodName, resourceName.

Runtime trace: change policy -> write audit log -> route -> query -> review.

```text
gcloud logging read 'protoPayload.methodName:SetIamPolicy' --limit=20 --format=json
```

Acceptance evidence: Evidence identifies who changed which policy, when, and on which resource.

Failure modes: query too broad; wrong project; data-access logs not enabled where needed.

### Activity 02 Implement Least-Privilege IAM

Create a workload service account, grant a narrow role and verify both allowed and denied actions.

Submit: iam-policy-before.json, iam-policy-after.json and access-test.txt

1. Set PROJECT_ID and save the current project IAM policy as iam-policy-before.json.
2. Create the user-managed service account app-runtime using the supplied script.
3. Grant only roles/storage.objectViewer at project scope. Do not grant Owner or Editor.
4. Save the new policy as iam-policy-after.json and compare the two files.
5. Use IAM Policy Troubleshooter or a dry-run access test to check that the service account can read object metadata.
6. Attempt a storage object delete with the service account. Record the expected permission-denied result.
7. Inspect Cloud Audit Logs for the SetIamPolicy call and record principalEmail, methodName and resourceName.
8. Remove any temporary human test binding. Keep the service account for Activities 4 and 7.

## Topic 3 Virtual Networks

Mapped criteria: A3 · K4

### Global VPC and regional subnet model

Architecture: global VPC, regional subnet, route table, firewall policy.

Runtime trace: select network -> allocate CIDR -> attach interface -> route packet -> enforce firewall.

```text
gcloud compute networks create ace-vpc --subnet-mode=custom
gcloud compute networks subnets create app-sg --network=ace-vpc --region=asia-southeast1 --range=10.20.0.0/24
```

Acceptance evidence: Subnet range is unique, regional and visible in the intended global VPC.

Failure modes: overlapping CIDR; auto-mode surprise; wrong region.

### CIDR capacity and reserved addresses

Architecture: prefix length, host bits, primary range, secondary range.

Runtime trace: choose capacity -> exclude overlap -> reserve platform addresses -> assign -> monitor growth.

```text
python3 -c 'import ipaddress; n=ipaddress.ip_network("10.20.0.0/24"); print(n.num_addresses)'
```

Acceptance evidence: Address plan records total range, usable design capacity and expansion path.

Failure modes: undersized subnet; overlap with on-prem; secondary range omitted for GKE.

### Route selection and next hops

Architecture: destination prefix, priority, next hop, instance interface.

Runtime trace: collect matching routes -> longest prefix -> priority -> next hop -> deliver.

```text
gcloud compute routes list --filter='network:ace-vpc' --format='table(name,destRange,priority,nextHopGateway,nextHopInstance)'
```

Acceptance evidence: The winning route has the most specific destination, then the applicable priority.

Failure modes: missing custom route; asymmetric return; route exists but firewall denies.

### Firewall policy evaluation

Architecture: direction, priority, target, source/destination, protocol and port.

Runtime trace: select applicable rules -> lowest priority number -> evaluate action -> log decision -> allow or deny.

```text
gcloud compute firewall-rules create allow-web --network=ace-vpc --direction=INGRESS --priority=1000 --action=ALLOW --rules=tcp:80 --source-ranges=10.20.0.0/16 --target-tags=web
```

Acceptance evidence: Rule target and source range are narrower than 0.0.0.0/0 and firewall logging can prove the decision.

Failure modes: wrong network tag; higher-priority deny; implied ingress deny.

### Private Google Access and Cloud NAT

Architecture: internal-only VM, subnet setting, Google APIs, Cloud NAT.

Runtime trace: resolve destination -> select private access or NAT -> translate egress -> return -> log.

```text
gcloud compute networks subnets update app-sg --region=asia-southeast1 --enable-private-ip-google-access
```

Acceptance evidence: VM without external IP can reach intended Google APIs; general internet egress uses controlled NAT.

Failure modes: no default route; PGA disabled; NAT port exhaustion.

### VPC Flow Logs as packet evidence

Architecture: 5-tuple, reporter, bytes, action context.

Runtime trace: sample flow -> aggregate -> write log -> query -> correlate.

```text
gcloud logging read 'logName:vpc_flows AND jsonPayload.connection.src_ip="10.20.0.10"' --limit=20
```

Acceptance evidence: Flow record supports a connectivity hypothesis with source, destination, ports and bytes.

Failure modes: sampling hides short flow; query wrong log bucket; firewall log confused with flow log.

### Shared VPC ownership boundaries

Architecture: host project, service project, shared subnet, service agent.

Runtime trace: share network -> delegate subnet -> attach workload -> enforce central policy -> audit.

```text
gcloud compute shared-vpc get-host-project $PROJECT_ID
```

Acceptance evidence: Network ownership and workload ownership are separately documented and permissioned.

Failure modes: service project not associated; missing networkUser role; subnet in wrong host.

### Connectivity Tests diagnostic graph

Architecture: source endpoint, configuration analysis, data plane probe, result path.

Runtime trace: define endpoints -> analyze config -> optional probe -> identify hop -> recommend fix.

```text
gcloud network-management connectivity-tests list --format='table(name,source, destination)'
```

Acceptance evidence: Test result names the failing hop or policy instead of relying on ping alone.

Failure modes: ICMP blocked but TCP works; stale test; source identity lacks visibility.

### Activity 03 Build and Diagnose a Custom VPC

Build a custom VPC and regional subnets, apply narrow firewall rules and diagnose a failed connection.

Submit: network inventory, connectivity-test result and firewall evidence

1. Set the correct project and region asia-southeast1.
2. Review network_plan.csv and confirm neither CIDR overlaps the default network or an assigned corporate range.
3. Run network_setup.sh to create ace-vpc and app-sg.
4. Create data-sg from the plan using a separate gcloud command.
5. List the VPC, subnets, routes and firewall rules; save the tables as network-inventory.txt.
6. Create two small test VMs without external IP addresses, one tagged web and one untagged.
7. Serve a test page on the tagged VM and test TCP 80 from the second VM.
8. Remove the web tag temporarily and repeat the test. Record the failure and identify the target mismatch.
9. Restore the tag and create a Network Intelligence Center Connectivity Test between the endpoints.
10. Enable or inspect firewall logging and preserve the allow/deny evidence.
11. Stop the VMs after testing; keep the network for later activities.

## Topic 4 Virtual Machines

Mapped criteria: A3 · K4

### Instance contract and dependencies

Architecture: machine type, boot disk image, NIC, service account.

Runtime trace: validate quota -> allocate disk and NIC -> boot -> run guest agent -> report status.

```text
gcloud compute instances create web-1 --zone=asia-southeast1-b --machine-type=e2-micro --subnet=app-sg --no-address --service-account=app-runtime@$PROJECT_ID.iam.gserviceaccount.com --scopes=cloud-platform
```

Acceptance evidence: Instance RUNNING state is paired with the intended zone, network, disk and service account.

Failure modes: quota exceeded; image unavailable; subnet region mismatch.

### Machine families and right-sizing

Architecture: general purpose, compute optimized, memory optimized, accelerator.

Runtime trace: measure workload -> select family -> choose vCPU/RAM -> benchmark -> resize.

```text
gcloud compute machine-types describe e2-standard-2 --zone=asia-southeast1-b
```

Acceptance evidence: Selection is justified by measured CPU, memory, latency and cost constraints.

Failure modes: CPU platform assumption; oversizing; quota not available in zone.

### Images, snapshots and persistent disks

Architecture: image family, boot disk, snapshot, new disk.

Runtime trace: write blocks -> quiesce -> snapshot -> restore -> verify filesystem.

```text
gcloud compute disks snapshot web-1 --zone=asia-southeast1-b --snapshot-names=web-1-prechange
```

Acceptance evidence: Snapshot has a source disk, creation time and restorable status before a risky change.

Failure modes: crash-consistent only; wrong source disk; snapshot schedule absent.

### Startup scripts and metadata execution

Architecture: instance metadata, guest agent, startup script, serial console.

Runtime trace: boot -> read metadata -> execute script -> emit log -> serve workload.

```text
gcloud compute instances add-metadata web-1 --zone=asia-southeast1-b --metadata-from-file=startup-script=startup.sh
```

Acceptance evidence: Serial console or journal output proves script execution and idempotent configuration.

Failure modes: script not executable; package repository unavailable; non-idempotent rerun.

### OS Login and SSH authorization

Architecture: IAM principal, OS Login role, POSIX account, SSH certificate.

Runtime trace: authenticate -> authorize IAM -> provision POSIX -> mint key -> connect.

```text
gcloud compute ssh web-1 --zone=asia-southeast1-b --tunnel-through-iap
```

Acceptance evidence: Access succeeds without exposing TCP 22 publicly and is tied to an identifiable principal.

Failure modes: OS Login disabled; IAP firewall missing; user lacks tunnel role.

### Managed instance group control loop

Architecture: instance template, target size, health check, autoscaler.

Runtime trace: compare desired -> create or recreate -> health probe -> scale -> stabilize.

```text
gcloud compute instance-groups managed list-instances web-mig --region=asia-southeast1
```

Acceptance evidence: All instances are current, healthy and derived from the intended template version.

Failure modes: template drift; health check blocked; autoscaler cool-down too short.

### Spot VM interruption-aware design

Architecture: Spot provision model, termination signal, checkpoint, durable store.

Runtime trace: schedule -> process -> receive termination -> checkpoint -> resume.

```text
gcloud compute instances describe batch-spot --zone=asia-southeast1-b --format='value(scheduling.provisioningModel,scheduling.instanceTerminationAction)'
```

Acceptance evidence: Workload tolerates interruption and persists progress outside the instance.

Failure modes: state on local disk; no retry queue; capacity unavailable.

### VM incident evidence bundle

Architecture: instance status, serial logs, guest metrics, audit change.

Runtime trace: capture inventory -> collect logs -> correlate time -> test hypothesis -> escalate.

```text
gcloud compute instances get-serial-port-output web-1 --zone=asia-southeast1-b --port=1 > serial.log
```

Acceptance evidence: Escalation includes timestamps, recent changes, expected/observed behaviour and exact commands.

Failure modes: reboot before evidence; timezone mismatch; missing reproduction.

### Activity 04 Deploy and Recover a Compute Engine Web VM

Deploy a private web VM with a user-managed service account, test the startup script and recover from a bad change.

Submit: startup logs, a pre-change snapshot and recovery verification

1. Review startup.sh and verify it is idempotent and contains no credentials.
2. Create web-1 in asia-southeast1-b on app-sg without an external IP, attach app-runtime and add the web network tag.
3. Supply startup.sh as instance metadata and wait until the VM is RUNNING.
4. Run verify_vm.sh and inspect the serial output for package and service errors.
5. Connect through IAP or an approved private path; do not create a public SSH rule.
6. Run curl http://localhost and record the expected ACE activity healthy response.
7. Create snapshot web-1-prechange before changing the web page or service configuration.
8. Introduce the trainer-provided harmless configuration fault, restart Nginx and record systemctl plus journal output.
9. Restore the known-good configuration or disk snapshot and repeat the curl test.
10. Save the instance description, startup evidence, snapshot name and recovery result.
11. Stop the VM when finished and verify Billing/Compute inventory.

## Topic 5 Storage and Databases

Mapped criteria: A4 · K5

### Cloud Storage request path

Architecture: bucket, object namespace, IAM, encryption and location.

Runtime trace: authenticate -> authorize -> select object -> read or write -> log.

```text
gcloud storage buckets create gs://$BUCKET --location=asia-southeast1 --uniform-bucket-level-access
```

Acceptance evidence: Bucket location, uniform access and retention requirements are recorded before upload.

Failure modes: globally unique name collision; wrong location; public access prevention conflict.

### Storage class decision rules

Architecture: Standard, Nearline 30d, Coldline 90d, Archive 365d.

Runtime trace: measure access -> choose class -> store -> retrieve -> review lifecycle.

```text
gcloud storage buckets describe gs://$BUCKET --format='value(storageClass,location,type)'
```

Acceptance evidence: Class matches expected access frequency and minimum-duration economics.

Failure modes: early deletion charge; retrieval fee ignored; class used as durability control.

### Lifecycle, versioning and retention

Architecture: lifecycle rule, object age, version state, retention lock.

Runtime trace: evaluate condition -> apply action -> retain evidence -> expire -> audit.

```text
gcloud storage buckets update gs://$BUCKET --lifecycle-file=lifecycle.json
gcloud storage buckets update gs://$BUCKET --versioning
```

Acceptance evidence: Policy JSON is valid and noncurrent versions follow the intended retention window.

Failure modes: delete rule too broad; locked policy irreversible; soft delete cost overlooked.

### Cloud SQL private connectivity

Architecture: Cloud SQL instance, private service access, VPC, client.

Runtime trace: resolve private IP -> route -> authorize IAM or DB user -> TLS session -> query.

```text
gcloud sql instances describe ace-db --format='value(ipAddresses,settings.availabilityType,settings.backupConfiguration.enabled)'
```

Acceptance evidence: Client reaches the private address and database authentication is distinct from network reachability.

Failure modes: network not peered; connection limit; wrong database user.

### Regional HA and failover

Architecture: primary zone, standby zone, synchronous replication, shared endpoint.

Runtime trace: commit -> replicate -> detect primary failure -> promote standby -> reconnect.

```text
gcloud sql instances describe ace-db --format='value(settings.availabilityType,gceZone,secondaryGceZone)'
```

Acceptance evidence: REGIONAL availability and reconnect behaviour are proven by a controlled failover test.

Failure modes: zonal instance; application no retry; long transaction during failover.

### Database observability and query diagnosis

Architecture: Query Insights, CPU and memory metrics, connections, slow query.

Runtime trace: detect latency -> rank query -> inspect plan -> tune -> compare baseline.

```text
gcloud monitoring time-series list --filter='metric.type="cloudsql.googleapis.com/database/cpu/utilization"' --limit=5
```

Acceptance evidence: Before/after latency, rows scanned and connection pressure support the chosen fix.

Failure modes: scale hides bad query; pool leak; index write overhead.

### Managed database selection

Architecture: Cloud SQL, Spanner, Bigtable, Firestore.

Runtime trace: model data -> set consistency -> set scale -> choose interface -> validate.

```text
gcloud sql tiers list --filter='region:asia-southeast1' --format='table(tier,RAM,diskQuota)'
```

Acceptance evidence: Choice is based on transaction model, consistency, access pattern and operational boundary.

Failure modes: product by brand familiarity; relational joins on Bigtable; global scale assumed free.

### Backup, restore and data validation

Architecture: automated backup, point-in-time recovery, restore target, validation query.

Runtime trace: capture backup -> select recovery point -> restore -> run checks -> document RTO/RPO.

```text
gcloud sql backups list --instance=ace-db
gcloud sql operations list --instance=ace-db --limit=10
```

Acceptance evidence: Restored copy passes row-count, checksum and application connection tests.

Failure modes: backup exists but restore untested; PITR log gap; restore over production.

### Activity 05 Operate Cloud Storage and Diagnose Cloud SQL

Apply storage lifecycle controls, load mock customer data and diagnose a simulated Cloud SQL connection bottleneck.

Submit: lifecycle policy, query evidence and database incident report

1. Set BUCKET to a globally unique lower-case name and create a regional bucket with uniform bucket-level access.
2. Upload customers.csv and verify object size, generation and checksum.
3. Apply lifecycle.json only after reviewing the 30-day condition and Nearline action.
4. Enable versioning and upload a corrected copy of one record; list object generations.
5. For the database path, use the trainer-provided Cloud SQL sandbox or mock outputs if live provisioning is not approved.
6. Load the sample customer records into a training table and run row-count and region-grouping validation queries.
7. Run diagnose.sql or interpret the supplied mock results to inspect connection states and slow statements.
8. Reproduce a safe connection-pool saturation symptom with the trainer-provided harness.
9. Apply one bounded remediation such as pool sizing, query index or instance connection limit, then repeat the same test.
10. Document before/after connection count, mean execution time and error rate.
11. Export the final query evidence and database incident report.
12. Delete database resources if individually provisioned; retain only approved shared sandbox assets.

## Topic 6 Interconnecting Networks

Mapped criteria: A4 · K5

### Cloud VPN packet path

Architecture: HA VPN gateway, tunnel, Cloud Router, peer gateway.

Runtime trace: encrypt -> send tunnel -> decrypt -> route by BGP -> deliver.

```text
gcloud compute vpn-tunnels list --format='table(name,region,status,peerIp,router)'
```

Acceptance evidence: Both HA interfaces and BGP sessions meet the intended redundancy design.

Failure modes: single tunnel; shared secret mismatch; selector or route mismatch.

### BGP dynamic route exchange

Architecture: Cloud Router, BGP peer, advertised prefix, learned route.

Runtime trace: establish session -> advertise -> learn -> select route -> withdraw on failure.

```text
gcloud compute routers get-status ace-router --region=asia-southeast1 --format=json
```

Acceptance evidence: Peer status is UP and learned/advertised prefixes match the approved plan.

Failure modes: ASN conflict; MD5/session mismatch; custom advertisement omits subnet.

### Interconnect product decision

Architecture: Dedicated Interconnect, Partner Interconnect, Cross-Cloud Interconnect, VLAN attachment.

Runtime trace: set throughput/SLA -> choose provider -> provision circuit -> attach VLAN -> run BGP.

```text
gcloud compute interconnects attachments list --format='table(name,region,state,type,router)'
```

Acceptance evidence: Selection reflects throughput, location, provider, encryption and SLA requirements.

Failure modes: no redundant metro; VLAN attachment inactive; BGP not established.

### VPC Network Peering semantics

Architecture: peer VPC A, peer VPC B, subnet routes, non-transitive boundary.

Runtime trace: create both sides -> exchange eligible routes -> enforce firewall -> send directly -> observe.

```text
gcloud compute networks peerings list --network=ace-vpc
```

Acceptance evidence: Both sides are ACTIVE and no design depends on transitive routing.

Failure modes: overlapping ranges; one side missing; firewall not automatically shared.

### Shared VPC versus peering

Architecture: central host project, service projects, separate admin roles, shared subnets.

Runtime trace: choose ownership model -> delegate -> attach workload -> apply policy -> audit.

```text
gcloud compute shared-vpc associated-projects list $HOST_PROJECT
```

Acceptance evidence: Chosen model matches whether central administrators must own the network dataplane.

Failure modes: using peering for centralized subnet ownership; host service agent missing; project association drift.

### Private Service Connect service boundary

Architecture: service attachment, consumer endpoint, internal IP, producer service.

Runtime trace: publish -> approve consumer -> create endpoint -> connect privately -> monitor.

```text
gcloud compute forwarding-rules list --filter='target:serviceAttachments' --format='table(name,IPAddress,network,region)'
```

Acceptance evidence: Consumer uses a private endpoint without importing the producer's routes.

Failure modes: connection not accepted; wrong region; DNS still resolves public endpoint.

### Hybrid DNS resolution

Architecture: Cloud DNS private zone, inbound forwarding, outbound forwarding, on-prem resolver.

Runtime trace: query -> match zone -> forward if needed -> return answer -> cache.

```text
gcloud dns managed-zones list --format='table(name,dnsName,visibility)'
```

Acceptance evidence: Resolution path and authoritative zone are testable from both cloud and on-prem sources.

Failure modes: overlapping zone suffix; forwarder unreachable; stale cache.

### Hybrid connectivity fault isolation

Architecture: interface, BGP session, route, firewall, application port.

Runtime trace: check link -> check session -> check route -> check policy -> test application.

```text
gcloud compute routers get-status ace-router --region=asia-southeast1
gcloud network-management connectivity-tests list
```

Acceptance evidence: Evidence isolates control-plane, routing, policy or application failure before escalation.

Failure modes: testing only ping; asymmetric route; MTU black hole.

### Activity 06 Model Hybrid Connectivity and BGP Failure

Evaluate VPN versus Interconnect, inspect mock BGP routes and isolate a hybrid routing failure.

Submit: connectivity decision, route analysis and corrected BGP configuration

1. Read the scenario: an on-premises 172.16.0.0/16 network must reach ace-vpc with predictable failover.
2. Complete a decision table comparing HA VPN, Partner Interconnect and Dedicated Interconnect for throughput, SLA, lead time and cost.
3. Inspect router_config.yaml and confirm local ASN 64514 differs from peer ASN 65010.
4. Open bgp_routes.csv and identify the most specific route for 10.20.10.0/24.
5. Simulate a missing 10.20.10.0/24 advertisement and explain the traffic consequence.
6. Use a trainer sandbox or mock gcloud output to inspect VPN tunnel status and Cloud Router BGP peer status.
7. Trace one packet from 172.16.0.10 to 10.20.10.20 through peer gateway, tunnel, Cloud Router, VPC route and firewall.
8. Correct the advertisement or route priority in a copy of the YAML/CSV.
9. Run a configuration comparison and save the before/after result.
10. Prepare a short hybrid-network incident note including the failed hop, evidence and escalation owner.

## Topic 7 Managed Services

Mapped criteria: A3 · K4

### Cloud Run revision and traffic model

Architecture: service, revision, container instance, traffic split.

Runtime trace: deploy image -> create immutable revision -> start instances -> route traffic -> observe.

```text
gcloud run deploy ace-api --source=. --region=asia-southeast1 --no-allow-unauthenticated
```

Acceptance evidence: Revision name, image digest, service identity and ingress are captured after deployment.

Failure modes: container not listening on PORT; startup timeout; unauthorized invocation.

### Cloud Run autoscaling controls

Architecture: CPU, concurrency, min instances, max instances.

Runtime trace: receive load -> measure drivers -> calculate recommendation -> bound count -> scale.

```text
gcloud run services update ace-api --region=asia-southeast1 --concurrency=40 --min=0 --max=10
```

Acceptance evidence: Instance count and latency respond to load without overwhelming the database connection budget.

Failure modes: single-thread vCPU hotspot; max too high for DB; cold-start latency.

### Pub/Sub delivery contract

Architecture: topic, subscription, message, ack deadline.

Runtime trace: publish -> store -> deliver -> ack or retry -> dead-letter.

```text
gcloud pubsub topics create orders
gcloud pubsub subscriptions create orders-worker --topic=orders --ack-deadline=30
```

Acceptance evidence: Subscriber handles duplicate delivery idempotently and backlog metrics remain within target.

Failure modes: no ack; poison message loop; publisher permission missing.

### Eventarc event routing

Architecture: event provider, Eventarc trigger, transport topic, Cloud Run target.

Runtime trace: emit event -> match filters -> wrap CloudEvent -> invoke target -> record delivery.

```text
gcloud eventarc triggers list --location=asia-southeast1 --format='table(name,eventFilters,destination)'
```

Acceptance evidence: Trigger filters match the intended event type and target region.

Failure modes: region mismatch; service agent role missing; event filter typo.

### BigQuery load and query job model

Architecture: dataset, table schema, load job, query job.

Runtime trace: stage data -> submit job -> scan columns/partitions -> write result -> inspect bytes.

```text
bq load --source_format=CSV --autodetect ops.events gs://$BUCKET/events.csv
bq query --use_legacy_sql=false 'SELECT severity,COUNT(*) n FROM `ops.events` GROUP BY severity'
```

Acceptance evidence: Job status is DONE with no error and bytes processed are reviewed before scale-up.

Failure modes: schema autodetect drift; unbounded scan; dataset location mismatch.

### Dataflow pipeline boundaries

Architecture: source, Apache Beam transforms, runner workers, sink.

Runtime trace: read -> window/key -> transform -> shuffle -> write.

```text
gcloud dataflow jobs list --region=asia-southeast1 --status=active
```

Acceptance evidence: Job graph, worker logs, watermark and failed records show pipeline health.

Failure modes: hot key; serialization failure; sink quota.

### Dataproc cluster and job separation

Architecture: cluster, driver, executors, Cloud Storage.

Runtime trace: provision -> submit job -> schedule stages -> persist output -> delete cluster.

```text
gcloud dataproc jobs list --region=asia-southeast1 --format='table(reference.jobId,status.state,placement.clusterName)'
```

Acceptance evidence: Ephemeral compute is separated from durable input/output and job state is recorded.

Failure modes: cluster left running; initialization action fails; shuffle disk pressure.

### Serverless incident trace

Architecture: request log, revision, trace ID, downstream call.

Runtime trace: receive request -> emit structured log -> propagate trace -> call dependency -> correlate.

```text
gcloud logging read 'resource.type="cloud_run_revision" AND resource.labels.service_name="ace-api"' --limit=30 --format=json
```

Acceptance evidence: One trace identifier links entry, application error and downstream latency.

Failure modes: unstructured logs; trace header dropped; wrong revision receives traffic.

### Activity 07 Build a Pub Sub to Cloud Run Event Pipeline

Deploy a small event receiver, publish mock orders and diagnose retry behaviour without losing messages.

Submit: Cloud Run revision, Pub/Sub subscription and processed event log

1. Review app.py, requirements.txt and orders.jsonl. Confirm the receiver logs message ID and payload but no secret.
2. Create the orders topic and a subscription, then publish one test message manually.
3. Build and deploy ace-api to Cloud Run in asia-southeast1 with authenticated ingress.
4. Create a Pub/Sub push subscription or Eventarc trigger using the Cloud Run service identity and documented invoker permissions.
5. Publish both mock orders and query Cloud Run revision logs for the two message IDs.
6. Send the same message ID twice in the mock harness and record the duplicate-delivery risk.
7. Add or describe an idempotency control keyed on order_id/message ID.
8. Introduce a harmless 500 response for one test event and observe retry/backlog behaviour.
9. Restore the 204 response and verify the backlog returns to zero.
10. Save the revision name, trigger/subscription configuration and processed event evidence.
11. Delete the service, topic and subscription unless the trainer asks you to retain them.

## Topic 8 Kubernetes

Mapped criteria: A3 · K4

### GKE control plane and workload boundary

Architecture: managed control plane, node or Autopilot compute, Pod, Service.

Runtime trace: submit manifest -> admission -> schedule -> start container -> reconcile.

```text
gcloud container clusters create-auto ace-gke --region=asia-southeast1
gcloud container clusters get-credentials ace-gke --region=asia-southeast1
```

Acceptance evidence: Cluster endpoint is reachable and credentials bind kubectl to the intended context.

Failure modes: wrong context; API disabled; regional quota.

### Kubernetes declarative reconciliation

Architecture: desired manifest, API server, controller, observed state.

Runtime trace: apply -> persist desired state -> controller diff -> act -> converge.

```text
kubectl apply -f deployment.yaml
kubectl get deploy,pods,svc -o wide
```

Acceptance evidence: Deployment AVAILABLE replicas equal desired replicas and Pods are Ready.

Failure modes: selector mismatch; image pull error; readiness probe fails.

### Resource requests, limits and scheduling

Architecture: Pod request, scheduler, node capacity, container limit.

Runtime trace: sum requests -> filter nodes -> score -> bind Pod -> enforce cgroup.

```text
kubectl describe pod -l app=ace-web
kubectl top pods
```

Acceptance evidence: Requests reflect observed workload and explain both scheduling and autoscaling decisions.

Failure modes: Pending due to insufficient CPU; OOMKilled; no metrics.

### Service discovery and traffic

Architecture: Service selector, EndpointSlice, cluster IP, Pod targetPort.

Runtime trace: resolve service DNS -> select endpoint -> proxy packet -> reach Pod -> respond.

```text
kubectl get svc,endpointslices -o wide
kubectl describe svc ace-web
```

Acceptance evidence: Selector labels produce ready endpoints and port/targetPort match the container.

Failure modes: zero endpoints; wrong targetPort; NetworkPolicy blocks flow.

### Artifact Registry image pull

Architecture: repository, image digest, node identity, Pod spec.

Runtime trace: push image -> authorize pull -> resolve tag -> download layers -> start.

```text
gcloud artifacts docker images list asia-southeast1-docker.pkg.dev/$PROJECT_ID/ace/apps --include-tags
```

Acceptance evidence: Running Pod imageID records the immutable digest expected from the build.

Failure modes: repository region typo; node lacks reader role; mutable tag drift.

### Horizontal Pod Autoscaler control loop

Architecture: metrics server, target utilization, replica recommendation, Deployment.

Runtime trace: sample metrics -> calculate ratio -> stabilize -> scale replicas -> reschedule.

```text
kubectl autoscale deployment ace-web --cpu-percent=60 --min=2 --max=10
kubectl get hpa -w
```

Acceptance evidence: HPA shows current/target metric and increases replicas during the load window.

Failure modes: CPU requests missing; metrics unavailable; load too short.

### Cluster autoscaling and Autopilot

Architecture: unschedulable Pod, requested resources, Autopilot provisioner, new capacity.

Runtime trace: Pod pending -> detect need -> provision node -> schedule -> scale down.

```text
kubectl get events --sort-by=.lastTimestamp | tail -30
```

Acceptance evidence: Events distinguish Pod HPA from underlying capacity provisioning.

Failure modes: unsupported workload constraint; quota exhausted; first workload provisioning delay.

### GKE troubleshooting evidence

Architecture: Pod status, events, container logs, cluster metrics.

Runtime trace: identify symptom -> describe resource -> read current/previous log -> test service -> escalate.

```text
kubectl describe pod $POD
kubectl logs $POD --previous
kubectl get events --sort-by=.lastTimestamp
```

Acceptance evidence: Incident bundle preserves YAML, events, logs, metrics and the exact failed test.

Failure modes: Pod recreated before capture; namespace omitted; only application log collected.

### Activity 08 Deploy and Test a GKE Autopilot Workload

Deploy a containerized web workload with probes and resource requests, add HPA and diagnose why replicas do not scale.

Submit: Kubernetes manifests, load-test CSV and HPA evidence

1. Set the project and region, enable the GKE API and create ace-gke in Autopilot mode.
2. Fetch credentials and run kubectl config current-context; confirm the project, cluster and region.
3. Review deployment.yaml for image, labels, ports, resource requests/limits and readiness probe.
4. Apply deployment.yaml and wait for both replicas to become Ready.
5. Apply hpa.yaml. Run kubectl get hpa and confirm the TARGETS column has metrics rather than unknown.
6. Generate controlled HTTP load from an approved load generator for at least five minutes.
7. In a second terminal, record HPA current/target CPU, desired replicas and Pod count every 30 seconds.
8. If replicas remain unchanged, check CPU requests, Metrics API output, workload intensity, maxReplicas and recent events.
9. Correct exactly one identified cause and repeat the same load profile.
10. Save kubectl describe hpa, events, Pod status and the load-test CSV.
11. Scale the workload down or delete the cluster after evidence is captured to avoid ongoing cost.

## Topic 9 Resource Management and Monitoring

Mapped criteria: A5 · K2

### Asset inventory and labels

Architecture: Cloud Asset Inventory, resource name, labels, search query.

Runtime trace: discover -> normalize metadata -> filter -> export -> review.

```text
gcloud asset search-all-resources --scope=projects/$PROJECT_NUMBER --query='labels.env=training' --format='table(assetType,name,location)'
```

Acceptance evidence: Inventory finds all expected resources and exposes unlabelled or wrong-location assets.

Failure modes: label key inconsistency; scope too narrow; deleted asset timing.

### Quota versus system limit

Architecture: quota metric, regional dimension, consumer override, hard limit.

Runtime trace: measure usage -> compare quota -> forecast -> request increase -> verify.

```text
gcloud compute regions describe asia-southeast1 --format='table(quotas.metric,quotas.usage,quotas.limit)'
```

Acceptance evidence: Capacity plan identifies the quota and region before deployment pressure.

Failure modes: quota confused with capacity; request too late; per-project versus per-region.

### Metrics, logs and traces

Architecture: time series, log entry, trace span, resource labels.

Runtime trace: instrument -> ingest -> index -> correlate -> interpret.

```text
gcloud monitoring metrics list --filter='metric.type:compute.googleapis.com' --limit=10
```

Acceptance evidence: Signal includes resource type, metric/log name, timestamp and useful labels.

Failure modes: metric has wrong alignment; logs lack context; trace sampling gap.

### Cloud Logging router

Architecture: source resource, Log Router, sink filter, destination.

Runtime trace: receive log -> match exclusion/sink -> route -> store -> query.

```text
gcloud logging sinks list --format='table(name,destination,filter)'
```

Acceptance evidence: Sink destination and filter are explicit; required audit logs remain retained.

Failure modes: recursive routing; writer identity lacks destination role; exclusion drops evidence.

### Log-based metric contract

Architecture: log filter, counter metric, time series, alert policy.

Runtime trace: match entry -> increment metric -> align window -> evaluate -> notify.

```text
gcloud logging metrics create app-errors --description='ACE app errors' --log-filter='severity>=ERROR AND resource.type="cloud_run_revision"'
```

Acceptance evidence: Test error increments the metric and can be tied to a known trace or revision.

Failure modes: filter never matches; high-cardinality label; ingestion delay misread.

### Alert policy evaluation

Architecture: metric filter, alignment window, threshold, notification channel.

Runtime trace: ingest points -> align -> compare -> open incident -> notify and close.

```text
gcloud alpha monitoring policies list --format='table(displayName,enabled,conditions)'
```

Acceptance evidence: Synthetic breach opens one incident and recovery closes it without alert flapping.

Failure modes: window too short; missing data behaviour; channel unverified.

### Ops Agent telemetry path

Architecture: application/system, Ops Agent receiver, processor, Logging/Monitoring.

Runtime trace: collect -> parse -> enrich -> export -> query.

```text
sudo systemctl status google-cloud-ops-agent
sudo /opt/stackdriver/stack-config/config-checker --config-path=/etc/google-cloud-ops-agent/config.yaml
```

Acceptance evidence: Agent service is healthy and expected log/metric names appear with resource labels.

Failure modes: invalid YAML; agent service account lacks role; duplicate ingestion.

### Evidence-led escalation

Architecture: impact, timeline, metrics and logs, owner and next action.

Runtime trace: stabilize -> capture -> compare expected -> attempt safe fix -> escalate.

```text
gcloud logging read 'timestamp>=\"2026-09-12T00:00:00Z\" AND severity>=ERROR' --limit=100 --format=json > incident-logs.json
```

Acceptance evidence: Escalation pack is reproducible, secret-safe and states what remains unknown.

Failure modes: screenshots without timestamps; credentials in logs; no rollback record.

### Activity 09 Create Monitoring Evidence and an Incident Pack

Create a log-based error metric and alert policy, trigger a synthetic fault and assemble escalation evidence.

Submit: alert-policy.json, incident timeline and filtered log bundle

1. Select one Activity 7 or 8 workload and define the expected signal, threshold, evaluation window and notification owner.
2. Create a log-based counter metric whose filter matches a unique synthetic error marker.
3. Create or review alert-policy.json; replace placeholders with the actual project resource name and notification channel.
4. Trigger one error and verify it appears in Cloud Logging with the correct resource labels.
5. Trigger enough errors to breach the threshold for the specified duration.
6. Confirm an incident opens and the notification reaches the test channel.
7. Collect the filtered log entries, metric chart and policy configuration without credentials.
8. Stop the errors and confirm the incident closes after the recovery window.
9. Complete incident_timeline.csv with UTC timestamps and evidence filenames.
10. Write the escalation summary: impact, expected/observed behaviour, safe actions, remaining unknowns and owner.

## Topic 10 Load Balancing and Autoscaling

Mapped criteria: A6 · K2

### Application versus Network Load Balancers

Architecture: Layer 7 application, Layer 4 proxy, Layer 4 passthrough, internal/external.

Runtime trace: classify protocol -> choose scope -> choose proxy boundary -> select backend -> validate.

```text
gcloud compute forwarding-rules list --format='table(name,loadBalancingScheme,IPProtocol,IPAddress,backendService)'
```

Acceptance evidence: Choice states OSI layer, client reachability, scope and source-IP requirement.

Failure modes: HTTP on passthrough without reason; global/regional mismatch; wrong scheme.

### Application Load Balancer request path

Architecture: forwarding rule, target proxy, URL map, backend service, health check.

Runtime trace: accept anycast IP -> terminate TLS -> match host/path -> select healthy backend -> proxy request.

```text
gcloud compute url-maps describe ace-map --global
gcloud compute backend-services get-health ace-backend --global
```

Acceptance evidence: URL-map route and backend health explain where a request is sent.

Failure modes: certificate not active; URL rule mismatch; health check firewall blocked.

### Health checks versus application readiness

Architecture: probe source, protocol/port, request path, backend response.

Runtime trace: probe -> evaluate threshold -> mark healthy -> admit traffic -> continue probing.

```text
gcloud compute health-checks describe ace-hc --global
```

Acceptance evidence: Probe path tests a dependency-light readiness endpoint and healthy thresholds match recovery needs.

Failure modes: probe hits redirect; app listens different port; probe requires authentication.

### Managed instance group autoscaler

Architecture: metric, target, cooldown, min/max replicas.

Runtime trace: sample -> recommend -> bound -> resize MIG -> stabilize.

```text
gcloud compute instance-groups managed set-autoscaling web-mig --region=asia-southeast1 --min-num-replicas=2 --max-num-replicas=10 --target-cpu-utilization=0.60 --cool-down-period=90
```

Acceptance evidence: Observed group size rises under sustained load and returns after the stabilization period.

Failure modes: load below target; cooldown masks change; max quota reached.

### Capacity math and backend saturation

Architecture: requests per second, service time, concurrency, instance capacity.

Runtime trace: measure service time -> derive concurrency -> apply headroom -> set max -> load test.

```text
python3 -c 'rps=240; seconds=.25; headroom=.7; print(round((rps*seconds)/headroom,1))'
```

Acceptance evidence: Capacity estimate is compared with p95 latency and error rate from a controlled test.

Failure modes: average hides p95; downstream bottleneck; no warm-up.

### Traffic distribution and session affinity

Architecture: client tuple, hash/affinity, healthy backend set, connection tracking.

Runtime trace: build key -> select backend -> track flow -> reuse -> rebalance on failure.

```text
gcloud compute backend-services describe ace-backend --global --format='value(sessionAffinity,localityLbPolicy,timeoutSec)'
```

Acceptance evidence: Affinity is enabled only when application state or protocol requires it.

Failure modes: sticky session hides imbalance; source IP changes through proxy; state not externalized.

### Autoscaling load-test evidence

Architecture: load generator, Cloud Monitoring, MIG size, backend latency.

Runtime trace: baseline -> ramp -> hold -> observe scale -> recover.

```text
bash load_test.sh --url=$LB_URL --rps=240 --duration=300 > load-results.csv
```

Acceptance evidence: Test records target RPS, actual RPS, p95 latency, error rate and instance count over time.

Failure modes: client becomes bottleneck; DNS cached old IP; test too short.

### Escalation when scaling fails

Architecture: autoscaler status, quota, health, audit log.

Runtime trace: capture config -> collect status -> rule out quota -> preserve load trace -> escalate.

```text
gcloud compute instance-groups managed describe web-mig --region=asia-southeast1 --format=json > mig.json
gcloud compute operations list --filter='status!=DONE'
```

Acceptance evidence: Escalation identifies expected trigger, observed signal, blocking condition and safe attempts already made.

Failure modes: manual resize destroys evidence; wrong region; quota error omitted.

### Activity 10 Load Test a Managed Instance Group and Escalate

Apply health checking and CPU autoscaling to a managed instance group, run a controlled load test and escalate a scaling failure.

Submit: load-results.csv, MIG configuration and escalation report

1. Use an approved managed instance group sandbox or create a small regional MIG from the Activity 4 template.
2. Attach a health check whose path returns 200 without depending on a slow external service.
3. Configure minimum 2, maximum 10, target CPU 60% and cooldown 90 seconds.
4. Record the healthy baseline: group size, backend health, p95 latency and error rate.
5. Run load_test.sh against the load-balancer URL and monitor group size plus CPU in parallel.
6. Hold the load long enough to exceed the target beyond the cooldown. Record actual scale-out time.
7. If scaling fails, inspect autoscaler status, quota, managed operations, health check and instance template.
8. Apply one safe correction and repeat the identical load profile.
9. Allow the group to recover and record scale-in behaviour.
10. Complete load-results.csv with observed values and attach MIG/autoscaler JSON.
11. Use escalation-template.md if the target still fails; identify the next owner and preserve evidence.
12. Delete the load balancer and MIG or set the trainer-approved retained state. Verify final cost inventory.

## References

- [Associate Cloud Engineer certification exam guide](https://cloud.google.com/learn/certification/guides/cloud-engineer)
- [Get started with Google Cloud](https://docs.cloud.google.com/docs/get-started)
- [Google Cloud documentation](https://docs.cloud.google.com/docs)
- [Google Cloud resource hierarchy](https://docs.cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy)
- [IAM overview](https://docs.cloud.google.com/iam/docs/overview)
- [VPC networks](https://docs.cloud.google.com/vpc/docs/vpc)
- [Cloud Storage classes](https://docs.cloud.google.com/storage/docs/storage-classes)
- [GKE Autopilot overview](https://docs.cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview)
- [Cloud Run autoscaling](https://docs.cloud.google.com/run/docs/about-instance-autoscaling)
- [Cloud Load Balancing overview](https://docs.cloud.google.com/load-balancing/docs/load-balancing-overview)
- [Cloud Logging routing](https://docs.cloud.google.com/logging/docs/routing/overview)
- [Network Connectivity product selection](https://docs.cloud.google.com/network-connectivity/docs/how-to/choose-product)
- [Google Cloud Skills learning path](https://www.skills.google/paths/8)
- [Google Cloud Codelabs](https://codelabs.developers.google.com/cloud)
- [Google Cloud quickstarts](https://cloud.google.com/docs/tutorials?category=compute,highperformancecomputing,migrations,networking,storage&doctype=quickstart)
- [GeeksforGeeks Google Cloud Platform tutorial](https://www.geeksforgeeks.org/devops/google-cloud-platform-tutorial/)
- [Edureka Google Cloud Platform tutorial](https://www.edureka.co/blog/google-cloud-platform-tutorial/)
- [freeCodeCamp Google Cloud Platform from zero to hero](https://www.freecodecamp.org/news/google-cloud-platform-from-zero-to-hero/)
