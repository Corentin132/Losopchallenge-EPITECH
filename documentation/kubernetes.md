# Kubernetes

Système d'orchestration de conteneurs qui automatise le déploiement, la mise à l'échelle et la gestion des applications conteneurisées.

## Pourquoi Kubernetes ?

Redemarage automatique des containers qui crachent, Internal DNS, Auto-scaling policies, Healthchecks, Rolling updates (deploy 1 instance at a time), 1 click rollbacks, Keep secrets, Multi cloud cross region

## Diagnostiquer

#### Les commandes kubectl

**Informations**

`kubectl config current-context`  
`kubectl cluster-info`  
`kubectl version`  
`kubectl help`

**Obtenir des infos sur les différents composants**
`kubectl get all`  
`kubectl get nodes`  
`kubectl get namespace`

**Tester votre pod avec la commande suivante**  
`kubectl apply -f hello-world.pod.yaml`  
`kubectl get pod hello-world`  
`kubectl describe pod hello-world`

**Logs**  
`kubectl logs -f <nom-du-pod> <nom-du-conteneur>`  
`kubectl logs -f hello-world hello-world`  
`kubectl exec hello-world -- date`

**Suppression du pod**  
`kubectl delete pod hello-world `

**Executer env à l'intérieur du conteneur**  
`kubectl exec <nom-du-pod> -c <nom-du-conteneur> -- env`  
`kubectl exec hello-world  -c hello-world  -- env`

**Port forward**  
Créer un tunnel entre votre ordinateur et le cluster Kubernetes. Demandez à Kubernetes d'exposer le port 8080.  
`kubectl port-forward [pod-name] 8080:8080`  
`curl localhost:8080/`

**Envoyer un ping au service** depuis n'importe où dans le cluster Kubernetes  
`kubectl exec hello-world -- ping hello-world.default.svc.cluster.local`  
PING hello-world.default.svc.cluster.local (10.245.166.232): 56 data bytes

**Executer tous les manifest**  
`kubectl apply -f .`  
`kubectl get pods -o wide`

**Entrer dans un cluster**  
`kubectl exec --stdin --tty hello-world -- /bin/sh`

**Documentation intégrée**, connaître les champs d’une ressource  
`kubectl explain <ressource>`

Indiquer à kubectl le namespace par défaut pour ne pas avoir à spécifier l’option -n à chaque commande  
`kubectl describe endpoints -n default kubernetes`

`kubectl config set-context --current --namespace=<mon_namespace>`

kubectl logs <nom_du_pod> [-c <nom_du_conteneur>]
kubectl logs -f ...
kubectl logs -l label_key=label_value [--since=<time>] [--tail=<nb_lignes>]
L’application doit logguer sur stdout et stderr.

## Définitions

- Cluster -> ensemble de node
- Node -> une machine physique ou virtuelle qui exécute des conteneurs
- Namespace -> un environnement auquel on donne un nom
  Permet de diviser un cluster en plusieurs partitions virtuelles
  Permet de définir des portées pour les noms des ressources dans un cluster Kubernetes, telles que les services, les déploiements, les réplicas, les volumes, etc.

### Kubernetes Composant

**Pod** -> abstraction sur un container (plus petite unité dans Kubernetes) 1pod = 1 app
chaque pod a son IP

**Service** -> Permanent IP address pour le port / Le cycle de vie d'un pod et le service ne sont pas connecté. type of Service on creation External Service pour ton site et Internal Service (type par default) pour ta db. Le service a aussi un load balancer. Il interceptera la demande et la transmettre à la partie la moins occupée son but c'est de fournir des IP pour les pods
**Ingress** -> on veut une url avec un secure protocole et nom de domaine. La demande va d'abord à Ingress et elle fait le transfert vers le service

**ConfigMap** -> variable d'environement. Configmap contiendra des données de config comme url de db. connecté au pod (non confidential data only)

**Secret** -> utilisé pour les password base 64, les certificat, etc.. / référence Secret in Deployment/Pod

**Volume** -> data Storage persistant, attacher un stockage physique sur un disque dur à votre pod et ce disque peut être sur une machine loale, c'est à dire le même noeud de server où le pod est en cours d'execution, soit sur un stockage distant, en dehors du cluster.
Kubernetes ne gère aucune persistance des données

**Deloyment & StatefulSet**
**Deloyment** -> for stateLess Apps. Pour éviter l'interuption de service on réplique tout sur plusieurs servers (plusieurs noeuds) Define blueprint for Pods : Specifier combien de replicas on veut executer. Le deployment est un autre composant de kubernetes. On créer des deploiement, une abstraction des pods.
/!\ on ne peut pas repliquer la db à l'aide d'un deploiement car elle a un state
**StatefulSet** -> for stateFUL Apps or Databases. Le composant StatefulSet est destiné spécifiquement aux applications comme les db

**DaemonSet** ?
