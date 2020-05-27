#FROM alpine:3.11.5
#RUN build_pkgs="wget git" \
#  && apk --update add ${build_pkgs} \
#  && cd /tmp \
#  && git clone https://github.com/goharbor/harbor.git \
#  && git clone https://github.com/docker-library/redis.git \
#  && git clone https://github.com/openshift/origin.git \
#  && git clone https://github.com/openshift/origin-web-console.git \
#  && git clone https://github.com/openshift/origin-web-console-server.git \  
#  && git clone https://github.com/openshift/service-catalog.git \  
#  && git clone https://github.com/openshift/console.git \
#  && git clone https://github.com/openshift/kubernetes-metrics-server.git \   
#  && git clone https://github.com/openshift/image-registry.git \  
#  && git clone https://github.com/openshift/prometheus-alertmanager.git \
#  && git clone https://github.com/prometheus/alertmanager.git \
#  && git clone https://github.com/openshift/oauth-proxy.git \
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
  && curl -o vmware.iso https://download2.vmware.com/software/vc/67u2/VMware-VCSA-all-6.7.0-13010631.iso?HashKey=9e6f1f9b193c96d9e6873fe5fcaf67f3&params=%7B%22custnumber%22%3A%22dHRoJSp0anRAdw%3D%3D%22%2C%22sourcefilesize%22%3A%223.96+GB%22%2C%22dlgcode%22%3A%22VC67U2%22%2C%22languagecode%22%3A%22en%22%2C%22source%22%3A%22DOWNLOADS%22%2C%22downloadtype%22%3A%22manual%22%2C%22eula%22%3A%22Y%22%2C%22downloaduuid%22%3A%22d8eb3b2a-976b-4d92-b818-e3cc9b5e2317%22%2C%22purchased%22%3A%22Y%22%2C%22dlgtype%22%3A%22Product+Binaries%22%2C%22productversion%22%3A%226.7.0U2%22%2C%22productfamily%22%3A%22VMware+vSphere%22%7D&AuthKey=1590543543_45e04051542d950f1b114a846bac8209
