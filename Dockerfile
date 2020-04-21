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

#FROM alpine:3.11.5
#RUN build_pkgs="wget" \
#  && apk --update add ${build_pkgs} \
#  && cd /tmp \
#  && wget --no-check-certificate https://github.com/openshift/origin/archive/v3.11.0.tar.gz \
#  && wget --no-check-certificate https://github.com/goharbor/harbor/archive/v1.10.2.tar.gz \
#  && ls -l /tmp

#FROM alpine:3.11.5
#RUN build_pkgs="wget git" \
#  && apk --update add ${build_pkgs} \
#  && cd /tmp \
#  && git clone https://github.com/goharbor/harbor \
#  && git clone https://github.com/openshift/origin.git

#
# This is the image that controls the standard build environment for releasing OpenShift Origin.
# It is responsible for performing a cross platform build of OpenShift.
#
# The standard name for this image is openshift/origin-release
#
FROM        centos:7

ENV VERSION=1.10.8 \
    GOCACHE=/go/.cache \
    GOARM=5 \
    GOPATH=/go \
    GOROOT=/usr/local/go
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

COPY cbs-paas7-openshift-multiarch-el7-build.repo /etc/yum.repos.d/
RUN yum install -y epel-release && \
    rpm -V epel-release && \
    INSTALL_PKGS="bc bind-utils bsdtar ceph-common createrepo device-mapper device-mapper-persistent-data e2fsprogs ethtool file findutils gcc git glibc-static glib2-devel gpgme gpgme-devel hostname iptables jq krb5-devel libassuan libassuan-devel libseccomp-devel libvirt-devel lsof make mercurial nmap-ncat openssl protobuf-compiler rsync socat systemd-devel sysvinit-tools tar tito tree util-linux wget which xfsprogs zip goversioninfo" && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all && \
    touch /os-build-image && \
    git config --system user.name origin-release-container && \
    git config --system user.email origin-release@redhat.com

ADD *.rpm /tmp/origin-rpm/
RUN yum install -y /tmp/origin-rpm/*.rpm && \
    yum clean all && \
    ARCH="$(uname -m | sed 's/x86_64/amd64/g')" && \
    curl https://storage.googleapis.com/golang/go$VERSION.linux-$ARCH.tar.gz | tar -C /usr/local -xzf - && \
    go get golang.org/x/tools/cmd/cover \
        github.com/Masterminds/glide \
        golang.org/x/tools/cmd/goimports \
        github.com/tools/godep \
        golang.org/x/lint/golint \
        github.com/openshift/release/tools/gotest2junit \
        github.com/openshift/imagebuilder/cmd/imagebuilder && \
    mv $GOPATH/bin/* /usr/bin/ && \
    rm -rf $GOPATH/* $GOPATH/.cache && \
    mkdir $GOPATH/bin && \
    ln -s /usr/bin/imagebuilder $GOPATH/bin/imagebuilder && \
    ln -s /usr/bin/goimports $GOPATH/bin/goimports
    # TODO: symlink for backwards compatibility with hack/build-images.sh only, remove

RUN chmod g+xw -R $GOPATH && \
    chmod g+xw -R $(go env GOROOT)

WORKDIR /go/src/github.com/openshift/origin
LABEL io.k8s.display-name="OpenShift Origin Release Environment (golang-$VERSION)" \
      io.k8s.description="This is the standard release image for OpenShift Origin and contains the necessary build tools to build the platform."