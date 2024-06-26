## ---------------------------------------------------------------------------------------------------------------------
## MODULE PARAMETERS
## These variables are expected to be passed in by the operator
## ---------------------------------------------------------------------------------------------------------------------

variable "IMPERSONATE_SERVICE_ACCOUNT_EMAIL" {
  type        = string
  description = <<EOT
    GCP Service Account Email equiped with sufficient Project IAM roles to create new Service Accounts.
    Please set using an ENV variable with TF_VAR_IMPERSONATE_SERVICE_ACCOUNT_EMAIL, and avoid hard coding
    in terraform.tfvars
  EOT
}

variable "new_service_account_name" {
  type        = string
  description = "New GCP Service Account to be created"
}

## ---------------------------------------------------------------------------------------------------------------------
## OPTIONAL PARAMETERS
## These variables have defaults and may be overridden
## ---------------------------------------------------------------------------------------------------------------------

variable "roles_list" {
  type        = list(any)
  description = "List of GCP IAM Roles to bind to the new Service Account"
  default     = []
}

variable "WIF_ID" {
  type        = string
  description = "GCP Worflow Identify Federation Resources ID"
  default     = "sim-parables-wif"
}

variable "GITHUB_REPOSITORY_OWNER" {
  type        = string
  description = "Github Actions Default ENV Variable for the Repo Owner"
  default     = "sim-parables"
}

variable "GITHUB_REPOSITORY" {
  type        = string
  description = "Github Actions Default ENV Variable for the Repo Path"
  default     = "sim-parables/terraform-gcp-service-account"
}

variable "GITHUB_REF" {
  type        = string
  description = "Github Actions Default ENV Variable for full form of the Branch or Tag"
  default     = "refs/heads/main"
}

variable "GITHUB_ENV" {
  type        = string
  description = <<EOT
    Github Environment in which the Action Workflow's Job or Step is running. Ex: production.
    This is not found in Github Action's Default Environment Variables and will need to be
    defined manually.
  EOT
  default     = "production"
}
