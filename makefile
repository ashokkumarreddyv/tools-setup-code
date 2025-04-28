infra:
	git pull
	terraform init
	terraform plan
	terraform -auto-approve
