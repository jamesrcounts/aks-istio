default: plan

aks_cluster_name    := aks-becoming-chicken-dmz
resource_group_name := rg-becoming-chicken

fmt:
	terraform fmt -recursive

init:
	terraform init --upgrade
	terraform providers
	
clean:
	terraform destroy -auto-approve

config:
	@echo 'aks_cluster_name   ="$(aks_cluster_name)"' > terraform.auto.tfvars
	@echo 'resource_group_name="$(resource_group_name)"' >> terraform.auto.tfvars
	
validate:
	terraform validate

plan: config init fmt validate
	terraform plan -out plan.tfplan

apply: 
	terraform apply plan.tfplan
	rm plan.tfplan

graph: plan
	terraform graph -plan=plan.tfplan > plan.dot

login:
	az login
	az account set --subscription "Jim Counts (MSDN)"
	az account show --output table

aks-login:
	az aks get-credentials -a -n $(aks_cluster_name) -g $(resource_group_name) --overwrite-existing