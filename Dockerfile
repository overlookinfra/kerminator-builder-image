FROM centos:latest
MAINTAINER stahnma@puppet.com
USER root
RUN useradd -ms /bin/bash distelli
WORKDIR /home/distelli
RUN sudo sh -c "ssh-keyscan -H github.com bitbucket.org >> /etc/ssh/ssh_known_hosts"
RUN curl -sSL https://www.distelli.com/download/client | sh
VOLUME /var/lib/docker
# Install gosu

RUN "/usr/bin/yum -y update; \
  /usr/bin/yum install -y epel-release autoconf automake rsync gcc make rpmdevtools sudo useradd libxml2-devel libxslt-devel; \
  /usr/bin/yum -y groupinstall 'Development tools' ;\
  /usr/bin/yum install -y nodejs nodejs-devel nodejs-packaging; rm -rf /var/cache/yum/*"

ENV GOSU_VERSION 1.9
RUN sudo curl -o /bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.9/gosu-$(dpkg --print-architecture)" \
     && sudo chmod +x /bin/gosu


CMD ["/bin/bash"]
