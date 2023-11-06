# build image dengan nama ghcr.io/<username>/karsajobs-ui:latest
docker build -t ghcr.io/egi-190137/karsajobs-ui:latest .
# login pada github container registry dengan token yang tersimpan pada environment variable
echo $GH_TOKEN | sudo docker login ghcr.io -u egi-190137 --password-stdin
# Push image ke github container registry
sudo docker push ghcr.io/egi-190137/karsajobs-ui:latest