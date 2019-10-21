FROM jenkins/jenkins:2.200

LABEL maintainer="hello@joshbranham.dev"

# Install plugins needed
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Skip initial admin setup as we are using this for testing
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

EXPOSE 8080