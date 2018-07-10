docker-compose -f update-accounts.yml up --build  -d
docker rm -f update-accounts
docker rmi -f update-accounts
