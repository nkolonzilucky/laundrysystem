FROM mysql
WORKDIR /
#RUN echo "Testing Hello World"
RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
CMD ["mysqld"]