FROM openkbs/jdk-mvn-py3

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

#### ------------------------
#### ---- user: Non-Root ----
#### ------------------------

ARG USER_ID=${USER_ID:-1000}
ENV USER_ID=${USER_ID}

ARG GROUP_ID=${GROUP_ID:-1000}
ENV GROUP_ID=${GROUP_ID}

ENV USER=${USER:-developer}
ENV USER_NAME=${USER}

ENV HOME=/home/${USER}

RUN groupadd -f --gid ${GROUP_ID} ${USER} && \
    #useradd ${USER} -m -d ${HOME} -s /bin/bash -u ${USER_ID} -g ${GROUP_ID} && \
    useradd ${USER} -m -d ${HOME} -s /bin/bash -u ${USER_ID} -g ${USER} && \
    ## -- Ubuntu -- \
    usermod -aG sudo ${USER} && \
    ## -- Centos -- \
    #usermod -aG wheel ${USER} && \
    echo "${USER} ALL=NOPASSWD:ALL" | tee -a /etc/sudoers && \
    export uid=${USER_ID} gid=${GROUP_ID} && \
    chown ${USER}:${USER} -R ${HOME}
    
RUN mkdir -p ${HOME}/workspace && \
    chown ${USER}:${USER} -R ${HOME}/workspace

WORKDIR ${HOME}

#### --- Copy Entrypoint script in the container ---- ####
COPY ./docker-entrypoint.sh /

#### ---- EMP3 Install ----
RUN git clone https://github.com/missioncommand/emp3-web.git

WORKDIR ${HOME}/emp3-web

#### --- Enterpoint for container ---- ####
USER ${USER}

RUN cd ${HOME}/emp3-web && \
    sudo npm install -g grunt-cli  && \
    sudo chown -R ${USER}:${USER} ${HOME} && \
    npm install && \
    /usr/bin/grunt --force && \
    sudo chown -R ${USER}:${USER} /usr/lib/node_modules

####################################
#### ---- Enterpoint setup ---- ####
####################################
USER ${USER}

WORKDIR ${HOME}/emp3-web

#ENTRYPOINT ["/docker-entrypoint.sh"]
#CMD ["/usr/bin/grunt", "serve"]
ENTRYPOINT ["/usr/bin/grunt"]
CMD ["serve"]

#### (Test only)
#CMD ["/usr/bin/firefox"]
#CMD ["/bin/bash"]

