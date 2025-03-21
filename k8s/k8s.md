# To deploy the application through Kubernetives 

## Deployment Steps

### 1. Create the Namespace
Deploy the namespace to isolate your application resources:
```bash
kubectl apply -f namespace.yml
```
### 2. Deployment the Application 
Apply the Deployment to manage your application's Pods:

``` bash 
kubectl apply -f deployment.yml
```
### 3.  Expose the Application (Server/Service)

service is expose your application 
```bash
kubectl apply -f service.yml
```

### 4. DO Expose this server on port
```bash
kubectl port-forward svc/online-shop-svc -n online-shop-ns 5173:5173
```


## Let's check the validate the deployment 

### Verify the namespace
``` bash
kubectl get namespaces
```

### Check Deployment status
```bash
kubectl get deployments -n online-shop-ns
```
### Check Services/Ingress
``` bash
kubectl get services,ingress -n online-shop-ns

```

### if you want to check all together 
```bash
kubectl get all -n online-shop-ns
```