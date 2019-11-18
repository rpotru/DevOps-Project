# DevOps-Tasks
---------------------------

Task 1: Create ARM template
-----------------------------------------------------
./createAzureKeyVaultUsingARM -Location 'eastus2' -rgName 'testrg' $templateFile -templateParamterFile .\parameters.json -Force -Verbose

Task 2: (hash table) push secrets to keyvault.
-----------------------------------------------------
$secrets = @{Name='connectionString1';SecretValue='676765@33454'}
Ex: $secrets | ./pushhashtableSecretsToKeyVault.ps1 -keyVaultName ecb99testkeyvault

Task 3: Read key/values from keyvault.
-----------------------------------------------------
./getSecrets.ps1 -keyVaultName ecb99testkeyvault

Task 4: (JSON file) | push secrets to keyvault.
----------------------------------------------------------
$secrets = Get-Content JSONFile.json  | ConvertFrom-JSON
$secrets | ./pushJSONSecretsToKeyVault.ps1 -keyVaultName ecb99testkeyvault

Task 5: Create a Docker File.
------------------------------------------------------
DockerFile has been created as per the requirement.











