# 查看 nodeport
kubectl get svc -n monitoring | grep prometheus-k8s

# 获取访问链接
# 11.11.11.111 为其中一个node ip
NODE_IP='192.168.19.16'
PROMETHEUS_NODEPORT=$(kubectl get svc -n monitoring | grep prometheus-k8s | awk '{print $(NF-1)}' | cut -d ':' -f 2 | cut -d '/' -f 1)
echo "http://$NODE_IP:$PROMETHEUS_NODEPORT/"

kubectl get svc -n monitoring | grep grafana
GRAFANA_NODEPORT=$(kubectl get svc -n monitoring | grep grafana | awk '{print $(NF-1)}' | cut -d ':' -f 2 | cut -d '/' -f 1)
echo "http://$NODE_IP:$GRAFANA_NODEPORT/"

kubectl get svc -n monitoring | grep alertmanager-main
ALERTMANAGER_MAIN_NODEPORT=$(kubectl get svc -n monitoring | grep alertmanager-main | awk '{print $(NF-1)}' | cut -d ':' -f 2 | cut -d '/' -f 1)
echo "http://$NODE_IP:$ALERTMANAGER_MAIN_NODEPORT/"
