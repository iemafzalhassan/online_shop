# Linux Part

## Cloning the Project and Running via npm

1. Clone the project repository:
```sh
   git clone https://github.com/Ahassan1995/TWS_HACKATHON_ABDULLAH_HASSAN.git
```
2. Navigate into the project directory:

```sh
   cd TWS_HACKATHON_ABDULLAH_HASSAN
```

```sh
   npm install
   npm run dev

```

## Creating a user who can only edit files but can't run the project

1. Set a password for the new user:

```sh
   sudo passwd dev
```
```sh
   sudo chown -R ubuntu:editors /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN
   sudo find /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN -type d -exec chmod 770 {} ;
   sudo find /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN -type f -exec chmod 660 {} ;
```

   "Run this command after you run npm install"
   
```sh
   sudo chmod 750 /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN/node_modules/.bin/vite
   sudo chmod 750 /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN/package.json
   sudo chmod 750 /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN/package-lock.json
```

```sh
   sudo chmod -R 750 /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN
   sudo chown ubuntu:dev /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN/package.json
   sudo chmod 640 /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN/package.json
```
2. Navigate into the project directory:
```sh
   cd TWS_HACKATHON_ABDULLAH_HASSAN
```
3. Install dependencies:
```sh
   npm install
```
4. Run the project:
```sh
   npm run dev
```

## Creating a User and Restricting npm Execution

1. Create a new user:
```sh
   sudo adduser dev
   sudo groupadd editors
   sudo usermod -aG editors dev
```

2. Set a password for the new user:
```sh
   sudo passwd dev
```

3. Restrict execution of `npm` for the user:
```sh
   sudo chown -R ubuntu:editors /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN
   sudo find /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN -type d -exec chmod 770 {} ;
   sudo find /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN -type f -exec chmod 660 {} ;
```
4. Run this command after you run npm install
   
```sh
   sudo chmod 750 /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN/node_modules/.bin/vite
   sudo chmod 750 /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN/package.json
   sudo chmod 750 /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN/package-lock.json

```

5. Further restrict access to the project’s `dev` script:
```sh
   sudo chmod -R 750 /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN
   sudo chown ubuntu:dev /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN/package.json
   sudo chmod 640 /home/ubuntu/TWS_HACKATHON_ABDULLAH_HASSAN/package.json
```
6. Now, `dev` can access the system but cannot execute `npm` commands to run the project.

    ![Image](https://github.com/user-attachments/assets/067cf14a-87b4-4718-bef5-31c07c14b6be)


# Solution for Git and Docker

## Git: Creating a Separate Branch for Updating Footer

1. Clone the project repository if not already done:
```sh
   git clone https://github.com/Ahassan1995/TWS_HACKATHON_ABDULLAH_HASSAN.git
   cd TWS_HACKATHON_ABDULLAH_HASSAN
```
2. Create a new branch for modifying `Footer.jsx`:
```sh
   git switch -c author-name-change
```
3. Open `Footer.jsx` and `index.html` in an editor and change the address and author details respectively.
4. Commit the changes:
```sh
   git add src/components/Footer.jsx
   git commit -m "your message"
```
5. Push the branch to GitLab:
```sh
   git push origin author-name-change
```

## Git: Creating a Separate Branch for Multi-Stage Dockerfile

1. Create a new branch for Docker changes:
```sh
   git switch -c multi-stage-docker
```
2. Create or modify the `Dockerfile` to use multi-stage builds.

3. Using multip stage image to reduce the size of an image as you can see below:

    ![Image](https://github.com/user-attachments/assets/927caf6a-6631-47fe-9d52-ae462b399046)

4. Commit and push the changes:

```sh
   git add .
   git commit -m "Your Message"
   git push origin multi-stage-docker
```

## Converting to Docker-Compose File

1. Create a new branch:

```sh
   git switch -c docker-compose
```
2. Create a `docker-compose.yml` file and write a content in it
   
3. Commit and push the changes:

```sh
   git add docker-compose.yml
   git commit -m "Added Docker Compose file"
   git push origin docker-compose
```

Now, there are three separate branches for different tasks: `update-footer`, `multi-stage-docker`, and `docker-compose` and in the end Merge it in a Main branch.

## Creating Persisting Volume For my docker container

When running Docker containers, data stored inside the container is lost when the container stops or is removed. To ensure data persistence, Docker provides volumes, which allow data to persist across container restarts and removals.

1. Create a Docker Volume

A Docker volume is an independent storage location managed by Docker. To create a volume, use the following command:

```sh
    docker volume create my-data
```
This creates a named volume called my-data

2. Verify the Volume Creation

To ensure the volume was created successfully, run:

```sh
    docker volume ls
```
This will list all the existing volumes, including

3. Run a Container with the Volume

To use the volume with a container, mount it to a specific path inside the container:

``` sh
    docker run -d --name my-container -p 5000:5173 -v my-data:/app/data multi-stage-image npm run preview -- --port 5173 --host
```

4. Access the Container and Verify Data Persistence

To enter the container and create a test file:
```sh
    docker exec -it my-container sh
    cd /data
    echo "Persistent storage test" > testfile.txt
    exit
```
Now, remove the container:
``` sh
    docker rm -f <my-container>
```

Run a new container using the same volume and check if the file persists:
``` sh
    docker run -d --name my-container -p 5000:5173 -v my-data:/app/data multi-stage-image npm run preview -- --port 5173 --host
    ls /data
```
You should see testfile.txt, proving that the data remains intact across container restarts.

## Conclusion

Using Docker volumes ensures data persists even when containers are stopped or removed. This method is essential for applications that require data consistency, such as databases and web applications.
