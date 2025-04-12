ДЗ1 по практикуму по промышленной разработки ПО

Предварительно запустите minikube и tunnel
```shell
minikube start
minikube tunnel
```
Запуск скрипта
```shell
chmod +x ./kuber/deploy.sh
./kuber/deploy.sh
```

В логах будет отображен внешний ip.
Для проверки распределения запросов по подам можно наспамить через bomb.sh
```
chmod +x ./kuber/bomb.sh
./kuber/bomb.sh <IP из логов или kubectl get svc hw1-service -o jsonpath='{.status.loadBalancer.ingress[0].ip}'>
```

P.S. используется образ текущего проекта, полученный при помощи
```
docker build -t annstase/sbt_devops:3 .
docker push annstase/sbt_devops:3
```
Ивановой Анастасии, Б05-123