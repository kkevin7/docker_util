#Borrar contenedores de docker

# Parar todos los contenedores
docker stop $(docker ps -a -q)

# Eliminar todos los contenedores
docker rm $(docker ps -a -q)

# Eliminar todas las imágenes
docker rmi $(docker images -q)

#mostrar volumenes
docker volume ls

#Eliminar imagenes sin utilizar
docker rmi $(docker images --filter "dangling=true" -q --no-trunc) 