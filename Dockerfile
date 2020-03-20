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
FROM centos:7
USER root
RUN yum install wget -y
RUN cd /opt && wget -c https://mirror.openshift.com/pub/openshift-v4/clients/crc/latest/crc-linux-amd64.tar.xz && wget -c https://mirror.openshift.com/pub/openshift-v4/clients/crc/latest/crc-windows-amd64.zip
RUN ls -l /opt
RUN touch /var/log/messages && echo "eeeeeee" >> /var/log/messages
CMD ["tail","-f","/var/log/messages"]



