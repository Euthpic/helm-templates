
deploy-project为helm安装应用的名称,建议与项目名称相同,test-space为k8s的namespace

# 安装
helm install [NAME] [CHART] [flags]
helm install deploy-project ./ --namespace test-space

# 查看安装
helm list --namespace test-space
kubectl -n test-space get deploy | grep deploy-project
kubectl -n test-space get pod | grep deploy-project

# 卸载
helm uninstall deploy-project --namespace test-space

# 更新
helm upgrade  deploy-project ./  -n test-space
