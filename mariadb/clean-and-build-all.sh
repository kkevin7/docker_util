# Eliminar los contenedos
docker-compose down
# Parar todos los contenedores
docker stop $(docker ps -a -q)
# Eliminar todos los contenedores
docker rm $(docker ps -a -q)
# Eliminar todos los volumenes
docker volume rm $(docker volume ls)
# Reconstruir el contenedor
docker-compose up --build