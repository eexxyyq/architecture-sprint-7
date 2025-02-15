#!/bin/bash
# Создаем ClusterRole для привилегированных пользователей (k8s-privileged)
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: k8s-privileged
rules:
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["get", "list", "watch"]
EOF

# Создаем ClusterRole для пользователей с правами только на просмотр (k8s-viewer)
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: k8s-viewer
rules:
- apiGroups: ["*"]
  resources: ["*"]
  verbs: ["get", "list", "watch"]
EOF

# Создаем ClusterRole для настройки кластера (k8s-configurator)
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: k8s-configurator
rules:
- apiGroups: ["apps", "extensions"]
  resources: ["deployments", "statefulsets", "daemonsets"]
  verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
- apiGroups: [""]
  resources: ["configmaps", "services", "pods"]
  verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
EOF

echo "ClusterRoles k8s-privileged, k8s-viewer и k8s-configurator созданы."

