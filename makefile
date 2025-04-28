infra:
	git pull
	terraform init
	terraform plan
	terraform approve -auto-approve
