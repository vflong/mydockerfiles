#!/bin/bash

helm install --name qa2-admin -f values-qa2.yaml .
helm install --name qa-admin -f values-qa.yaml .
helm install --name online-admin -f values-online.yaml .
