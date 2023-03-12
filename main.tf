resource "random_id" "server" {
  byte_length = 1
}

resource "aws_redshift_cluster" "example" {
  cluster_identifier     = "my-redshift-cluster-${random_id.server.hex}"
  node_type              = "dc2.large"
  cluster_type           = "multi-node"
  master_username        = "clusteruser"
  master_password        = "Password123"
  skip_final_snapshot    = true
  number_of_nodes        = 1
  vpc_security_group_ids = data.aws_security_groups.test.ids
  tags = {
    Name = "my-redshift-cluster-${random_id.server.hex}"
  }
  cluster_parameter_group_name = "default.redshift-1.0"
}
