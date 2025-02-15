#!/bin/bash
# Создаём неймспейс для пользователей, чтобы отделить их от системных ресурсов
kubectl create namespace k8s-users

# Создаем два пользователя в виде сервисных аккаунтов
kubectl create serviceaccount user0 -n k8s-users
kubectl create serviceaccount user1 -n k8s-users

echo "Пользователи 'user0' и 'user1' созданы в пространстве имен k8s-users."

