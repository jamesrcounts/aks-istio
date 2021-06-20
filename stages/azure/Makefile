default: apply

instance_id := becoming-chicken

fmt:
	terraform fmt -recursive

init:
	terraform init --upgrade
	
clean:
	terraform destroy -auto-approve

connect:
	terraform init -get=false
	terraform -v
	terraform providers

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