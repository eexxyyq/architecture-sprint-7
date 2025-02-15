#!/bin/bash
# Привязываем пользователя user0 к роли k8s-privileged
kubectl create clusterrolebinding user0-privileged-binding \
  --clusterrole=k8s-privileged \
  --serviceaccount=k8s-users:user0

# Привязываем пользователя user1 к роли k8s-viewer
kubectl create clusterrolebinding user1-viewer-binding \
  --clusterrole=k8s-viewer \
  --serviceaccount=k8s-users:user1

echo "Пользователь user0 связан с ролью k8s-privileged, а user1 с ролью k8s-viewer."

