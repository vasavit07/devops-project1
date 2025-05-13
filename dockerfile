# Use the official Tomcat image with OpenJDK 11 as the base image
FROM tomcat:9.0-jdk21-openjdk

# Install any necessary dependencies (e.g., wget, curl, etc.)
USER root
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install wget
# Define the directory where Tomcat will be installed (already set in base image)
# Create the directory for your custom Tomcat setup if needed
RUN mkdir -p /usr/local/tomcat
COPY tomcat-users.xml /usr/local/tomcat/conf/
#ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.68/bin/apache-tomcat-9.0.68.tar.gz /tmp/apache-tomcat-9.0.68.tar.gz
#RUN cd /tmp &&  tar xvfz apache-tomcat-9.0.68.tar.gz
#RUN cp -Rv /tmp/apache-tomcat-9.0.68/* /usr/local/tomcat/
# Add the WAR file to the appropriate directory for Tomcat webapps
# Assuming your WAR file is in the build directory (change the path if necessary)
ADD target/ABCtechnologies-1.0.war /usr/local/tomcat/webapps

# Expose Tomcat’s default port (8080)
EXPOSE 8080

# Set the command to run Tomcat when the container starts
CMD ["catalina.sh", "run"]

