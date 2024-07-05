terraform {
  backend "azurerm" {
    storage_account_name = "tf7379storage"
    container_name       = "tfstatecont"
    key                  = "terraformpipe.tfstate"
    use_azuread_auth     = true
    access_key = "92tRqyFpu+LAJ+i5PNT1sISqvUfq44f/0taVa0Wcw+qpgfobROfiypPMMXLTtujXuRER7/mxyPQ1+AStIMppEg=="
}
