# MERN Stack Blog App Deployment - Week 11 Assignment

## 📌 Assignment Goal
Deploy a MERN stack blog application using Terraform and Ansible:
- Backend hosted on EC2 (Ubuntu 22.04)
- Frontend hosted via S3 static website hosting
- Media uploads managed with a separate S3 bucket
- MongoDB Atlas as the database

## 🔧 Tools & Services Used
- **Terraform**: Infrastructure provisioning (EC2, IAM, S3)
- **Ansible**: Backend provisioning (Node.js, PM2, environment setup)
- **Amazon EC2**: Runs backend server
- **MongoDB Atlas**: Database cluster
- **Amazon S3**: Frontend static hosting + media uploads
- **IAM**: Media upload user with policy

## 🚀 Deployment Steps

### 1. Terraform
- Created IAM user with S3 media upload permissions
- Created two S3 buckets: one for frontend, one for media
- Created EC2 instance (t3.micro, Ubuntu 22.04)
- Security group configured for ports 22, 80, 5000

### 2. MongoDB Atlas
- Cluster created and connection string generated
- IP whitelist updated for EC2 instance

### 3. Ansible Backend Provisioning
- Cloned MERN blog repo
- Generated `.env` file with MongoDB and S3 config
- Installed Node.js, PM2
- Started backend with PM2

### 4. Frontend Deployment
- Configured VITE env with backend and media base URLs
- Built frontend with `pnpm`
- Synced frontend to S3 bucket with static hosting

## 🖼️ Screenshots

- ![](screenshots/pm2-backend.png)
- ![](screenshots/mongodb-cluster.png)
- ![](screenshots/media-upload-success.png)
- ![](screenshots/s3-frontend.png)
- ![](screenshots/architecture.png)

## 🧹 Cleanup
- Ran `terraform destroy` to delete all AWS resources
- Removed IAM keys and MongoDB users
- Deleted `.env` from EC2 instance
- Ensured no sensitive info is in the repo

## ⚠️ Notes
- All secrets are kept out of the repo
- `.env` and `.terraform/` are excluded via `.gitignore`
