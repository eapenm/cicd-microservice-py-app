# SonarQube Configuration

Administration>Security>Users

![Alt text](assets/sonarqube_user_config.png)

Click on the Tokens:
![Alt text](assets/sonarqube_user_token_config.png)

Provide a Name "token" and click on "Generate" Button

![Alt text](assets/sonarqube_user_token_gen_config.png)

Once the token is generated, click the "Copy" button to copy the token

Open Jenkins>Manage Jenkins and select "Credentials"
![Alt text](assets/sonarqube_credentials.png)

Click on global> Add Credenials button 
Paste the token generated from the sonarqube application to the secret field
![Alt text](assets/jenkins_sonar_credentials.png)

![Alt text](assets/sonar_cred_saved.png)


Now, Add the sonarqube server in jenkins

Manage Jenkins> System , Goto "SonarQube Servers" click on "Add SonarQube"

![Alt text](assets/sonarqubeServer1.png)
Add the sonarqube server Url
![Alt text](assets/sonarqubeServer2.png)