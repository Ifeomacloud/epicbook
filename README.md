# Web Solution with WordPress (Three-Tier Architecture on AWS EC2)

This project implements a **three-tier architecture** using AWS EC2 instances:
1. **Presentation Layer** → Browser / Apache Web Server (WordPress)
2. **Application Layer** → WordPress + PHP (on Red Hat Server)
3. **Database Layer** → MySQL DB Server (on separate Red Hat Server)

Both the Web Server and DB Server use attached **EBS volumes** with **LVM partitioning** for storage management.

---

## Table of Contents
- [Step 1 — Provision EC2 Instances](#step-1--provision-ec2-instances)
- [Step 2 — Configure Storage (Web Server)](#step-2--configure-storage-web-server)
- [Step 3 — Configure Storage (DB Server)](#step-3--configure-storage-db-server)
- [Step 4 — Install WordPress on Web Server](#step-4--install-wordpress-on-web-server)
- [Step 5 — Install MySQL on DB Server](#step-5--install-mysql-on-db-server)
- [Step 6 — Configure MySQL for WordPress](#step-6--configure-mysql-for-wordpress)
- [Step 7 — Configure WordPress DB Connection](#step-7--configure-wordpress-db-connection)
- [Step 8 — Finalize Network & Access](#step-8--finalize-network--access)
- [Step 9 — Access WordPress](#step-9--access-wordpress)

---

## Step 1 — Provision EC2 Instances

- **WordPress Server (Web Server):** Red Hat EC2
- **DB Server:** Red Hat EC2
- **Storage:** Attach 3 EBS Volumes (10GB each) to each server (in the same AZ: `eu-north1c`).

---

## Step 2 — Configure Storage (Web Server)

### Connect to Web Server
```bash
ssh -i steghub.pem ec2-user@13.53.138.153