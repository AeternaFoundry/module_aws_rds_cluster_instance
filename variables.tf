variable "rds_cluster_instances" {
  description = <<EOT
Map of rds_cluster_instances, attributes below
Required:
    - cluster_identifier
    - engine
    - instance_class
Optional:
    - apply_immediately
    - auto_minor_version_upgrade
    - availability_zone
    - ca_cert_identifier
    - copy_tags_to_snapshot
    - custom_iam_instance_profile
    - db_parameter_group_name
    - db_subnet_group_name
    - engine_version
    - force_destroy
    - identifier
    - identifier_prefix
    - monitoring_interval
    - monitoring_role_arn
    - performance_insights_enabled
    - performance_insights_kms_key_id
    - performance_insights_retention_period
    - preferred_backup_window
    - preferred_maintenance_window
    - promotion_tier
    - publicly_accessible
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    cluster_identifier                    = string
    engine                                = string
    instance_class                        = string
    region                                = optional(string)
    publicly_accessible                   = optional(bool)
    promotion_tier                        = optional(number)
    preferred_maintenance_window          = optional(string)
    preferred_backup_window               = optional(string)
    performance_insights_retention_period = optional(number)
    performance_insights_kms_key_id       = optional(string)
    performance_insights_enabled          = optional(bool)
    monitoring_role_arn                   = optional(string)
    monitoring_interval                   = optional(number)
    identifier_prefix                     = optional(string)
    identifier                            = optional(string)
    force_destroy                         = optional(bool)
    engine_version                        = optional(string)
    db_subnet_group_name                  = optional(string)
    db_parameter_group_name               = optional(string)
    custom_iam_instance_profile           = optional(string)
    copy_tags_to_snapshot                 = optional(bool)
    ca_cert_identifier                    = optional(string)
    availability_zone                     = optional(string)
    auto_minor_version_upgrade            = optional(bool)
    apply_immediately                     = optional(bool)
    tags                                  = optional(map(string))
    tags_all                              = optional(map(string))
  }))
  validation {
    condition = alltrue([
      for k, v in var.rds_cluster_instances : (
        v.custom_iam_instance_profile == null || (can(regex("^AWSRDSCustom.*$", v.custom_iam_instance_profile)))
      )
    ])
    error_message = "must begin with AWSRDSCustom"
  }
  validation {
    condition = alltrue([
      for k, v in var.rds_cluster_instances : (
        v.performance_insights_retention_period == null || ((contains([7, 731], v.performance_insights_retention_period)) || ((v.performance_insights_retention_period >= 7) && (v.performance_insights_retention_period <= 731) && ((v.performance_insights_retention_period % 31) == 0)))
      )
    ])
    error_message = "any of: must be one of: 7, 731; all of: must be at least 7; must be at most 731; must be divisible by 31"
  }
  # Note: 11 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

