# kubectl
`curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl`

`chmod +x ./kubectl`

move kubectl file to a folder that is in your $PATH (for me it is /home/${USER}/bin)

# doctl install

`wget https://github.com/digitalocean/doctl/releases/download/v1.32.2/doctl-1.32.2-linux-amd64.tar.gz`

extract it via tar xvf <filename>

move the extracted file to a folder in your $PATH

# post install
run the following after the above 2 are installed

`doctl auth init`
get a token from the DO project panel enter it in

`doctl kubernetes cluster kubeconfig save <CLUSTER_NAME>`

# installing helm

- `cd /tmp`
- `curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > install-helm.sh`
- `chmod u+x install-helm.sh`
- `./install-helm.sh`

Installing tiller 

- `kubectl -n kube-system create serviceaccount tiller`
- `kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller`
- `helm init --service-account tiller`

verify tiller is running 
- `kubectl get pods --namespace kube-system`
- look for a pod starting with the name tiller-deploy


## [OPTIONAL] this is only if you want to dig deeper into helm
installing a helm chart

this is a very basic helm chart

- `helm install stable/kubernetes-dashboard --name dashboard-demo`

check if the dashboard serivce and helm app shows up 

- `helm list`
- `kc get services`
 
update a helm release
- `helm upgrade dashboard-demo stable/kubernetes-dashboard --set fullnameOverride="dashboard"`
- verify the renaem worked via
- `kc get services`


# Installing Nginx

first we create a simple hello world app to route traffic to

first cd into this md's root dir

using our hello-kubernetes-first.yaml, we make a deployment
 - `kubectl create -f hello-kubernetes-first.yaml`

now we install the ingress helm chart 
- `helm install stable/nginx-ingress --name nginx-ingress --set controller.publishService.enabled=true`

this will create a load balance, and under DO, the cluster will have all trafic autorouted to the loadbalance which will then send the request to the appropriate ingresses per pod

check if the controller came up correctly

- `kubectl get services -o wide -w nginx-ingress-controller`

from here, we test if the ingress works correctly

first we apply the ingress file, these point to 
`test1.antibioticsfairy.com` and 
`test2.antibioticsfairy.com`

apply the ingress via 
- `kubectl create -f hello-kubernetes-ingress.yaml`


now point `test1.` and `test2.` to the ip address of the laod balancer

# Setting up security

## Installing cert manager

- `kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.8/deploy/manifests/00-crds.yaml`

<!-- `kubectl label namespace kube-system certmanager.k8s.io/disable-validation="true"` -->

Next, you’ll need to add the Jetstack Helm repository to Helm, which hosts the Cert-Manager chart. To do this, run the following command:

- `helm repo add jetstack https://charts.jetstack.io`

Finally, install Cert-Manager into the cert-manager namespace:

- `helm install --name cert-manager --namespace cert-manager jetstack/cert-manager`


Using the `production_issuer.yaml`, (please change the email to your email ID)
we apply it now

`kubectl create -f production_issuer.yaml`

now that we have valild TLS certificates, we now go back to the `hello-kubernetes-ingress.yaml` file uncomment the TLS parts and run

- `kubectl apply -f hello-kubernetes-ingress.yaml`

now we wait for the certificates to get created, to watch their progress do

- `kubectl describe certificate letsencrypt-prod`

Go here for more details
`https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nginx-ingress-on-digitalocean-kubernetes-using-helm`

# Install argocd

`kubectl create namespace argocd`

`kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v0.9.2/manifests/install.yaml`

change the version number to whatever version you need

verify argo is running

`kubectl get pod -n argocd`

download argocd commandline tool

`curl -sSL -o /home/${USER}/bin/argocd https://github.com/argoproj/argo-cd/releases/download/v0.9.2/argocd-linux-amd64`

again, replace with a compatible version number

`chmod +x /home/${USER}/bin/argocd`

To find the Argo CD service, run the kubectl get command in the namespace argocd:

`kubectl get svc -n argocd argocd-server`

## setup login

- `kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'`
- point any endpoint to the loadbalancer's IP that was created due to the above command
- eg -> hello.example.com => 10.10.10.10 (where 10.10.10.10) is the IP of the newly created load balancer

goto to your url and then login

username: admin
reset password to Password1! (because the default does not work)
```
# bcrypt(Password1!)=$2a$10$hDj12Tw9xVmvybSahN1Y0.f9DZixxN8oybyA32Uy/eqWklFU4Mo8O
kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2a$10$hDj12Tw9xVmvybSahN1Y0.f9DZixxN8oybyA32Uy/eqWklFU4Mo8O",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'
```