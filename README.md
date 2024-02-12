# DevOps-Task

Few steps you need to do :

1.Use ./image-build.sh to build the image for the slave agent , before the execute use "chmod +x image-build.sh" .

2.In jenking UI add label 'builtin' to the existing node and create an agent by the name 'agent' and change the SECRET_KEY inside the docekr-compose.yaml (then docker-compose up -d to reload).

3.Copy the pipeline from the Jenkinsfile into the pipeline script UI.

4.Build

*** 
    If there is a permissions error in the first stage of pulling the curl repo you need to do the following : 
    docker exec -it -u0 jenkins-master bash
    then you get inside the container as a root and run this command : 
    chmod -R 777 home
***

