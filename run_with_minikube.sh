# Start minikube
minikube start

# Step 1 build docker image
docker build --tag=nginxapp .
dockerpath="bencdr0/nginxapp"
echo "Docker ID and Image: $dockerpath"

# Step 2: Authenticate & tag
docker login --username $DOCKERHUB_USERNAME --password $DOCKERHUB_PASSWORD
docker tag nginxapp:latest $dockerpath:latest # according to docker standard documentation
docker image ls

# Step 3: Push image to a docker repository, according to cheat-sheet and standard documentation
docker push $dockerpath:latest
docker logout


sleep 5

# Step 2 - Run the Docker Hub container with kubernetes
minikube kubectl -- create deployment nginxapp-deployment --image=bencdr0/nginxapp:latest
# Reference: https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Imperative-vs-declarative-Kubernetes-commands-Whats-the-difference
minikube kubectl -- scale --replicas=3 deployment/nginxapp-deployment 
minikube kubectl -- expose deployment nginxapp-deployment --type=NodePort --port=8000 --target-port=80

# sleep to allow full start-up
sleep 5

# Step 3 - List all relevant pod, deployment, service, node information to debug

curl $(minikube service nginxapp-deployment --url)

# echo "----------------index.html before change----------------"
# cat index.html
mv index.html index_old.html # index_old
mv index_new.html index.html # index
# echo "----------------index.html after change----------------"
# cat index.html

# Step 1 build docker image
docker build --tag=nginxapp .
dockerpath="bencdr0/nginxapp"
echo "Docker ID and Image: $dockerpath"

# Step 2: Authenticate & tag
docker login --username $DOCKERHUB_USERNAME --password $DOCKERHUB_PASSWORD
docker tag nginxapp:latest $dockerpath:latest # according to docker standard documentation
docker image ls

# Step 3: Push image to a docker repository, according to cheat-sheet and standard documentation
docker push $dockerpath:latest
docker logout

sleep 10

minikube kubectl -- set image deployments/nginxapp-deployment nginxapp=bencdr0/nginxapp:latest
# Reference: https://stackoverflow.com/a/51835397
minikube kubectl -- rollout restart deployments/nginxapp-deployment

# Sleep to allow for startup
# sleep 15

# see rollout status
minikube kubectl -- rollout status deployments/nginxapp-deployment

curl $(minikube service nginxapp-deployment --url)

# echo "----------------index.html before change----------------"
# cat index.html
mv index.html index_new.html 
mv index_old.html index.html
# echo "----------------index.html after change----------------"
# cat index.html

minikube delete --all
docker system prune
minikube ssh -- docker system prune
