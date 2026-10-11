resource "aws_rds_cluster_instance" "rds_cluster_instances" {
  for_each = var.rds_cluster_instances

  cluster_identifier                    = each.value.cluster_identifier
  engine                                = each.value.engine
  instance_class                        = each.value.instance_class
  region                                = each.value.region
  publicly_accessible                   = each.value.publicly_accessible
  promotion_tier                        = each.value.promotion_tier
  preferred_maintenance_window          = each.value.preferred_maintenance_window
  preferred_backup_window               = each.value.preferred_backup_window
  performance_insights_retention_period = each.value.performance_insights_retention_period
  performance_insights_kms_key_id       = each.value.performance_insights_kms_key_id
  performance_insights_enabled          = each.value.performance_insights_enabled
  monitoring_role_arn                   = each.value.monitoring_role_arn
  monitoring_interval                   = each.value.monitoring_interval
  identifier_prefix                     = each.value.identifier_prefix
  identifier                            = each.value.identifier
  force_destroy                         = each.value.force_destroy
  engine_version                        = each.value.engine_version
  db_subnet_group_name                  = each.value.db_subnet_group_name
  db_parameter_group_name               = each.value.db_parameter_group_name
  custom_iam_instance_profile           = each.value.custom_iam_instance_profile
  copy_tags_to_snapshot                 = each.value.copy_tags_to_snapshot
  ca_cert_identifier                    = each.value.ca_cert_identifier
  availability_zone                     = each.value.availability_zone
  auto_minor_version_upgrade            = each.value.auto_minor_version_upgrade
  apply_immediately                     = each.value.apply_immediately
  tags                                  = each.value.tags
  tags_all                              = each.value.tags_all
}

