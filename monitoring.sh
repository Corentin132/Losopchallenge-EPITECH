#!/bin/bash

# Appliquer les configurations dans l'ordre requis
kubectl apply -f k8s/monitoring/prometheus/prometheus-ns.yml
kubectl apply -f k8s/monitoring/node-exporter/node-exporter-daemonset.yml
kubectl apply -f k8s/monitoring/node-exporter/node-exporter-service.yml
kubectl apply -f k8s/monitoring/kube-state-metrics/kube-state-metrics-ServiceAccount.yml
kubectl apply -f k8s/monitoring/kube-state-metrics/kube-state-metrics-deployment.yml
kubectl apply -f k8s/monitoring/kube-state-metrics/kube-state-metrics-service.yml
kubectl apply -f k8s/monitoring/prometheus/prometheus-k8s-ServiceAccount.yml
kubectl apply -f k8s/monitoring/prometheus/prometheus-config-configmap.yml
kubectl apply -f k8s/monitoring/prometheus/prometheus-rules-configmap.yml
kubectl apply -f k8s/monitoring/prometheus/prometheus-secret.yml
kubectl apply -f k8s/monitoring/prometheus/prometheus-deployment.yml
kubectl apply -f k8s/monitoring/prometheus/prometheus-service.yml
kubectl apply -f k8s/monitoring/grafana/grafana-persistent-storage.yml
kubectl apply -f k8s/monitoring/grafana/grafana-provider-configmap.yml
kubectl apply -f k8s/monitoring/grafana/grafana-datasources-configmap.yml
kubectl apply -f k8s/monitoring/grafana/grafana-dashboard-configmap.yml
kubectl apply -f k8s/monitoring/grafana/grafana-deployment.yml
kubectl apply -f k8s/monitoring/grafana/grafana-service.yml
kubectl apply -f k8s/monitoring/grafana/grafana-ingress.yml
kubectl apply -f k8s/monitoring/alertmanager/alertmanager-pvc.yml
kubectl apply -f k8s/monitoring/alertmanager/alertmanager-secret.yml
kubectl apply -f k8s/monitoring/alertmanager/alertmanager-config-configmap.yml
kubectl apply -f k8s/monitoring/alertmanager/alertmanager-templates-configmap.yml
kubectl apply -f k8s/monitoring/alertmanager/alertmanager-deployment.yml
kubectl apply -f k8s/monitoring/alertmanager/alertmanager-service.yml


echo "Toutes les ressources ont été appliquées"
