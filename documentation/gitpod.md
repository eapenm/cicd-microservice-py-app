# GITPOD 

[GitPod Details](https://www.gitpod.io/)

### What is GITPOD? 

Gitpod is an online development environment that allows you to spin up fully prebuilt, ready-to-code development environments in your web browser. It is designed to streamline the process of setting up and configuring development environments, making it easier for developers to start coding without dealing with local setup complexities.

**Key features of Gitpod include:**

**Cloud-Based IDE:** Gitpod provides a fully functional cloud-based integrated development environment (IDE) accessible through a web browser.

**Prebuilt Environments:** Environments are prebuilt and configured with necessary tools and dependencies. This helps developers avoid spending time on setting up and configuring their development environment locally.

**Workspace Snapshots:** Gitpod allows developers to snapshot their workspace, capturing the current state of their development environment. This can be useful for sharing the environment with others or returning to a specific state later.

**GitHub Integration:** Gitpod integrates with GitHub, allowing developers to start a new development environment directly from a GitHub repository.

**Collaboration:** Gitpod supports collaborative coding, enabling multiple developers to work on the same codebase simultaneously.

**Task Automation:** Developers can define and automate tasks using pre-configured VS Code extensions or custom scripts.

**Pay-As-You-Go:** Gitpod operates on a pay-as-you-go model, where users are billed based on the resources consumed by their development environments.


### How to setup environment variables in gitpod

```
gp env AWS_ACCESS_KEY_ID='<AWS_ACCESS_KEY_ID>'
gp env AWS_SECRET_ACCESS_KEY='<AWS_SECRET_ACCESS_KEY>'

```
As GITPOD dynamically sets up the necessary environment, there is no need for manual installation and configuration of development tools and software. To tailor the environment, we should create a ".gitpod.yml" file. I am providing the ".gitpod.yml" configuration for this project's development.

```yaml
tasks:
  - name: terraform
    before: |
      source ./bin/install_terraform_cli
      source ./bin/set_tf_alias
      cp $PROJECT_ROOT/terraform.tfvars.example $PROJECT_ROOT/terraform.tfvars
  - name: aws-cli
    env:
      AWS_CLI_AUTO_PROMPT: on-partial
    before: |
      source ./bin/install_aws_cli
      source ./bin/set_tf_alias
vscode:
  extensions:
    - amazonwebservices.aws-toolkit-vscode
    - hashicorp.terraform
    - donjayamanne.githistory
    - phil294.git-log--graph
    - mhutchie.git-graph
    - phil294.git-log--graph
```


I've crafted shell script to facilitate the installation of essential tools and software.

**install_aws_cli.sh**

```bash
#!/usr/bin/env bash


cd /workspace

rm -f '/workspace/awscliv2.zip'
rm -rf '/workspace/aws'

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

aws sts get-caller-identity
cd $PROJECT_ROOT
```
**install_terraform_cli.sh**

```bash
#!/usr/bin/env bash

cd /workspace

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform -y

cd $PROJECT_ROOT
```
**set_tf_alias**

```bash
#!/usr/bin/env bash

# Check if the alias already exists in the .bash_profile
grep -q 'alias tf="terraform"' ~/.bash_profile

# $? is a special variable in bash that holds the exit status of the last command executed
if [ $? -ne 0 ]; then
    # If the alias does not exist, append it
    echo 'alias tf="terraform"' >> ~/.bash_profile
    echo "Alias added successfully."
else
    # Inform the user if the alias already exists
    echo "Alias already exists in .bash_profile."
fi

# Optional: source the .bash_profile to make the alias available immediately
source ~/.bash_profile
```


