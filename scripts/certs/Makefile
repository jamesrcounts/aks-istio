default: version

portal      := portal.jamesrcounts.com
gateway     := api.jamesrcounts.com
instance_id := ample-gannet
kv          := kv-$(instance_id)

version: 
	certbot --version

workspace: 
	bash -c "mkdir -p ~/certbot/{config,work,log,certs}"

issue: workspace
	bash ./issue-certs.sh $(portal)
	bash ./issue-certs.sh $(gateway)

pfx: workspace
	bash ./create-pfx.sh $(portal)
	bash ./create-pfx.sh $(gateway)

pem: workspace
	bash ./create-pem.sh $(portal)
	bash ./create-pem.sh $(gateway)

upload: pfx pem
	bash ./upload-pfx-cert.sh $(portal) $(kv) 
	bash ./upload-pem-cert.sh $(portal) $(kv)
	bash ./upload-pfx-cert.sh $(gateway) $(kv)
	bash ./upload-pem-cert.sh $(gateway) $(kv)
