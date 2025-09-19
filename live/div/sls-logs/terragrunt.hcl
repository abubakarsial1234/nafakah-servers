# live/div/sls/terragrunt.hcl

include "env" {
  path = find_in_parent_folders("env.hcl")
}

# We need the ECS instance names to add them to the machine group
dependency "ecs_ssrs" {
    config_path = "../ecs/NAFAKAH-SSRS"
}

terraform {
  source = "../../../modules/sls-logs"
}

inputs = {
  project_name                  = "nafakah-div-logs"
  logstore_name                 = "application-logs"
  log_retention_period          = 90 # Keep logs for 90 days
  machine_group_name            = "nafakah-ssrs-servers"
  
  # Get the instance name from the ECS module's output
  machine_group_userdefined_ids = [dependency.ecs_ssrs.outputs.instance_name] 
  
  logtail_config_name           = "app-log-config"
  log_file_path = "C:/inetpub/logs/LogFiles" # Example path for Windows IIS logs
}