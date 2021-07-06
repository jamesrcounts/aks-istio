default: apply

instance_id         := becoming-chicken
backend_instance_id := ample-gannet

fmt:
	terraform fmt -recursive

init:
	terraform init --upgrade  -backend-config azurerm.backend.tfvars
	
clean: 
	terraform destroy -auto-approve
	az rest --method delete --header "Accept=applicaiton/json" -u 'https://management.azure.com/subscriptions/bbb80ca8-cf8a-4d13-8fa4-6027d7e5b71d/providers/Microsoft.ApiManagement/locations/centralus/deletedservices/apim-$(instance_id)?api-version=2020-06-01-preview' 

connect:
	terraform init -get=false
	terraform -v
	terraform providers

backend_config:
	az keyvault secret download \
		--name azurerm-backend-tfvars \
		--vault-name kv-$(backend_instance_id) \
		--file azurerm.backend.tfvars

config:
	@echo 'resource_group_name="rg-$(instance_id)"' > terraform.auto.tfvars
	
validate:
	terraform validate

apply: config init fmt connect validate
	terraform apply

login:
	az login
	az account set --subscription "Jim Counts (MSDN)"
	az account show --output table