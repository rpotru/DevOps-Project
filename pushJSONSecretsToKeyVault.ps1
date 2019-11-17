# This script will  push the secret (from JSON file) to keyvault.
#  Ex: $secrets | ./<your_script.ps1> <script_arguments> 

param ( 
    [string] $keyVaultName
)

# Login to Azure
Login-AzureRmAccount

foreach ($line in $input) {
    if($line) {
        foreach($l in $line){
            $keyValue = $l.Name;
            $secretValue = $l.SecretValue

            Write-Output "Key value is: " $keyValue
            Write-Output "secret value is: " $secretValue

            Set-AzureKeyVaultSecret -VaultName $keyVaultName -Name $keyValue -SecretValue (ConvertTo-SecureString -String $secretValue -AsPlainText -Force)

        }
    }
}