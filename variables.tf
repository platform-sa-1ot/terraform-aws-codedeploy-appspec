variable "appspec_bucket_name" {
  type = string
}

variable "task_definition_arn" {
  type = string
}

variable "container_name" {
  type = string
}

variable "container_port" {
  type = string
}

variable "platform_version" {
  description = "Fargate version"
  type        = string
  default     = "1.4.0"
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "assign_public_ip" {
  type    = bool
  default = false
}

variable "deployment_version" {
  type = string
}

variable "codedeploy_application_name" {
  type = string
}

variable "codedeploy_deployment_group_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = null
}
