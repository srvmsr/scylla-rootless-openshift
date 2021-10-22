ARG SCYLLA_VER=3.3.4-202006160528

FROM scylladb/scylla:${SCYLLA_VER}

ADD scylla_dev_mode_setup /opt/scylladb/scripts/scylla_dev_mode_setup
ADD supervisord.conf /etc/supervisord.conf
RUN chgrp -R 0 /opt/scylladb && chmod -R g=u /opt/scylladb && \
    chgrp -R 0 /opt/scylladb/scripts && chmod -R g=u /opt/scylladb/scripts \
    chgrp -R 0 /etc/scylla.d && chmod -R g=u /etc/scylla.d && \
    chgrp -R 0 /etc/ssh && chmod -R g=u /etc/ssh && \
    chgrp -R 0 /var/lib/scylla* && chmod -R g=u /var/lib/scylla* && \ 
    chgrp -R 0 /var/lib/scylla/hints/ && chmod -R g=u /var/lib/scylla/hints/ && \ 
    rm -rf /etc/supervisord.conf.d/sshd-server.conf
RUN chmod -R 777 /opt/scylladb/scripts/scylla_dev_mode_setup