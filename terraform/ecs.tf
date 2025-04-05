resource "aws_ecs_task_definition" "medusa" {
  family                   = "medusa-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "3072"
  execution_role_arn       = var.ecs_exec_role_arn
  depends_on = [ aws_db_instance.medusa_db ]

  container_definitions = jsonencode([
    {
      name      = "medusa"
      image     = var.image_url
      essential = true
      portMappings = [
        {
          containerPort = 9000
          hostPort      = 9000
        }
      ]
      environment = [
        {
          name  = "DB_NAME"
          value = "medusa"
        },
        {
          name  = "NODE_ENV"
          value = "production"
        },
        {
          name  = "NODE_TLS_REJECT_UNAUTHORIZED"
          value = "0"
        }
      ]
      secrets = [
        {
          name      = "DATABASE_URL"
          valueFrom = aws_ssm_parameter.db_url.arn
        },
        {
          name      = "JWT_SECRET"
          valueFrom = var.jwt_secret_arn
        },
        {
          name      = "COOKIE_SECRET"
          valueFrom = var.cookie_secret_arn
        }
      ]
    }
  ])
}

resource "aws_ecs_cluster" "ecs" {
  name = "medusa-cluster"
}

resource "aws_ecs_service" "medusa_service" {
  name            = "medusa"
  cluster         = aws_ecs_cluster.ecs.id
  task_definition = aws_ecs_task_definition.medusa.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [aws_subnet.public_a.id, aws_subnet.public_b.id]
    assign_public_ip = true
    security_groups  = [aws_security_group.ecs.id]
  }
}
