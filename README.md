### hit-base-tool-deploy
This repository is to deploy the hit-base-tool located at https://github.com/haffo/hit-base-tool/. The deployment script handles the deployment of the following tools: 
-  iztool-cni: Immunization tool for CNI
branch: iztool-cni  
- iztool:  Immunization tool for NIST 


#### Pre-requirements 
- docker: Instructions to install docker can be found at https://www.docker.com/docker-community
- docker-compose: Instructions to install docker-compose can be found at https://www.docker.com/docker-community
- git: Instructions to install git can be found at https://git-scm.com/

#### Deployment steps  

##### iztool-cni 
1) Switch to the `iztool-cni` branch 
- `git branch iztool-cni`
2) Remove old db files to ensure new resource bundle data will be loaded
- `rm -r ./data/app/db`  
3) Starts the containers  
 - `cd container-config` 
 - `./deploy.sh`
4) Access the tool at https://localhost/

 
##### iztool 
1) Switch to the `iztool-nist` branch 
- `git branch iztool-nist`
2) Remove old db files to ensure new resource bundle data will be loaded
- `rm -r ./data/app/db`  
3) Starts the containers  
 - `cd container-config` 
 - `./deploy.sh`
4) Access the tool at https://localhost/

##### Change certs files site
It is not recommended to use the self signed certificates for production site.  You should get your own certificates and add them to the deployment scripts as followed

1) Add you certs files to ./hit-base-tool-proxy/certs
cp my.cert.pem ./hit-base-tool-proxy/certs/
cp my.key.pem ./hit-base-tool-proxy/certs/

2) Replace certs file values 
ARG servercer=certs/my.cert.pem
ARG serverkey=certs/my.key.pem

3) Set your hostname 
Replace 'localhost' by your hostname in ./hit-base-tool-proxy/Dockerfile
- `ARG serverhost=myhostname`

4) Access the tool at `https://myhostname/`



### Migrating 
- `cd container-config`
- `./update-accounts.sh` 
 
 
###  Where to find the data ?
All data are mounted to host which means they are accessible from your host under the data folder 
1) hit-base-tool logs 
./data/hit-base-tool/db/data/ 

2) hit-base-tool-account-db logs 
./data/hit-base-tool-account-db/data/ 


###  Where to find the logs ? 
All the logs are mounted to your host.  The logs are available under: 
1) hit-base-tool logs 
./data/hit-base-tool/app/logs/app/
./data/hit-base-tool/app/logs/tomcat/
./data/hit-base-tool/db/logs/ 

2) hit-base-tool-account-db logs 
./data/hit-base-tool-account-db/logs/ 

3) hit-base-tool-proxy logs 
./data/hit-base-tool-proxy/logs/ 


###  How to change the logs properties? 
To change the logs properties edit the log4j ./data/hit-base-tool/app/logs/config/app-log4j.properties 


###  How to deploy a different version of the war file
1) Open the ./container-config/hit-base-tool/app/Dockerfile and comment line 5 and uncomment line 6. Make sure the name of the new war file is 'hit-base-tool.war' 

2) Delete the previous war file data.  All test cases will be deleted and replaced by the new data of the new war file
- `rm -r ./data/hit-base-tool/db/` 

3) Deploy  
 - `cd container-config` 
 - `./deploy.sh`


