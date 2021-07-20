# data "terraform_remote_state" "azure_aks_vnet" {
#  backend = "azurerm"
#
#  config {
#    storage_account_name = "contourtfprod"
#    container_name       = "contour-tfstate-stg"
#    access_key           = "${var.storageAccountKey_upper_level}"
#    key                  = "terraform-vnet-non-prod-stg01.tfstate"
#  }
#}