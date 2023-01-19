#FROM tomcat:8.0.20-jre8
FROM tomcat
COPY target/java-web-app*.war /usr/local/tomcat/webapps/root.war
CMD ["/usr/local/tomcat/catalina.sh","-g","daemon off;"]
