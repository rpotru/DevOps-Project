# This is a helper script to be called from DockerFile.

param ( 
    [string] $location = "eastus2",
    [string] $rgName = "testrg",
    [string] $templateFile = ".\template.json",
    [string] $templateParamterFile = ".\parameters.json",
    [string] $keyVaultName = "ecb99testkeyvault"
)

.\createAzureKeyVaultUsingARM.ps1  -ResourceGroupName $rgName -TemplateFile .\template.json -TemplateParameterFile .\parameters.json -Force -Verbose  # Create keyVault
.\pushJSONSecretsToKeyVault -keyVaultName $keyVaultName     # Push key,value pairs to keyVault
.\getSecrets.ps1 -keyVaultName $keyVaultName                # Retrieve key,value pairs