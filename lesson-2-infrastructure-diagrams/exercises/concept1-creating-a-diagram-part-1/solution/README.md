# Network diagram with failover region

## Explanation

Your diagram should include:

* A single AWS account, as this is still a single account workload.
* Two region containers, one for the primary and one for the secondary.
* Two VPC containers, one inside each region, for primary and failover.
* Two Availability Zone containers inside each VPC, two per region.
* A pair of public and private subnets inside each AZ.

Your primary and secondary workloads should be tagged as such, either at the region or VPC level.

## Diagram

![Network diagram with failover region](solution.png "Network diagram with failover region")