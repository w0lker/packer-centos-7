TMP=packer_cache

all:ansible packer

ansible:
	@echo ansible-galaxy install -r requirements.txt
	ansible-galaxy install -r requirements.txt

packer:
	@echo packer build centos7.json
	packer build centos7.json

.PHONY:clean
clean:
	@echo -rm -rf $(TMP)
	-rm -rf $(TMP)
	@echo -rm -rf *-centos7.box
	-rm -rf *-centos7.box
