### hl7-iz-cdc-deploy
This repository is to deploy the hit-base-tool located at https://github.com/haffo/hit-base-tool/. The deployment script handles the deployment of the following tools: 
-  iztool-cni: Immunization tool for CNI
branch: iztool-cni  
- iztool:  Immunization tool for NIST

#### Deployment steps  

##### iztool-cni 
1) Switch to the `iztool-cni` branch 
`git branch iztool-cni`
2) Remove old db files to ensure new resource bundle data will be loaded
`rm -r ./data/app/db`  
3) Starts the containers  
`./container-config/deploy.sh`
4) Access the tool at https://localhost/

 
##### iztool 
1) Switch to the `iztool` branch 
`git branch iztool-cni`
2) Remove old db files to ensure new resource bundle data will be loaded
`rm -r ./data/app/db`  
3) Starts the containers  
`./container-config/deploy.sh`
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
`ARG serverhost=myhostname`

4) Access the tool at `https://myhostname/`



### Migrating 
1) `cd container-config`
2) `./update-accounts.sh` 
 
 

