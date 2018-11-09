Maintained by 

nischalvasant@gmail.com
brad.savoy@gmail.com
#####
Kubernetes for the pragmatic sysadmin
#####
This gives you a framework for building out a full kubernetes deployment air-gapped, behind a firewall or otherwise disconnected from the outside world. 

Target audience are the forgotten sysadmins sitting in an air gapped data center who literally can't find a guide that doesn't ask them to clone, pull from docker hub, or curl a package randomly from the internet during the installation.


That being said, you will need to obtain some packages and bring them into your environment, but the benefit is you know exactly what is running.


There are much better ways to deploy Kubernetes - but this gives at least a hands on way to go through each stage of deployment, sans any orchestration or automatino tool that isn't a shell script so you are completely familiar with every facet of administrating a basic kubernetes cluster. 

As I said, this is a base installation that can be expaneded on depending on your application -

Development - 

	Setup -
		Get the proper binaries - and docker image binary dumps. Put the binaries in the root folder here and the docker_image binary dumps under the docker folder
		
		Get three nodes - minimum - 2 cores and 4GB ram apiece is okay for some light workloads
		
		Modify the script_stubs.conf file with your host names
		
		Run pre.sh
		
		Copy the contents of the entire folder to other boxes
		
		On each node, manually modify the write_configs_configured.sh values below to match the current node
			THIS_NAME=\${NAME_3}
			THIS_IP=\${HOST_3}
			
		
	Installation

		Run write_configs_configured.sh on each node	

		Run install_etcd_configure.sh on each node - verify etcd is up and running - etcdctl cluster-health
		
		Run setup_configured.sh on each node
		
	

This is not production ready. Things you should address before going to production -

	Philosophicals - 
	
		Does your organization really need Kubernetes? Do you really understand what it does and what it represents?
	
		Do you have the time to support the cluster and keep it pruned and organized? You will need other people to help you
	
		Don't let companies scare you about running production Kubernetes. It requires effort, but.... who didn't know that? Being a hint delusional helps as well.
	
		Is it 11PM and your reading this cause you can't sleep? Then you're probably the right kind of individual
	
	Technicals - 
	
		Separate your etcd cluster from your worker nodes - they don't need to be beefy if you're experimenting/piloting. Also, run at least 5 etcd instances
	
		Separate your control plane from your worker nodes - Ideally run a few copies (3) of each critical control plane service. If you'd like you can roll them on etcd instances, but for a larger cluster, do indeed separate them
		
		Ensure proper TLS certificates are used - signed by your organization - for all of the kubernetes control plane to communicate
	
		Lock down your dashboard and do NOT expose it to the outside world (i.e. wow! Look at my kubernetes dashboard at https://suchsuchsuch.aws-box.com - BAD idea.)
	
		Operate on a least access principle for security. That means users start with nothing, and you grant incremental access based on their needs
	

Troubleshooting -

	I can't...TODO

TODO: Adapt so deployments are automagically configured
TODO: Adapt to deploy across nodes
TODO: Adapt to deploy across arbitrary nodes
