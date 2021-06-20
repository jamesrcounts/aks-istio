default: apply

instance_id    := becoming-chicken
environment    := svc
environment_id := $(instance_id)-$(environment)

fmt:
	terraform fmt -recursive

init:
	terraform init --upgrade
	
clean:
	terraform destroy -auto-approve

config:
	@echo 'aks_cluster_name="aks-$(environment_id)"' > terraform.auto.tfvars
	@echo 'resource_group_name="rg-$(instance_id)"' >> terraform.auto.tfvars
	
validate:
	terraform validate

apply: config init fmt validate
	terraform apply

login:
	az login
	az account set --subscription "Jim Counts (MSDN)"
	az account show --output table