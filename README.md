# Boilerplate for new server with dokku


**Step 1.** Install basic env, swap 1G, update, ssh keys, dokku
```
wget https://raw.githubusercontent.com/SE7ENSKY/do-dokku-template/master/install-env.sh; bash install-env.sh
```
<sup>In progress you need to press: Enter, Enter, Enter, Y</sup>

**Step 2.** Add your ssh-key to dokku
```
echo 'YOUR_SSH_KEY' | sshcommand acl-add dokku YOUR_NAME
```

**Step 3.** Open to your server IP in browser and finish dokku VHOST setup.


___
___
___

## If your need SQL DB:

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

___

## If your need Mongo DB:

**Step 4.** Install mongo
```
docker pull mongo
```

**Step 5.** First start mongodb in docker container
```
docker run -d --name mongodb -e MONGO_INITDB_ROOT_USERNAME=your_user -e MONGO_INITDB_ROOT_PASSWORD=your_password -v /srv/mongodb:/data/db -p 27017:27017 mongo
```

___

## If your need Postgres DB:

**Step 4.** Install postgres
```
docker pull postgres
```

**Step 5.** First start postgres in docker container
```
docker run -d --name postgresdb -e POSTGRES_USER=your_user -e POSTGRES_PASSWORD=your_password -v /srv/postgresdb:/var/lib/postgresql/data -p 5432:5432 postgres
```
