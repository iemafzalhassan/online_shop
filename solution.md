# Online Shop – Hackathon Phase 1 Submission

### Step 1: Build the base image for the online_shop Application taking image version above 16.

### Step 2: Set the working directory inside the container.

### Step 3: Copy the package.json and package-lock.json from the project to the container. 
### Step 4: Install the required dependencies through the below command.
`RUN npm install && yarn install`
### Step 5: COPY all source code to the application code.

### Step 6: EXPOSE the port where the project running.

### Step 7: Start the application in running mode.
`CMD ["npm", "run", "dev"]`

