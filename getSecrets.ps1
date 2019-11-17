# This script will read the secrets from keyvault.
#  Ex: $secrets | ./<your_script.ps1> <script_arguments> 

param ( 
    [string] $keyVaultName
)

# Login to Azure
Login-AzureRmAccount

Get-AzureKeyVaultSecret -VaultName $keyVaultName | ForEach-Object {
    $secret = Get-AzureKeyVaultSecret -VaultName $keyVaultName -Name $_.Name
    Write-Output "Key  is : " $_.Name
    Write-Output "Secret  is : " $secret.SecretValueText    # read value
}

