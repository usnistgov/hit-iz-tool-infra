#**** README #

This folder contains files related to the Docker artifacts to configure the needed containers:

 - container for the tool
 - container for the database
 - container for the web server 
 
 **Command to fix the war file.** 
 
 `zip -d erx2015/app/war/hit-base-tool.war "/WEB-INF/lib/log4j-over-slf4j-1.7.2.jar"` 
 `zip -d erx2017/app/war/ncpdp-tool.war "/WEB-INF/lib/log4j-over-slf4j-1.7.2.jar"`

**Production**
./clean-all.sh 
./deploy-prod.sh 

**Development** 
./clean-all.sh 
./deploy-dev.sh  

*** Migrate / Import NIST accounts to NCPDP 
`./update-accounts.sh` 
 
