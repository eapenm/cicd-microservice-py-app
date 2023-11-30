# Devsecops pipeline using jenkins and the others tools

![Architecture_Diagram_Devsecops_Pipeline](https://github.com/eapenm/cicd-microservice-py-app/assets/13297994/0314d468-1d6c-4815-8b13-03dc2653368f)

### We have two Phases in this pipeline

- Following are the different stages for Continuous Integration Phase:
  - Execute the unit test/automation test/integration test
  - Execute SonarQube on the source code for static code analysis and code smells
  - Execute OWASP for the dependency checker vulnerabilities 
  - Execute Trivy for the security issues and the Vulnerabilities
  - Build the Docker image 
  - Push the docker image to docker hub/ECR
  - Scan the docker container using trivy for the possible security vulnerabilities.
  - Once we complete all the above stages then we update the kubernetes manifest files with the latest build number
- Second Phase of the project is as follows:
  - Once the kubernetes manifest files are updated then the ARGOCD tool will identify the changes in the manifest files.
  - Argo CD will execute the updated manifest files against the kubernetes deployment
- Observability
  - We will use Prometes for the observability
  - We will use Grafana for creating the different dashboards using the data collected by Prometeus.     

### Details about the tools used in this pipeline

- [What is Gitpod?](documentation/gitpod.md)
- [Python Service](documentation/python_service.md)
- Terraform Modules
  - [Terraform Script - Jenkins Server](documentation/jenkins_terraform.md)
  - [Terraform Script - Elastic Kubernetes Service](documentation/eks_terraform.md)


