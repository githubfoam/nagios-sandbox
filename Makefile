IMAGE := alpine/fio
APP:="scripts/archlinux-req.sh"

deploy-centos-stream-bento:
	bash scripts/deploy-centos-stream-bento.sh

deploy-centos-stream:
	bash scripts/deploy-centos-stream.sh

deploy-centos-bento:
	bash scripts/deploy-centos-bento.sh

deploy-centos:
	bash scripts/deploy-centos.sh
	
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
