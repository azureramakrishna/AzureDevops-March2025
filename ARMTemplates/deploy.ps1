# # Login to azure account
# Login-AzAccount -TenantId 459865f1-a8aa-450a-baec-8b47a9e5c904 -SubscriptionId 2e28c82c-17d7-4303-b27a-4141b3d4088f

# # Create a new resource group
# New-AzResourceGroup -Name "arm" -Location "East US"

# Deploy the template
New-AzResourceGroupDeployment -ResourceGroupName "arm" -TemplateFile ./template.json -TemplateParameterFile ./parameters.json -verbose