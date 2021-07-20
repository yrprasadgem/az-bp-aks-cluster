###############################################################################
# HCF Blueprint-specific Variables
###############################################################################

app_ref = "corda"

buAdCode = "contour"

subsCode = "prod subscription" #subscription code

environment = "stg"

resource_group_name = "rg-stg-sapapp01"

aks_cluster_name = "aks-stg-sapapp01" #naming convetion buAdCode-env-resource_group_name-aks-cluster

aks_log_analytics_name = "log-analytics-aks-stg-sapapp01" #naming convetion log-analytics-env-buAdCode

vnet_subnet_id = "/subscriptions/b3f72110-ee35-4c84-ab6a-5189f3744372/resourceGroups/rg-stg-sapapp01/providers/Microsoft.Network/virtualNetworks/vnet-stg-sapapp01/subnets/snet-non-prod-stg01-PvtApp128"


########################################
# AKS TFVARS
########################################
#enable private cluster
enable_private_cluster = "true"

#########
# SUBNETS
##########
aks_subnets_map = {
  "region1" = ["4-aks"]
  "region2" = ["4-aks"]
}


aks_map = {
  region1 = {

    #subnet_name = "4-aks"
    
      aks_version            = "1.19.11"
      cluster_autoscaling    = "true"          // enable Cluster Autoscaling on AKS
      aks_dns_service_ip     = "10.249.192.10" // IP from aks-cluster2 aks_service_cidr
      aks_service_cidr       = "10.249.192.0/18"
      aks_docker_bridge_cidr = "172.17.0.1/16"   
      #aks_pod_cidr          = "172.21.0.0/16" // Pod CIDR is only relevant for Kubenet
      aks_netPlugin          = "azure"         // (azure is "cni" ) alternatively "kubenet"
      rbac_enabled           = "true"          // enable RBAC for aks cluster
      aks_load_balancer_sku  = "Standard"      // accepted value "Standard" or "Basic"
   }

}

###############################
# /23 subnet
# max_count = 40//max nodes
# min_count = 1 secondary site, 2 for primary site
# max pod = 100
# starting_node-count = 1 secondary site, 2 for primary site
################################

//Default nodepool configuration
aks_region1_nodepool0_settings = {
    name                      = "nplnprd01"   #name must start with a lowercase letter, have max length of 12, and only have characters a-z0-9
    vm_size                   = "Standard_B20ms" #must be available in the target zone
   #private_subnet_ref        = "4-aks"          #needed to obtain private subnet id # to be enabled while creating subnets
    enable_node_public_ip     = "false"          #should the deployed node have a public IP in addition to a private one?
    max_pods                  = "100"             #Should not exceed 250
    os_disk_size_gb           = "256"
    #os_type                   = "Linux"
    enable_auto_scaling       = "true"
    max_count                 = "30" #maximum number of nodes
    min_count                 = "2" #minimum number of nodes in the pool ever
    #starting_node_count       = "1"  #desired number of nodes at deploy time
    type                      = "VirtualMachineScaleSets"
    nodepool_taints           = "Key=GPU:NoSchedule" #system pool no restrictions
    version                   = "1.19.11"
    #availability_zones        = ["1","2","3"]
    #enable_availability_zones = "1" #at this time 1 of our regions don't support AZs so here is the option to disable/enable
 }

#######################
#Azure log analytics
#######################
sku = "PerGB2018"
retention_in_days = "90"

