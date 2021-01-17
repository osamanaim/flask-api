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

- Cleanup infra
```sh
terraform destroy
```