########################################
# AKS Cluster
########################################

module "aks_cluster_master" {
  source = "git::git@bitbucket.org:contournetworkdelivery/azure-aks-cluster.git?ref=non-prod-01-stg"

  aks_cluster_name           = var.aks_cluster_name
  aks_resource_group_name    = var.resource_group_name
  aks_resource_tags          = var.resource_tags
  aks_resource_location      = var.azure_regions_map["az1"]
  aks_map                    = var.aks_map["region1"]
  aks_log_analytics_workspace_id = module.aks_log_analytics.analytics_id
  aks_default_node_pool_settings = var.aks_region1_nodepool0_settings
  aks_enable_private_cluster = var.enable_private_cluster
  client_secret              = var.client_secret
  client_id                  = var.client_id
  ###subnet for aks cluster
  vnet_subnet_id             = var.vnet_subnet_id



}

########################################
# Azure log analytics
########################################

module "aks_log_analytics" {
  source = "git::git@bitbucket.org:contournetworkdelivery/azure-log-analytics.git?ref=master"
  aks_log_analytics_name                    = var.aks_log_analytics_name
  aks_log_analytics_location                = var.azure_regions_map["az1"]
  aks_log_analytics_resource_group_name     = var.resource_group_name
  aks_log_analytics_sku                     = var.sku
  aks_log_analytics_retention_in_days       = var.retention_in_days
  aks_log_analytics_tags                    = var.resource_tags
}

