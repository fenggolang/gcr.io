#FROM alpine:3.11.5
#RUN build_pkgs="wget git" \
#  && apk --update add ${build_pkgs} \
#  && cd /tmp \
#  && git clone https://github.com/goharbor/harbor.git \
#  && git clone https://github.com/openshift/origin.git \
#  && git clone https://github.com/openshift/origin-web-console.git \
#  && git clone https://github.com/openshift/origin-web-console-server.git \  
#  && git clone https://github.com/openshift/service-catalog.git \  
#  && git clone https://github.com/openshift/console.git \
#  && git clone https://github.com/openshift/kubernetes-metrics-server.git \   
#  && git clone https://github.com/openshift/image-registry.git \  
#  && git clone https://github.com/openshift/oauth-proxy.git \
#  && git clone https://github.com/openshift/prometheus-alertmanager.git \
#  && git clone https://github.com/openshift/prometheus.git \
#  && git clone https://github.com/openshift/node_exporter.git \  
#  && git clone https://github.com/openshift/kube-rbac-proxy.git \
#  && git clone https://github.com/openshift/etcd.git \
#  && git clone https://github.com/openshift/cluster-monitoring-operator.git \
#  && git clone https://github.com/openshift/prometheus-operator.git \
#  && git clone https://github.com/openshift/kube-state-metrics.git \
#  && git clone https://github.com/openshift/configmap-reload.git \
#  && git clone https://github.com/cockpit-project/cockpit.git \
#  && git clone https://github.com/openshift/grafana.git \
#  && git clone https://github.com/openshift/ansible-service-broker.git \  
#  && git clone https://github.com/openshift/origin-metrics.git \
#  && git clone https://github.com/openshift/origin-aggregated-logging.git \  
  
FROM alpine:3.11.5
RUN build_pkgs="wget git curl" \
&& apk --update add ${build_pkgs} \
 && cd /tmp \
 && curl -v -s -o openshift-client-linux-4.4.3.tar.gz https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/4.4.3/openshift-client-linux-4.4.3.tar.gz \
 && curl -v -s -o openshift-install-linux-4.4.3.tar.gz https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/4.4.3/openshift-install-linux-4.4.3.tar.gz \
 &&  curl -v -s -o rhcos-4.4.3-x86_64-metal.x86_64.raw.gz https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.4/4.4.3/rhcos-4.4.3-x86_64-metal.x86_64.raw.gz
