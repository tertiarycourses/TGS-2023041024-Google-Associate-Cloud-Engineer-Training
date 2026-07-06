# Lab 03 - VPC Networking, Firewall, DNS, Load Balancing

## Objectives

- Create a custom VPC network.
- Create subnets and understand regions.
- Configure firewall rules.
- Review routes, private Google access, Cloud NAT, and DNS.
- Understand basic HTTP load balancing components.

## Scenario

You need to prepare the network foundation for a web application that will later run on Compute Engine. The network must use custom subnets and controlled firewall access.

## Steps

### 1. Create a Custom VPC

1. Search for `VPC networks`.
2. Click `Create VPC network`.
3. Name the network `ace-lab-vpc`.
4. Select `Custom` subnet creation mode.
5. Create a subnet:

```text
Name: ace-lab-subnet
Region: asia-southeast1
IPv4 range: 10.10.0.0/24
```

6. Enable private Google access if available.
7. Create the VPC.

### 2. Validate with gcloud

```bash
gcloud compute networks list
gcloud compute networks subnets list --filter="network:ace-lab-vpc"
gcloud compute routes list --filter="network:ace-lab-vpc"
```

### 3. Create Firewall Rules

1. Open `Firewall`.
2. Create a rule named `ace-allow-http`.
3. Set network to `ace-lab-vpc`.
4. Set target tags to `ace-web`.
5. Set source IPv4 range to `0.0.0.0/0` for lab HTTP testing.
6. Allow TCP port `80`.
7. Create a second rule named `ace-allow-iap-ssh`.
8. Allow TCP port `22` from `35.235.240.0/20` for Identity-Aware Proxy SSH.

### 4. Review DNS Concepts

1. Search for `Cloud DNS`.
2. Review public zones and private zones.
3. Discuss where private DNS is useful for internal services.
4. Do not create public DNS records unless you own the domain.

### 5. Review Cloud NAT

1. Search for `Cloud NAT`.
2. Review the requirement for Cloud Router.
3. Discuss when private VM instances need outbound internet access.
4. Do not create NAT unless instructed, because it can create billable resources.

### 6. Review Load Balancer Components

1. Search for `Load balancing`.
2. Identify these components:

```text
Frontend
Backend service
Health check
URL map
Target proxy
Forwarding rule
```

3. Draw the traffic flow in your notes.

## Checkpoint Questions

1. What is the difference between auto mode and custom mode VPC?
2. Why are firewall target tags useful?
3. Why is IAP SSH safer than opening SSH to the world?
4. Which load balancer components decide whether a backend is healthy?

## Cleanup

Keep the VPC and firewall rules for Lab 04 unless your instructor asks you to delete them.

## Exam Focus

Networking questions often test your ability to choose subnet ranges, firewall scopes, routes, and load balancing components for a given requirement.
