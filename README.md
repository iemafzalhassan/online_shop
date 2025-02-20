# Online Shop – Hackathon Phase 1

## Implementations

    ### Step 1: Project Setup on Local System

        - First, fork the Hackathon repository into my Git account.

        - Set up the project on my local system:
        
            git clone https://github.com/shrikantdhanvijay/online_shop.git

        - Create a new branch from the Hackathon branch:
            git checkout -b shrikant

        - Install project dependencies:
            npm install

        - Check if the project is working fine:
            npm run dev

        - Open the following URL in a browser:
            http://localhost:5173/
        


    ### Step 2: AWS Setup

        - Create an EC2 instance:

            - Name: online-shop

            - Application and OS Image: Ubuntu

            - Instance Type: t2.micro

            - Key Pair: Use an existing key

            - Network Settings: Select an existing security group

            - Configure Storage: 10GB

            - Launch the instance


    ### Step 3: Connect to EC2
  
        - Connect to the EC2 instance using an SSH client

        - Create a folder:
            mkdir online-shop

        - Clone the project:
            git clone https://github.com/shrikantdhanvijay/online_shop.git

        - Create a Dockerfile:
            vim Dockerfile

        - Build the Docker image:
            docker build -t image-name:version .

        - Run the Docker container:
            docker run -d --name online-shop -p 80:80 image-name:version

        
