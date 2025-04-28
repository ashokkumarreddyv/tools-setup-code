infra:
	git pull
	terraform ulimit
	terraform plan
	terraform approve -auto-approve
