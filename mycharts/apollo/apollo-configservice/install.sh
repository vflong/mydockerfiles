#!/bin/bash

helm install --name qa2-config -f values-qa2.yaml .
helm install --name qa-config -f values-qa.yaml .
helm install --name online-config -f values-online.yaml .
