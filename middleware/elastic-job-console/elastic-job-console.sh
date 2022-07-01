





k create deployment -n middleware-migrate elastic-job-console --image=harbor.x.com.cn/system/elastic-job-console:3.4.8 --port=8899 --dry-run=client -o yaml > elastic-job-console-deploy.yaml
k expose -n middleware-migrate deployment elastic-job-console --target-port=2181 --type=NodePort


k -n middleware-migrate get deploy
k -n middleware-migrate get po
k -n middleware-migrate get svc
k -n middleware-migrate get ep








