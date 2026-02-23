output "key_pair_name" {
  value = aws_key_pair.this.key_name
}

output "asg_name" {
  value = aws_autoscaling_group.this.name
}
