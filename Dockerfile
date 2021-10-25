ARG SCYLLA_VER=3.3.4-202006160528

FROM scylladb/scylla:${SCYLLA_VER}


RUN mkdir /opt/scylladb/scylla
WORKDIR  /opt/scylladb/scylla

ADD scylla.yaml /etc/scylla/scylla.yaml
ADD scylla_dev_mode_setup /opt/scylladb/scripts/scylla_dev_mode_setup
ADD supervisord.conf /etc/supervisord.conf
RUN chgrp -R 0 /opt/scylladb && chmod -R goa=rwx /opt/scylladb && \
    chgrp -R 0 /opt/scylladb/scylla && chmod -R goa=rwx /opt/scylladb/scylla && \
    chgrp -R 0 /opt/scylladb/scripts && chmod -R goa=rwx /opt/scylladb/scripts &&\
    chgrp -R 0 /etc/scylla.d && chmod -R goa=rwx /etc/scylla.d && \
    chgrp -R 0 /etc/ssh && chmod -R goa=rwx /etc/ssh && \
    rm -rf /etc/supervisord.conf.d/sshd-server.conf
RUN chmod  777 /opt/scylladb/scripts/scylla_dev_mode_setup 
RUN chmod 777 /etc/scylla/scylla.yaml 
RUN ln -s  /opt/scylladb/python3/bin/python3 /usr/bin/python3
RUN cp /* /opt/scylladb/scylla/ || true
ENV HOME='/opt/scylladb/scylla'
USER 10001