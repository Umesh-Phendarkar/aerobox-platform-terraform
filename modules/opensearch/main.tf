resource "aws_opensearch_domain" "this" {
  domain_name    = "${var.project_name}-os"
  engine_version = "OpenSearch_2.11"

  cluster_config {
    instance_type          = "t3.small.search"
    instance_count         = 2
    zone_awareness_enabled = true

    zone_awareness_config {
      availability_zone_count = 2
    }
  }

  vpc_options {
    subnet_ids         = var.private_subnets
    security_group_ids = [var.os_sg]
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 10
  }

  encrypt_at_rest {
    enabled = true
  }

  node_to_node_encryption {
    enabled = true
  }
}

output "opensearch_endpoint" {
  value = aws_opensearch_domain.this.endpoint
}
