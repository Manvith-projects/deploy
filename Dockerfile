# Use an official Tomcat image
FROM tomcat:8.5

# Remove default web apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to the Tomcat webapps directory
COPY KHIT.war /usr/local/tomcat/webapps/ROOT.war

# Use the port provided by Render
ENV PORT 10000  # Render usually assigns a dynamic port, but this acts as a fallback

# Expose the port Render will use
EXPOSE 10000

# Update Tomcat to listen on the Render-assigned port
CMD ["catalina.sh", "run"]
