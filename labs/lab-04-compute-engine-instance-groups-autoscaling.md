# Lab 04 - Compute Engine, Instance Groups, Autoscaling

## Objectives

- Deploy a Compute Engine VM.
- Use startup scripts and network tags.
- Create an instance template.
- Create a managed instance group.
- Configure autoscaling and health checks.
- Practice compute cleanup.

## Scenario

Your application team needs a small web service that can scale automatically. You will first deploy a single VM, then convert the design into a managed instance group.

## Steps

### 1. Create a Test VM

1. Search for `Compute Engine`.
2. Create a VM named `ace-lab-vm`.
3. Select region `asia-southeast1` and zone `asia-southeast1-b`.
4. Choose a small machine type such as `e2-micro` or `e2-small`.
5. Select the VPC `ace-lab-vpc` and subnet `ace-lab-subnet`.
6. Add network tag `ace-web`.
7. Add this startup script:

```bash
#!/bin/bash
apt-get update
apt-get install -y apache2
echo "ACE lab web server - $(hostname)" > /var/www/html/index.html
systemctl enable apache2
systemctl restart apache2
```

8. Create the VM.

### 2. Test HTTP Access

1. Copy the external IP address.
2. Open `http://EXTERNAL_IP` in a browser.
3. Confirm the page returns the hostname message.

### 3. Validate with gcloud

```bash
gcloud compute instances list
gcloud compute instances describe ace-lab-vm --zone asia-southeast1-b
```

### 4. Create an Instance Template

1. Open `Instance templates`.
2. Create a template named `ace-lab-template`.
3. Use the same machine type, network, tag, and startup script.
4. Save the template.

### 5. Create a Managed Instance Group

1. Open `Instance groups`.
2. Create a managed instance group named `ace-lab-mig`.
3. Use `ace-lab-template`.
4. Set location to a single zone for the lab.
5. Set minimum instances to `1` and maximum instances to `2`.
6. Configure autoscaling based on CPU utilization.
7. Create the group.

### 6. Review Health Checks

1. Open the managed instance group details.
2. Review instance status.
3. Identify the health check settings if configured.
4. Discuss how health checks support load balancing and autohealing.

## Checkpoint Questions

1. Why are instance templates immutable?
2. What is the benefit of a managed instance group over standalone VMs?
3. What is the relationship between autoscaling and health checks?
4. Which resources can continue to incur cost after a VM is deleted?

## Cleanup

If you are not using the resources in a later capstone:

1. Delete the managed instance group.
2. Delete the standalone VM.
3. Delete the instance template.
4. Check for unused disks and static IP addresses.

## Exam Focus

Compute Engine scenarios often ask you to select managed instance groups, templates, startup scripts, autoscaling, and health checks for resilient workloads.
