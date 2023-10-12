# build image dengan nama item-app
docker build --tag=item-app:v1 .
# Menampilkan daftar image
docker images
# memberikan tag pada image agar dapat di-push
docker tag item-app:v1 ghcr.io/egi-190137/item-app:v1
# login pada github container registry dengan token yang tersimpan pada environment variable
echo $GH_TOKEN | sudo docker login ghcr.io -u egi-190137 --password-stdin
# Push image ke github container registry
sudo docker push ghcr.io/egi-190137/item-app:v1