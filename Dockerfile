#FROM quay.io/openshift/origin-jenkins
FROM openshift/jenkins-2-centos7
USER root
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo &&  rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key && yum update -y && yum install -y   xorg-x11-server-Xvfb nodejs npm npx

USER 1001
COPY plugins.txt /opt/openshift/configuration/plugins.txt
RUN /usr/local/bin/install-plugins.sh /opt/openshift/configuration/plugins.txt
