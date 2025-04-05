## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.94.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.94.1 |

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.medusa_db](https://registry.terraform.io/providers/hashicorp/aws/5.94.1/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.db_subnet](https://registry.terraform.io/providers/hashicorp/aws/5.94.1/docs/resources/db_subnet_group) | resource |
| [aws_ecs_cluster.ecs](https://registry.terraform.io/providers/hashicorp/aws/5.94.1/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.medusa_service](https://registry.terraform.io/providers/hashicorp/aws/5.94.1/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.medusa](https://registry.terraform.io/providers/hashicorp/aws/5.94.1/docs/resources/ecs_task_definition) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/5.94.1/docs/resources/internet_gateway) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/5.94.1/docs/resources/route_table) | resource |
| [aws_route_table_association.public_a](https://registry.terraform.io/providers/hashicorp/aws/5.94.1/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_b](https://registry.terraform.io/providers/hashicorp/aws/5.94.1/docs/resources/route_table_association) | resource |
| [aws_security_group.ecs](https://registry.terraform.io/providers/hashicorp/aws/5.94.1/docs/resources/security_group) | resource |
| [aws_security_group.rds_sg](https://registry.terraform.io/providers/hashicorp/aws/5.94.1/docs/resources/security_group) | resource |
| [aws_ssm_parameter.db_url](https://registry.terraform.io/providers/hashicorp/aws/5.94.1/docs/resources/ssm_parameter) | resource |
| [aws_subnet.public_a](https://registry.terraform.io/providers/hashicorp/aws/5.94.1/docs/resources/subnet) | resource |
| [aws_subnet.public_b](https://registry.terraform.io/providers/hashicorp/aws/5.94.1/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/5.94.1/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"ap-south-1"` | no |
| <a name="input_cookie_secret_arn"></a> [cookie\_secret\_arn](#input\_cookie\_secret\_arn) | ARN of the SSM parameter containing the cookie secret | `any` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | n/a | `any` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | Username for the database | `any` | n/a | yes |
| <a name="input_ecs_exec_role_arn"></a> [ecs\_exec\_role\_arn](#input\_ecs\_exec\_role\_arn) | value of the ECS execution role ARN | `any` | n/a | yes |
| <a name="input_image_url"></a> [image\_url](#input\_image\_url) | URL of the container image in ECR | `any` | n/a | yes |
| <a name="input_jwt_secret_arn"></a> [jwt\_secret\_arn](#input\_jwt\_secret\_arn) | ARN of the SSM parameter containing the JWT secret | `any` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `string` | `"10.0.0.0/16"` | no |
