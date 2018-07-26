# Boilerplate for new server with dokku


**Step 1.** Install basic env, swap 1G, update, ssh keys, dokku
```
wget https://raw.githubusercontent.com/SE7ENSKY/do-dokku-template/master/install-env.sh; bash install-env.sh
```

**Step 2.** Add your ssh-key to dokku
```
echo 'YOUR_SSH_KEY' | sshcommand acl-add dokku YOUR_NAME
```

**Step 3.** Open to your server IP in browser and finish dokku VHOST setup.


___

## If your need DB:

**Step 4.** Install mariadb
```
docker pull paintedfox/mariadb
```

**Step 5.** First start mariadb in docker container
```
docker run -d --name mariadb -v /srv/mariadb:/data -p 3306:3306 paintedfox/mariadb
```

**Step 6.** View mariadb credentials
```
docker logs mariadb
```
