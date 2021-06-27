default: apply

fmt:
	terraform fmt -recursive

init:
	terraform init --upgrade
	terraform providers
	
clean:
	terraform destroy -auto-approve

config:
	@echo 'aks_cluster_name="aks-becoming-chicken-dmz"' > terraform.auto.tfvars
	@echo 'resource_group_name="rg-becoming-chicken"' >> terraform.auto.tfvars
	
validate:
	terraform validate

apply: config init fmt validate
	terraform apply

login:
	az login
	az account set --subscription "Jim Counts (MSDN)"
	az account show --output table