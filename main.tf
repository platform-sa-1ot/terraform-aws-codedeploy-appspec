locals {
  appspec_key = "appspec/${var.codedeploy_application_name}/${var.codedeploy_deployment_group_name}:${var.deployment_version}.yml"
}

data "template_file" "appspec" {
  template = join("",
    [
      file("${path.module}/appspec-template.yml.tpl")
    ]
  )
  vars = {
    task_definition_arn = var.task_definition_arn
    container_name      = var.container_name
    container_port      = var.container_port
    platform_version    = var.platform_version
    subnet_ids          = jsonencode(var.subnet_ids)
    security_group_ids  = jsonencode(var.security_group_ids)
    assign_public_ip    = var.assign_public_ip ? "ENABLED" : "DISABLED"
  }
}

resource "aws_s3_object" "appspec" {
  key     = local.appspec_key
  bucket  = var.appspec_bucket_name
  content = data.template_file.appspec.rendered
  tags = merge(var.tags, {
    IsAppspecRevisionObject = true
  })
}