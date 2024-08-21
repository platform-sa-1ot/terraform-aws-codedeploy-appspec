version: 0.0
Resources:
  - TargetService:
      Type: AWS::ECS::Service
      Properties:
        TaskDefinition: ${task_definition_arn}
        LoadBalancerInfo:
          ContainerName: ${container_name}
          ContainerPort: ${container_port}
        PlatformVersion: ${platform_version}
        NetworkConfiguration:
          AwsvpcConfiguration:
              Subnets: ${subnet_ids}
              SecurityGroups: ${security_group_ids}
              AssignPublicIp: ${assign_public_ip}
