# Define parameters
$resourceGroupName = "example-resources"
$location = "West Europe"
$storageAccountName = "examplestorageacc"

# Create a resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create a storage account
New-AzStorageAccount -ResourceGroupName $resourceGroupName `
    -Name $storageAccountName `
    -Location $location `
    -SkuName "Standard_LRS" `
    -Kind "StorageV2" `
    -EnableHttpsTrafficOnly $true

# Add tags to the storage account
Set-AzResource -ResourceId (Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName).Id -Tag @{ environment = "staging" } -Force