# This script will  push the secret (from hastable) to keyvault.
#  Ex: $secrets | ./<your_script.ps1> <script_arguments> 

param ( 
    [string] $location = "eastus2",
    [string] $rgName = "testrg",
    [string] $templateFile = ".\template.json",
    [string] $templateParamterFile = ".\parameters.json"
)


# Login to Azure
Login-AzureRmAccount

New-AzureRmResourceGroup -Name $rgName -Location $location -Force

New-AzureRmResourceGroupDeployment -ResourceGroupName $rgName -TemplateFile $templateFile -TemplateParameterFile $templateParamterFile -Force -Verbose

