docker swarm init --advertise-addr <manager-node-ip>
docker swarm join --token <token> <manager-node-ip>:<port>
docker swarm join --token <token> <manager-node-ip>:<port>

#Создаем сервисы для каждого окружения на кластере Docker Swarm
docker stack deploy -c docker-compose.dev.yml dev
docker stack deploy -c docker-compose.prod.yml prod
docker stack deploy -c docker-compose.lab.yml lab

#Убеждаемся, что на каждой ноде в кластере Docker Swarm есть по два работающих контейнера для Apache и Redis.
docker service ls
docker service ps