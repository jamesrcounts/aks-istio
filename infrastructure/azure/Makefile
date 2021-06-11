default: apply

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
	
validate:
	terraform validate

apply: init fmt connect validate
	terraform apply

login:
	az login
	az account set --subscription "Jim Counts (MSDN)"
	az account show --output table