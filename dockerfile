FROM vijha1989/tliferay:7
ENV JAVA_HOME=/opt/jdk
ENV JRE_HOME=/opt/jdk/jre
ADD ./deploy /opt/tomcat-8.0.32/deploy/
ADD portal-ext.properties /opt
RUN chmod -R 777 /opt
RUN echo export JAVA_HOME=/opt/jdk > /usr/bin/liferay
RUN echo export PATH=$PATH:$JAVA_HOME/bin >> /usr/bin/liferay
RUN echo /opt/tomcat-8.0.32/bin/catalina.sh run >> /usr/bin/liferay
RUN chmod -R 777 /usr
RUN apt-get update && apt-get --assume-yes install git && apt-get --assume-yes install wget && apt-get --assume-yes install curl && yum clean all -y
EXPOSE 8080 8009
CMD /usr/bin/liferay
