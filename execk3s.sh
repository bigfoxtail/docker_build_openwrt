#!/bin/bash

blue(){
    echo -e "\033[36;1m${@}\033[0m"
}
green(){
    echo -e "\033[32;1m${@}\033[0m"
}
red(){
    echo -e "\033[31;1m${@}\033[0m"
}
yellow(){
    echo -e "\033[33;1m${@}\033[0m"
}


if [ $# -lt 2 ] ; then
    green "未输入完整参数";
else
    PODCOUNT=`k3s kubectl get pods --no-headers --namespace=$1 | wc -l`;
    if [ ${PODCOUNT} -gt 1 ] ; then
        green "发现多个pod";
        exit 1;
    elif [ ${PODCOUNT} -lt 1 ] ; then
        green "未发现pod";
        exit 1;
    else
        PODNAME=`k3s kubectl get pods --no-headers --namespace=$1 | awk '{print $1}'`;
        green "发现pod --- $PODNAME";
        k3s kubectl exec -n $1 -it $PODNAME -- $2
    fi
fi
