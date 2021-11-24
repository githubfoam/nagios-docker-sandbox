IMAGE := alpine/fio
APP:="scripts/archlinux-req.sh"


deploy-ubuntu-nagios:
	bash scripts/deploy-ubuntu-nagios.sh

deploy-centos-nagios:
	bash scripts/deploy-centos-nagios-v1.sh

deploy-libvirt:
	bash scripts/deploy-libvirt.sh

deploy-vagrant:
	bash scripts/deploy-vagrant.sh

push-image:
	docker push $(IMAGE)

.PHONY: deploy-vagrant deploy-libvirt deploy-zabbix push-image
