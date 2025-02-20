# Stage 1 Build
# Base image 
FROM node:20-alpine AS DevHack

# Working Directory 
WORKDIR /DevOpsHackthon

# Copy package.json file to working directory
COPY package*.json  ./

# To install dependancy
RUN npm install

# copy code from source to destination
COPY . .

RUN npm run build


# Stage 2 start

FROM node:20-alpine

WORKDIR /DevOpsHackthon

RUN npm install -g serve

#add user and group 
RUN addgroup --gid 1001 Devhackthon
RUN  adduser --uid 1002 --disabled-password --gecos "" --ingroup Devhackthon hackthon1

# Set correct ownership for /DevopsHackthon
RUN chown -R hackthon1:Devhackthon /DevOpsHackthon

# Copy the built files from the build stage
COPY --from=DevHack /DevOpsHackthon/dist ./dist

# Run as a non root user for security 
USER hackthon1

EXPOSE 3000

CMD ["serve", "-s", "dist", "-l", "3000"]
