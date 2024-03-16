terraform {
  backend "azurerm" {
    storage_account_name = "tfstaterg1234"
    container_name       = "tfstate1"
    key                  = "terraformpipe.tfstate"
    use_azuread_auth     = true
    access_key = "icU7ar7JOM/H4G+VKcvVLjEuG/KuNK+WINhSfCyTCoT0+Ozi0mc4orP3pCiadOjGq2WMDhtRu8TM+AStY9OTFQ=="
  }
}
