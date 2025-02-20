############################ Stage 1 ################################


#### Using Node.js image higher then Vresion 16 ####

        FROM node:latest  AS builder

#### Working directory for Stage 1 ####

        WORKDIR /app

#### Copy package*.json files to the container ####

	COPY package*.json ./

#### Install npm for code build and install ####

        RUN npm install

#### Copy files to the container ####

	COPY . . 

############################# Stage 2 ###############################

#### Using node:10-alpine image to reduce to size ####

	FROM node:18-alpine AS runner

#### Working directory for Stage 2 ####

	WORKDIR /app/slim

### COPY files from state 1 to stage 2 ####
	
	COPY --from=builder /app /app/slim	

#### Expose the port 5173 ####

        EXPOSE 5173

#Start the application and run continue

       CMD ["npm","run","dev"]


############################# END ####################################
