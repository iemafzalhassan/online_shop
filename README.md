# "Online Shop – Hackathon Phase 1 "

## Implementations

    ### Step 1

    ** Project SetUp Local System **

        - First foke Hackathon repository into my git account
        - Project setup into my local system.
            git clone https://github.com/shrikantdhanvijay/online_shop.git
        - Create new branch from Hackathon branch 
            git checkout -b shrikant
        - Install project depedencies 
            npm install
        - Check project is working fine or not 
            npm run dev
        - Hit below url on browser 
            http://localhost:5173/ 


    ### Step 2

    ** AWS **
        - Create instance on Ec2
            - Name : online shop
            - Application and OS Images : ubuntu
            - Instance type : t2 micro
            - Key pair : use exiting key 
            - Network settings : Select existing security group
            - Configure storage : 10gb
            - launch instance

    ### Step 3
    
    ** Connect Ec2  **
        - Connect Ec2 instance using SSH Client
        - Create Folder 
            mkdir online-shop
        - Project clone
            git clone https://github.com/shrikantdhanvijay/online_shop.git
        - Create docker file
            vim Dockerfile
        - Build Docker Image
            docker build -t image-name:version .
        - Run Container
            docker run -d --name online-shop -p 80:80 build-image-name
        
