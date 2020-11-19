# terraform-aws-vpc-ecs-s3-mysql

aws-ecs-ec2-project % terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

data.aws_iam_policy_document.ecs_agent: Refreshing state...

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create
 <= read (data resources)

Terraform will perform the following actions:

  # data.template_file.task_definition_template will be read during apply
  # (config refers to values not yet known)
 <= data "template_file" "task_definition_template"  {
      + id       = (known after apply)
      + rendered = (known after apply)
      + template = jsonencode(
            [
              + {
                  + cpu         = 2
                  + environment = []
                  + essential   = true
                  + image       = "${REPOSITORY_URL}:latest"
                  + memory      = 512
                  + name        = "worker"
                },
            ]
        )
      + vars     = {
          + "REPOSITORY_URL" = (known after apply)
        }
    }

  # aws_autoscaling_group.failure_analysis_ecs_asg will be created
  + resource "aws_autoscaling_group" "failure_analysis_ecs_asg" {
      + arn                       = (known after apply)
      + availability_zones        = (known after apply)
      + default_cooldown          = (known after apply)
      + desired_capacity          = 2
      + force_delete              = false
      + health_check_grace_period = 300
      + health_check_type         = "EC2"
      + id                        = (known after apply)
      + launch_configuration      = (known after apply)
      + max_size                  = 10
      + metrics_granularity       = "1Minute"
      + min_size                  = 1
      + name                      = "asg"
      + protect_from_scale_in     = false
      + service_linked_role_arn   = (known after apply)
      + vpc_zone_identifier       = (known after apply)
      + wait_for_capacity_timeout = "10m"
    }

  # aws_db_instance.mysql will be created
  + resource "aws_db_instance" "mysql" {
      + address                               = (known after apply)
      + allocated_storage                     = 5
      + apply_immediately                     = (known after apply)
      + arn                                   = (known after apply)
      + auto_minor_version_upgrade            = true
      + availability_zone                     = (known after apply)
      + backup_retention_period               = 2
      + backup_window                         = "01:00-01:30"
      + ca_cert_identifier                    = (known after apply)
      + character_set_name                    = (known after apply)
      + copy_tags_to_snapshot                 = false
      + db_subnet_group_name                  = (known after apply)
      + delete_automated_backups              = true
      + endpoint                              = (known after apply)
      + engine                                = "mysql"
      + engine_version                        = "5.7"
      + final_snapshot_identifier             = "worker-final"
      + hosted_zone_id                        = (known after apply)
      + id                                    = (known after apply)
      + identifier                            = "mysql"
      + identifier_prefix                     = (known after apply)
      + instance_class                        = "db.t2.micro"
      + kms_key_id                            = (known after apply)
      + latest_restorable_time                = (known after apply)
      + license_model                         = (known after apply)
      + maintenance_window                    = "sun:03:00-sun:03:30"
      + monitoring_interval                   = 0
      + monitoring_role_arn                   = (known after apply)
      + multi_az                              = true
      + name                                  = "worker_db"
      + option_group_name                     = (known after apply)
      + parameter_group_name                  = (known after apply)
      + password                              = (sensitive value)
      + performance_insights_enabled          = false
      + performance_insights_kms_key_id       = (known after apply)
      + performance_insights_retention_period = (known after apply)
      + port                                  = 3306
      + publicly_accessible                   = true
      + replicas                              = (known after apply)
      + resource_id                           = (known after apply)
      + skip_final_snapshot                   = true
      + status                                = (known after apply)
      + storage_type                          = (known after apply)
      + timezone                              = (known after apply)
      + username                              = "worker"
      + vpc_security_group_ids                = (known after apply)
    }

  # aws_db_subnet_group.db_subnet_group will be created
  + resource "aws_db_subnet_group" "db_subnet_group" {
      + arn         = (known after apply)
      + description = "Managed by Terraform"
      + id          = (known after apply)
      + name        = (known after apply)
      + name_prefix = (known after apply)
      + subnet_ids  = (known after apply)
    }

  # aws_ecr_repository.worker will be created
  + resource "aws_ecr_repository" "worker" {
      + arn                  = (known after apply)
      + id                   = (known after apply)
      + image_tag_mutability = "MUTABLE"
      + name                 = "worker"
      + registry_id          = (known after apply)
      + repository_url       = (known after apply)
    }

  # aws_ecs_cluster.ecs_cluster will be created
  + resource "aws_ecs_cluster" "ecs_cluster" {
      + arn  = (known after apply)
      + id   = (known after apply)
      + name = "my-cluster"

      + setting {
          + name  = (known after apply)
          + value = (known after apply)
        }
    }

  # aws_ecs_service.worker will be created
  + resource "aws_ecs_service" "worker" {
      + cluster                            = (known after apply)
      + deployment_maximum_percent         = 200
      + deployment_minimum_healthy_percent = 100
      + desired_count                      = 2
      + enable_ecs_managed_tags            = false
      + iam_role                           = (known after apply)
      + id                                 = (known after apply)
      + launch_type                        = (known after apply)
      + name                               = "worker"
      + platform_version                   = (known after apply)
      + scheduling_strategy                = "REPLICA"
      + task_definition                    = (known after apply)
      + wait_for_steady_state              = false
    }

  # aws_ecs_task_definition.task_definition will be created
  + resource "aws_ecs_task_definition" "task_definition" {
      + arn                   = (known after apply)
      + container_definitions = (known after apply)
      + family                = "worker"
      + id                    = (known after apply)
      + network_mode          = (known after apply)
      + revision              = (known after apply)
    }

  # aws_iam_instance_profile.ecs_agent will be created
  + resource "aws_iam_instance_profile" "ecs_agent" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = "ecs-agent"
      + path        = "/"
      + role        = "ecs-agent"
      + unique_id   = (known after apply)
    }

  # aws_iam_role.ecs_agent will be created
  + resource "aws_iam_role" "ecs_agent" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                      + Sid       = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + max_session_duration  = 3600
      + name                  = "ecs-agent"
      + path                  = "/"
      + unique_id             = (known after apply)
    }

  # aws_iam_role_policy_attachment.ecs_agent will be created
  + resource "aws_iam_role_policy_attachment" "ecs_agent" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
      + role       = "ecs-agent"
    }

  # aws_internet_gateway.internet_gateway will be created
  + resource "aws_internet_gateway" "internet_gateway" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + vpc_id   = (known after apply)
    }

  # aws_launch_configuration.ecs_launch_config will be created
  + resource "aws_launch_configuration" "ecs_launch_config" {
      + arn                         = (known after apply)
      + associate_public_ip_address = false
      + ebs_optimized               = (known after apply)
      + enable_monitoring           = true
      + iam_instance_profile        = "ecs-agent"
      + id                          = (known after apply)
      + image_id                    = "ami-08f5ec982352f81a0"
      + instance_type               = "t2.micro"
      + key_name                    = (known after apply)
      + name                        = (known after apply)
      + security_groups             = (known after apply)
      + user_data                   = "bdb1f81aad6e1e3c5c7fce7a79df8628d624636f"

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + no_device             = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # aws_route_table.public will be created
  + resource "aws_route_table" "public" {
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                = "0.0.0.0/0"
              + egress_only_gateway_id    = ""
              + gateway_id                = (known after apply)
              + instance_id               = ""
              + ipv6_cidr_block           = ""
              + local_gateway_id          = ""
              + nat_gateway_id            = ""
              + network_interface_id      = ""
              + transit_gateway_id        = ""
              + vpc_endpoint_id           = ""
              + vpc_peering_connection_id = ""
            },
        ]
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.route_table_association will be created
  + resource "aws_route_table_association" "route_table_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.ecs_sg will be created
  + resource "aws_security_group" "ecs_sg" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 65535
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
        ]
      + name                   = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + vpc_id                 = (known after apply)
    }

  # aws_security_group.rds_sg will be created
  + resource "aws_security_group" "rds_sg" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 65535
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 3306
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = (known after apply)
              + self             = false
              + to_port          = 3306
            },
        ]
      + name                   = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.private_subnet1 will be created
  + resource "aws_subnet" "private_subnet1" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = (known after apply)
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.1.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.private_subnet2 will be created
  + resource "aws_subnet" "private_subnet2" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = (known after apply)
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.2.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + vpc_id                          = (known after apply)
    }

  # aws_subnet.pub_subnet will be created
  + resource "aws_subnet" "pub_subnet" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = (known after apply)
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.0.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + vpc_id                          = (known after apply)
    }

  # aws_vpc.vpc will be created
  + resource "aws_vpc" "vpc" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.0.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = true
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "Name" = "Terraform VPC"
        }
    }

Plan: 20 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + ecr_repository_worker_endpoint = (known after apply)
  + mysql_endpoint                 = (known after apply)

Warning: Interpolation-only expressions are deprecated

  on iam.tf line 19, in resource "aws_iam_role_policy_attachment" "ecs_agent":
  19:   role       = "${aws_iam_role.ecs_agent.name}"

Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.

(and one more similar warning elsewhere)


------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
