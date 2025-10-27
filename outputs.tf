# OUTPUTS
output "ssm_start_session_command" {
  description = "AWS CLI command to connect to the Windows instance via SSM"
  value       = "aws ssm start-session --target ${aws_instance.this.id} --region ${var.region}"
}
