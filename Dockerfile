FROM openkbs/jdk-mvn-py3

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

#### ------------------------
#### ---- user: Non-Root ----
#### ------------------------
USER ${USER}
WORKDIR ${HOME}

RUN mkdir -p ${HOME}/workspace && \
    chown ${USER}:${USER} -R ${HOME}/workspace

#### --- Copy Entrypoint script in the container ---- ####
COPY ./docker-entrypoint.sh /

#### ---- EMP3 Install ----
RUN git clone https://github.com/missioncommand/emp3-web.git

WORKDIR ${HOME}/emp3-web

#### --- Enterpoint for container ---- ####
USER ${USER}

# grunt is at /home/developer/.npm-global/bin/grunt
RUN cd ${HOME}/emp3-web && \
    export PATH=$PATH && \
    sudo chown -R ${USER}:${USER} ${HOME} ${HOME}/.npm && \
    npm install -g grunt-cli  && \
    npm install && \
    grunt --force && \
    sudo chown -R ${USER}:${USER} /usr/lib/node_modules ${HOME}/.npm

RUN sudo ln -s `which grunt` /usr/bin/grunt && \
    echo "grunt at: `which grunt`"

RUN sudo apt-get update && sudo apt-get install -y nginx curl dnsmasq

COPY ./nginx-conf/emp3-reverse-proxy.conf /etc/nginx/conf.d/

EXPOSE 3000
EXPOSE 3100
EXPOSE 8080

####################################
#### ---- Enterpoint setup ---- ####
####################################

RUN sudo chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["grunt", "serve"]

#ENTRYPOINT ["/usr/bin/grunt"]
#CMD ["serve"]

#### (Test only)
#CMD ["/usr/bin/firefox"]
#CMD ["/bin/bash"]

