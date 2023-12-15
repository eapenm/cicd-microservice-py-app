# Terraform Script to Create the Servers
I have refered this terraform script from the following github account: https://github.com/Aj7Ay/Amazon-FE/blob/main/JENKINS-TF/install_jenkins.sh

### Terraform Script to create the EC2 Server
Below Terraform script will create the EC2 instance for deploying the jenkins software. we will provision a server with t2.large since we ahve to install jenkins,sonarqube and trivy

```tf
resource "aws_instance" "web" {
  ami                    = "ami-0fc5d935ebf8bc3bc"
  instance_type          = "t2.large"
  key_name               = "Robin"
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
  user_data              = templatefile("./install_jenkins.sh", {})

  tags = {
    Name = "Jenkins Server"
  }
  root_block_device {
    volume_size = 30
  }
}
```

We have invoked a shell script to install the following required tools

- Jenkins
- Docker
- Install Docker container for SonarQube 
- Trivy software
- OWASP Tool to scan the vulnerability

Shell script to install the tools are as follows:

```sh
#!/bin/bash
sudo apt update -y
wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc
echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
sudo apt update -y
sudo apt install temurin-17-jdk -y
/usr/bin/java --version
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins

#install docker
sudo apt-get update
sudo apt-get install docker.io -y
sudo usermod -aG docker ubuntu  
newgrp docker
sudo chmod 777 /var/run/docker.sock
docker run -d --name sonar -p 9000:9000 sonarqube:lts-community

# install trivy
sudo apt-get install wget apt-transport-https gnupg lsb-release -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy -y
```
### Jenkins plugins to install:
[Reguired Jenkins Plugin for this Project](documentation/jenkins_plugins.md)

### How to Configure the shared jenkins library in the jenkins.

Github Url for the sahred library is as follows: https://github.com/eapenm/jenkins-shared-library

Steps to configure:
•	Go to your Jenkins dashboard.
•	Click on "Manage Jenkins" in the left sidebar.
•	Select "Configure System."
•	Scroll down to the "Global Pipeline Libraries" section.
•	Click on "Add" to add a new library.
•	Provide a name for the library (e.g., "MySharedLibrary").
•	Enter the repository URL (e.g., https://github.com/yourusername/your-shared-library.git).
•	Save the configuration.

![image](https://github.com/eapenm/cicd-microservice-py-app/assets/13297994/59390451-8c2f-4c88-b3c5-758c2d1a5850)
![image](https://github.com/eapenm/cicd-microservice-py-app/assets/13297994/4302e2ec-d2bd-4394-a278-cc40d2c7659f)



