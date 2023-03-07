# Hybrid architecture using a Site-to-Site VPN

## Explanation

Your diagram should include at least the following:

* A VPC container with the Virtual Private Gateway near its boundary.
* Two private subnets in separate availability zones.
* An Auto Scaling group containing EC2 instances inside those subnets.
* An IAM role outside of the VPC container, attached to the EC2 instances or ASG.
* An S3 bucket linked to the IAM role.

## Diagram

![Hybrid architecture using a Site-to-Site VPN](solution.png "Hybrid architecture using a Site-to-Site VPN")