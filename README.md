# flask-api

## Setup

- Update Credentials
```sh
aws configure
-- enter KEY ID
-- enter SECRET KEY
```

- [Create ssh key pairs](https://www.ssh.com/ssh/keygen/)
```sh
ssh-keygen -t rsa -b 4096 -f ~/Git/flask-api/keys/kp
```
and replace the public key inside the tf file

- Create infra
```sh
cd terraform/
terraform plan # see what changes are going to be made
terraform apply 

```

- Ping ec2 instance with ansible
```sh
# ping to specific ip address
ansible ec2 -m ping -i ../ansible/inventory.txt 

# via playbook
ansible-playbook ansible/playbook.yaml -i ansible/inventory.txt 
```

- Cleanup infra
```sh
terraform destroy
```