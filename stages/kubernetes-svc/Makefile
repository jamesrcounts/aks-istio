default: apply

instance_id         := becoming-chicken
environment         := svc
environment_id      := $(instance_id)-$(environment)
aks_cluster_name    := aks-$(environment_id)
resource_group_name := rg-$(instance_id)

fmt:
	terraform fmt -recursive

init:
	terraform init --upgrade
	
clean:
	terraform destroy -auto-approve

config:
	@echo 'aks_cluster_name="$(aks_cluster_name)"' > terraform.auto.tfvars
	@echo 'resource_group_name="$(resource_group_name)"' >> terraform.auto.tfvars
	
validate:
	terraform validate

apply: config init fmt validate
	terraform apply

login:
	az login
	az account set --subscription "Jim Counts (MSDN)"
	az account show --output table

aks-login:
	az aks get-credentials -a -n $(aks_cluster_name) -g $(resource_group_name) --overwrite-existing