sudo docker stop saga-dns
sudo docker rm saga-dns
sudo docker run -d --name=saga-dns -p 53:53/tcp -p 53:53/udp --cap-add=NET_ADMIN arthurkay/sagittarius-a