# Terraform AWS Windows SSM Demo

This Terraform configuration demonstrates deploying a Windows Server instance managed entirely through AWS Systems Manager (SSM) for secure remote access.

## Features

- **Windows Server 2025** instance in a private subnet
- **No public IP** - fully private and secure
- **SSM Session Manager** - Connect without RDP or VPN
- **Private subnet deployment** - Instances accessed through NAT Gateway
- **IAM instance profile** - Minimal permissions for SSM access

## Prerequisites

1. AWS CLI installed and configured
2. AWS Systems Manager Session Manager plugin installed:

   ```bash
   # macOS
   brew install --cask session-manager-plugin

   # Linux
   wget https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm
   sudo rpm -i session-manager-plugin.rpm
   ```

## Deployment

```bash
terraform init
terraform plan
terraform apply
```

## Connecting to the Windows Instance

After deployment, connect using the AWS CLI command provided in the outputs:

```bash
terraform output -raw ssm_start_session_command | bash
```

Or use the instance ID directly:

```bash
aws ssm start-session --target <INSTANCE_ID> --region ap-southeast-2
```

## Configuration

The instance is configured with:

- **Instance Type**: `t3.medium` (configurable via `windows_instance_type` variable)
- **AMI**: Latest Windows Server 2025 (auto-discovered)
- **Network**: Private subnet with NAT Gateway access
- **Security**: All outbound traffic allowed for SSM and Windows updates
