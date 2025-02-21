# **Submission details and description** 📦🚢🌐
### Changing and setting up an port for local host testing
   Modified an vite.config.js file as followed: 🖋️
   ```Javascript
   export default defineConfig({
  base: "/",
  plugins: [react()],
  preview: {
   port: 3000,
   strictPort: true,
  },
  server: {
   port: 3000,
   strictPort: true,
   host: true,
   origin: "http://0.0.0.0:8080",
  },
 });
```
### Setting Up Repository 
- Fork the repo -> Click on code -> ssh -> add keys. Follow steps:`Settings -> SSH & GPG Keys -> add keys `
- To generate key: do ssh-keygen and copy the .pub and save the keys to remote access for git repository.
- Then copy: ssh command to clone the repo to local system: `ssh clone <ssh-repo-clone-url>`

 
### Testing app locally
- open terminal type in project folder location: `npm install`
- To run application: `npm run dev`

### Created an docker file for containerizing an react application 
- `./Dockerfile`

TO run dockerfile:
```bash
docker build -t myreactapp .
docker run -p 8080:3000 myreactapp
```

### Use Docker Scout for docker image and vunerability scan
```Bash
docker scout quickview myreactapp
docker scout cves --details myreactapp:latest
```

### created an dockercompose file for the learning demonstration and local testing
- `./docker-compose.yml`

- To run compose files:
`docker-compose -f .\docker-compose.yml up`

- Accessing an application on LocalSystem: `http://localhost:8080`

### created an flow for to push images to docker registry using action
`./.github/workflow/dockerpushflow.yml`

- Add secerts for flow:
Settings → Secrets and variables → Actions
Click New repository secret
`DOCKER_HUB_USERNAME`: Your Docker Hub username
`DOCKER_HUB_ACCESS_TOKEN`: A Docker Hub access token (generated from Docker Hub)

