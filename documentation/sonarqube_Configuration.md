# SonarQube Configuration

Administration>Security>Users

![](https://github.com/eapenm/cicd-microservice-py-app/blob/dev/assets/sonarqube_user_config.png)

Click on the Tokens:
![](https://github.com/eapenm/cicd-microservice-py-app/blob/dev/assets/sonarqube_user_token_config.png)

Provide a Name "token" and click on "Generate" Button

![](https://github.com/eapenm/cicd-microservice-py-app/blob/dev/assets/sonarqube_user_token_gen_config.png)

Once the token is generated, click the "Copy" button to copy the token

Open Jenkins>Manage Jenkins and select "Credentials"
![](https://github.com/eapenm/cicd-microservice-py-app/blob/dev/assets/sonarqube_credentials.png)

Click on global> Add Credenials button 
Paste the token generated from the sonarqube application to the secret field
![](https://github.com/eapenm/cicd-microservice-py-app/blob/dev/assets/jenkins_sonar_credentials.png)

![](https://github.com/eapenm/cicd-microservice-py-app/blob/dev/assets/sonar_cred_saved.png)


Now, Add the sonarqube server in jenkins

Manage Jenkins> System , Goto "SonarQube Servers" click on "Add SonarQube"

![](https://github.com/eapenm/cicd-microservice-py-app/blob/dev/assets/sonarqubeServer1.png)
Add the sonarqube server Url
![](https://github.com/eapenm/cicd-microservice-py-app/blob/dev/assets/sonarqubeServer2.png)