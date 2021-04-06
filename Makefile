IMAGE := alpine/fio
APP:="scripts/archlinux-req.sh"

deploy-vagrant-boxes:
	bash scripts/deploy-vagrant-boxes.sh

deploy-nagios:
	bash scripts/deploy-nagios.sh

deploy-nagios-docker:
	bash scripts/deploy-nagios-docker.sh

deploy-nagios-docker-prod:
	bash scripts/deploy-nagios-docker-prod.sh	

build-nagios-docker-image:
	bash scripts/build-nagios-docker-image.sh	

deploy-nagios-vagrant:
	bash scripts/deploy-nagios-vagrant.sh

deploy-libvirt:
	bash scripts/deploy-libvirt.sh

deploy-vagrant:
	bash scripts/deploy-vagrant.sh

push-image:
	docker push $(IMAGE)

.PHONY: deploy-vagrant deploy-libvirt deploy-zabbix push-image
