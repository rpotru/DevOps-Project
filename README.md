# DevOps-Tasks
---------------------------

Task 1: Create ARM template
-----------------------------------------------------
We would have to create a resource group selecting the location "eastus2" prior to this. Or we can hard code the location eastus2 in template. But, I would like to avoid hardcoding values in the template.

New-AzureRmResourceGroup -Name 'testrg' -Location 'eastus2' -Force
New-AzureRmResourceGroupDeployment -ResourceGroupName 'testrg' -TemplateFile .\template.json -TemplateParameterFile .\parameters.json -Force -Verbose

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












