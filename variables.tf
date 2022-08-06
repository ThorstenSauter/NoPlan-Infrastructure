variable "developer-group" {
  type = map(string)
  default = {
    id   = "914fff5e-bedf-443b-82ad-c4ceccb192c3"
    name = "NoPlan Developers"
  }
  description = "The AAD group containing the app developers."
}


variable "github-actions-principal-id" {
  default     = "49e7a027-01d8-4712-aca6-6ecc3c462c61"
  description = "The object id of the service principal running GitHub Actions."
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "The location to deploy Azure resources to"
}

variable "tags" {
  type = map(string)
  default = {
    "environment" : "dev"
    "project" : "noplan"
    "managed-by" : "Terraform"
  }
  description = "The default tags for Azure resources"
}
