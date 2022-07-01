


#k create deployment -n middleware-migrate zookeeper --image=harbor.x.com.cn/system/zookeeper:3.4.8 --port=2181 --dry-run=client -o yaml > zookeeper-deploy.yaml
#k expose -n middleware-migrate deployment zookeeper --target-port=2181 --type=NodePort


#k -n middleware-migrate get deploy
#k -n middleware-migrate get po
#k -n middleware-migrate get svc
#k -n middleware-migrate get ep
#


k -n test-space get deploy,svc,ep,pvc | grep zookeeper

k -n test-space get pod | grep zookeeper


