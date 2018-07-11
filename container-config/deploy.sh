#./clean-all.sh
docker build -t ubuntu-base ./common/ubuntu-base
docker build -t tomcat-base ./common/tomcat-base
docker-compose -f docker-compose.yml -f docker-compose-dev.yml up --build  -d



