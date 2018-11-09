#sudo systemctl daemon-reload
sudo systemctl stop kube-apiserver
sudo /usr/bin/systemctl stop kube-scheduler
sudo /usr/bin/systemctl stop kube-controller-manager
sudo /usr/bin/systemctl stop kube-proxy
sudo /usr/bin/systemctl stop kubelet
sudo /usr/bin/systemctl stop flanneld

