###############################################################################
# HCF Blueprint-specific Variables
###############################################################################
variable "resource_group_name"{
  type     = string
  default  = ""
}

variable "aks_cluster_name"{
  type      = string
  default   = ""

}

variable "log_space_analytics_id"{
  type      = string
  default   = ""

}
variable "app_ref" {
  type    = string
  default = ""
}

variable "buAdCode" {
  type    = string
  default = ""
}

variable "subsCode" {
  type    = string
  default = ""
}

variable "environment" {
  type    = string
  default = ""
}


variable "azure_regions_map" {
  type = map(any)

  default = {
    az1 = "southeast asia"
    az2 = "east asia"
  }
}

variable "regions" {
  type = list(any)

  default = [
    "az1",
    "az2",
  ]
}

variable "resource_tags" {
  type = map(any)

  default = {
    tag_business_unit = "contour-sg"
    tag_env           = "stg"
    tag_app_name      = "azure kubernetes service"
    tag_app_owner     = "luke@contour.network"
  }
}

variable "tags" {
  type = map(any)

  default = {
    BusinessUnit     = "contour-sg"
    Environment      = "stg"
    SubscriptionCode = "stg"
    ApplicationCode  = "corda"
    ApplicationName  = "azure kubernetes service"
    ApplicationOwner = "luke@contour.network"
  }
}

variable "location_map" {
  type = map(any)

  default = {
    "region1" = "southeast asia"
    "region2" = "east asia"
  }
}

variable "aks_map" {
  type = map(any)
}

variable "log_analytics_workspace_id" {
  type = string
  default = ""
}

variable "aks_region1_nodepool0_settings" {
  type = map(any)
}

variable "sku" {
  type = string
}

variable "retention_in_days" {
  type = string
}

variable "aks_log_analytics_name" {
  type = string
}

variable "enable_private_cluster" {
  type = bool
}


variable "client_secret" {

}

variable "client_id" {

}

variable "storageAccountKey_upper_level" {

}


variable "vnet_subnet_id" {
  type  = string
}

