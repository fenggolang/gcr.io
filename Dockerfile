#FROM gcr.io/google_containers/zookeeper-install:0.1
#FROM gcr.io/google_containers/pause-amd64:3.0
#FROM gcr.io/google_containers/k8s-dns-kube-dns-amd64:1.14.7
#FROM gcr.io/google_containers/k8s-dns-dnsmasq-nanny-amd64:1.14.7
#FROM gcr.io/google_containers/k8s-dns-sidecar-amd64:1.14.7
#FROM docker.io/weaveworks/scope:1.9.1
#FROM quay.io/coreos/etcd-operator:v0.9.2
#FROM gcr.io/spark-operator/spark-operator:v2.4.0-v1beta1-latest
#FROM gcr.io/spark-operator/spark:v2.4.0
#FROM registry.access.redhat.com/openshift-istio-tech-preview/istio-operator:0.7.0
#FROM registry.access.redhat.com/openshift-istio-tech-preview/openshift-ansible:0.7.0
#FROM gcr.io/google_samples/k8szk:v1
#FROM gcr.io/google_samples/k8szk:v3
#FROM gcr.io/google_samples/k8skafka:v1
#FROM gcr.io/google-samples/cassandra:v14
#FROM gcr.io/kubernetes-e2e-test-images/pets/redis-installer:1.2
#FROM gcr.io/google-samples/xtrabackup:1.0
#FROM quay.io/coreos/etcd:v3.2.22
#FROM vmware/nginx-photon:v1.4.0
#RUN tdnf upgrade nginx -y
#FROM quay.io/coreos/clair-git:latest
#FROM quay.io/coreos/clair:latest
#FROM quay.io/coreos/clair:v2.0.2
#FROM quay.io/coreos/clair:v2.0.0
#FROM registry.centos.org/dotnet/dotnet-20-centos7:latest
#FROM centos/mysql-57-centos7:5.7

#FROM centos:7
#RUN yum install git -y
#RUN cd /opt && git clone https://github.com/hyperledger/cello.git
#RUN ls -l /opt
#FROM centos:7
#USER root
#RUN yum install wget -y
#RUN cd /opt && wget -c https://mirror.openshift.com/pub/openshift-v4/clients/crc/latest/crc-linux-amd64.tar.xz && wget -c #https://mirror.openshift.com/pub/openshift-v4/clients/crc/latest/crc-windows-amd64.zip
#RUN cd /opt && wget https://github.com/kubernetes/kompose/releases/download/v1.17.0/kompose-linux-amd64
#RUN ls -l /opt
#RUN touch /var/log/messages && echo "eeeeeee" >> /var/log/messages
#CMD ["tail","-f","/var/log/messages"]

#FROM alpine:3.3
#RUN build_pkgs="wget" \
#  && apk --update add ${build_pkgs} \
#  && cd /tmp \
#  && wget https://github.com/v2ray/v2ray-core/releases/download/v4.23.1/v2ray-windows-64.zip \
#  && ls -l /tmp#

#RUN touch /var/log/messages && echo "eeeeeee" >> /var/log/messages
#CMD ["tail","-f","/var/log/messages"]

#FROM gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/controller@sha256:88393476dad67fe23913039e1bc40a3b3448e266a8c85d3cecf577c36ffca3b7
#FROM gcr.io/tekton-releases/github.com/tektoncd/dashboard/cmd/dashboard@sha256:7adaaa75759b04a6003a0334e2843582a160b2d95a18943a49bed3b9c047b343
#FROM gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/creds-init@sha256:3cdf7b1abc4264470a2bffd692184aeb95600b31e2ea18b84dbb4b40cd776791

FROM alpine:3.11.5
RUN build_pkgs="wget git" \
  && apk --update add ${build_pkgs} \
  && cd /tmp \
  && git clone https://github.com/goharbor/harbor.git \
  && git clone https://github.com/openshift/origin.git \
  && git clone https://github.com/openshift/origin-web-console.git \
  && git clone https://github.com/openshift/origin-web-console-server.git \  
  && git clone https://github.com/openshift/service-catalog.git \  
  && git clone https://github.com/openshift/console.git \
  && git clone https://github.com/openshift/kubernetes-metrics-server.git \   
  && git clone https://github.com/openshift/image-registry.git \  
  && git clone https://github.com/openshift/prometheus-alertmanager.git \
  && git clone https://github.com/openshift/oauth-proxy.git \
  && git clone https://github.com/openshift/prometheus.git \
  && git clone https://github.com/openshift/node_exporter.git \  
  && git clone https://github.com/openshift/kube-rbac-proxy.git \
  && git clone https://github.com/openshift/etcd.git \
  && git clone https://github.com/openshift/cluster-monitoring-operator.git \
  && git clone https://github.com/coreos/prometheus-operator.git \
  && git clone https://github.com/kubernetes/kube-state-metrics.git \
  && git clone https://github.com/openshift/configmap-reload.git \
  && git clone https://github.com/cockpit-project/cockpit.git \
  && git clone https://github.com/openshift/grafana.git \
  && git clone https://github.com/openshift/ansible-service-broker.git \  
  && git clone https://github.com/openshift/origin-metrics.git \
  && git clone https://github.com/openshift/origin-aggregated-logging.git \  
  
