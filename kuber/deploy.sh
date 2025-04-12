#!/bin/bash

echo "[1] Применение конфигов"
kubectl apply -f ./kuber/application-config.yaml
kubectl apply -f ./kuber/pod.yaml
kubectl apply -f ./kuber/deployment.yaml
kubectl apply -f ./kuber/cluster-ip.yaml
kubectl apply -f ./kuber/daemonset.yaml
kubectl apply -f ./kuber/cron.yaml

echo "[2] Ожидание готовности Deployment"
kubectl rollout status deployment/hw1-deployment
echo "[3] Ожидание готовности демона логов"
kubectl rollout status daemonset/log-agent

echo "[4] Ожидание появления external-ip (запустите minikube tunnel, если не запущен)"
ATTEMPTS=20
INTERVAL=3
for i in $(seq 1 $ATTEMPTS); do
  EXTERNAL_IP=$(kubectl get svc hw1-service -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
  if [ -n "$EXTERNAL_IP" ]; then
    echo "External IP:: $EXTERNAL_IP"
    break
  fi
  echo "Ожидание появления external-ip... ($i/$ATTEMPTS)"
  sleep $INTERVAL
  if [ "$i" -eq "$ATTEMPTS" ]; then
    echo "External IP не установлен. Запустите 'minikube tunnel', затем вручную проверьте IP: 'kubectl get svc hw1-service'"
  fi

done

echo "Готово"
