# This script will  push the secret (from hastable) to keyvault.
#  Ex: $secrets | ./<your_script.ps1> <script_arguments> 

param ( 
    [string] $keyVaultName
)

# Login to Azure
Login-AzureRmAccount

foreach ($hashtbl in $input) {
    $keyValue = $hashtbl.Name
    $secretValue = $hashtbl.SecretValue

    Write-Output "Key value is: " $keyValue
    Write-Output "secret value is: " $secretValue

    Set-AzureKeyVaultSecret -VaultName $keyVaultName -Name $keyValue -SecretValue (ConvertTo-SecureString -String $secretValue -AsPlainText -Force)
}

