# MongoDB 4.0.17 Docker Image

This is a **MongoDB 4.0.17** Docker Image with **authentication enabled**. 

In order to configure a Mongodb user you should configure the **MONGO_USERNAME**, **MONGO_PASSWORD** and **MONGO_DATABASE** environment variables. See:

```dockerfile
version: "3"
services:
  mongodb:
    image: arcanjoqueiroz/mongo:4.0.17
    hostname: mongodb
    container_name: mongodb
    ports:
      - "27017:27017"
    volumes:
      - $HOME/docker/mongodb/data:/data/db      
    environment:
	  MONGO_INITDB_ROOT_USERNAME: root
	  MONGO_INITDB_ROOT_PASSWORD: root
	  MONGO_INITDB_DATABASE: admin
	  MONGO_USERNAME: foo
	  MONGO_PASSWORD: foo
	  MONGO_DATABASE: foo
```

This image is directly based on [Official MongoDB Docker Image](https://hub.docker.com/_/mongo).


## Licensing

[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0.html)
