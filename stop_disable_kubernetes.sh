sudo systemctl daemon-reload
sudo systemctl stop kube-apiserver
sudo systemctl stop kube-scheduler
sudo systemctl stop kube-controller-manager
sudo systemctl stop kube-proxy
sudo systemctl stop kubelet
sudo systemctl stop flannel
sudo systemctl stop etcd
sudo systemctl disable etcd
sudo systemctl disable kube-apiserver
sudo systemctl disable kube-scheduler
sudo systemctl disable kube-controller-manager
sudo systemctl disable kube-proxy
sudo systemctl disable kubelet
sudo systemctl disable flannel

