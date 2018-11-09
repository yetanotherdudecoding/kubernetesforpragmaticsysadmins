#!/bin/bash
echo "Configuring installation as follows:"
source ./script_stubs.conf
cp ./write_configs.template ./write_configs_configured.sh
cp ./setup.template ./setup_configured.sh
cp ./pki/apiserver_csr.template ./pki/apiserver_csr.conf
cp ./install_etcd.template ./install_etcd_configured.sh
cp ./load_modify_push_dockerimages.template ./load_modify_push_dockerimages.sh
chmod +x ./*.sh
for each in $(cat script_stubs.conf | awk -F "=" {'print $1'}); do
 	 eval "echo $each"
done
for each in $(cat script_stubs.conf | awk -F "=" {'print $2'}); do
         eval "echo $each"
done

for each in $(cat script_stubs.conf); do
	STUB=$(echo $each | awk -F "=" {'print $1'})
	VALUE=$(echo $each | awk -F "=" {'print $2'})
	echo "Replacing $STUB with $VALUE"	
	sed -i "s/$STUB/$VALUE/g" ./write_configs_configured.sh
	sed -i "s/$STUB/$VALUE/g" ./setup_configured.sh
	sed -i "s/$STUB/$VALUE/g" ./pki/apiserver_csr.conf
	sed -i "s/$STUB/$VALUE/g" ./install_etcd_configured.sh
	sed -i "s/$STUB/$VALUE/g" ./load_modify_push_dockerimages.sh
done
cd ./pki
./gen_new_keys.sh
echo "you may now proceed with write_configs and then setup scripts"
