FROM centos:7
ENV TZ=Europe/Moscow
RUN yum -y update
RUN yum install -y \
	vsftpd \
	db4-utils \
	db4 \
	iproute && yum clean all && \
    echo "#!/bin/bash" >> /home/run.sh && \
    echo "/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf" >> /home/run.sh && \
    echo "mkdir 123" >> /home/run.sh && \
    chown ftp:ftp /home/run.sh && \
    chmod 777 /home/run.sh
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
EXPOSE 20-21 50000-50010
#CMD ["/home/run.sh"]
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
#ENTRYPOINT ["/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf"]