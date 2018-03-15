.ONESHELL:
.PHONEY: plan apply destroy

init:
	@terraform init

plan: init
	@terraform plan 

apply: init destroy 
	@terraform destroy && terraform apply 

destroy: init
	@terraform destroy