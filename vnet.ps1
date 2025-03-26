# Create a resource group
$rg = @{
    Name = 'test-rg'
    Location = 'eastus2'
}
New-AzResourceGroup @rg

# Create a virtual network

$vnet = @{
    Name = 'vnet-1'
    ResourceGroupName = 'test-rg'
    Location = 'eastus2'
    AddressPrefix = '10.0.0.0/16'
}
$virtualNetwork = New-AzVirtualNetwork @vnet

# Create a subnet
$subnet = @{
    Name = 'subnet-1'
    VirtualNetwork = $virtualNetwork
    AddressPrefix = '10.0.0.0/24'
}
$subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet

$virtualNetwork | Set-AzVirtualNetwork

# Create a network security group
$nsg = @{
    Name = 'nsg-1'
    ResourceGroupName = 'test-rg'
    Location = 'eastus2'
}
$networkSecurityGroup = New-AzNetworkSecurityGroup @nsg 

############################################################################################################
# Create a second virtual network
$vnet2 = @{
    Name = 'vnet-2'
    ResourceGroupName = 'test-rg'
    Location = 'eastus2'
    AddressPrefix = '10.1.0.0/16'
}
$virtualNetwork2 = New-AzVirtualNetwork @vnet2

# Create a subnet for the second virtual network
$subnet2 = @{
    Name = 'subnet-2'
    VirtualNetwork = $virtualNetwork2
    AddressPrefix = '10.1.0.0/24'
}
$subnetConfig2 = Add-AzVirtualNetworkSubnetConfig @subnet2

$virtualNetwork2 | Set-AzVirtualNetwork

# Create virtual network peering from vnet-1 to vnet-2
$peering1 = @{
    Name = 'vnet1-to-vnet2'
    VirtualNetwork = $virtualNetwork
    RemoteVirtualNetworkId = $virtualNetwork2.Id
    AllowForwardedTraffic = $true
    AllowGatewayTransit = $false
    AllowVirtualNetworkAccess = $true
}
Add-AzVirtualNetworkPeering @peering1

# Create virtual network peering from vnet-2 to vnet-1
$peering2 = @{
    Name = 'vnet2-to-vnet1'
    VirtualNetwork = $virtualNetwork2
    RemoteVirtualNetworkId = $virtualNetwork.Id
    AllowForwardedTraffic = $true
    AllowGatewayTransit = $false
    AllowVirtualNetworkAccess = $true
}
Add-AzVirtualNetworkPeering @peering2

<#
.SYNOPSIS
Provides help and documentation for Azure (Az) PowerShell modules.

.DESCRIPTION
The `Get-Help` cmdlet in PowerShell is used to display help about PowerShell cmdlets, functions, workflows, aliases, and scripts. This can be used to get detailed information about the Az modules, including syntax, parameters, and examples.

.EXAMPLES
# Example 1: Get help for a specific Az module cmdlet
Get-Help -Name Get-AzResourceGroup

# Example 2: Get detailed help with examples for a specific Az module cmdlet
Get-Help -Name Get-AzResourceGroup -Detailed

# Example 3: Get full help including parameter descriptions and examples for a specific Az module cmdlet
Get-Help -Name Get-AzResourceGroup -Full

# Example 4: Get online help for a specific Az module cmdlet
Get-Help -Name Get-AzResourceGroup -Online

.PARAMETER Name
Specifies the name of the cmdlet, function, workflow, alias, or script for which you want to display help.

.PARAMETER Detailed
Displays detailed help information, including parameter descriptions and examples.

.PARAMETER Full
Displays the complete help information, including parameter descriptions, examples, and additional notes.

.PARAMETER Online
Opens the online version of the help topic in the default web browser.

.NOTES
For more information about the Az PowerShell module, visit the official documentation at:
https://docs.microsoft.com/en-us/powershell/azure/new-azureps-module-az
#>