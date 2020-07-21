FROM registry.access.redhat.com/ubi8/ubi-init
RUN yum install -y postfix cronie iputils net-tools mailx;yum clean all
RUN systemctl enable postfix
RUN systemctl disable systemd-update-utmp.service
EXPOSE 25
ENTRYPOINT ["/sbin/init"]
CMD ["/sbin/init"]
