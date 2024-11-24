# ------------------
# Create the final KrakenD image
FROM devopsfaith/krakend:latest

# Set the working directory
WORKDIR /app

# Create the plugins directory
RUN mkdir -p /opt/krakend/plugins

# Download jwt validator bypass plugin from the GitHub release
RUN wget -O /opt/krakend/plugins/krakend-validator-bypass.so https://github.com/rv-nath/krakend-validation-bypass/releases/download/v0.1.1/krakend-validator-bypass.so

# Download rbac plugin from the GitHub release
RUN wget -O /opt/krakend/plugins/krakend-rbac.so https://github.com/rv-nath/krakend-rbac/releases/download/v0.1.1/krakend-rbac.so

# Download jwt validator plugin from the GitHub release
RUN wget -O /opt/krakend/plugins/krakend-jwt-validator.so https://github.com/rv-nath/krakend-jwt-validator/releases/download/v0.1.6/krakend-jwt-validator.so

# Copy the KrakenD configuration file to /etc/krakend/
COPY ./krakend.json /etc/krakend/krakend.json
RUN chmod 644 /etc/krakend/krakend.json

# Set the entrypoint to start KrakenD
ENTRYPOINT ["/usr/bin/krakend", "run", "-c", "/etc/krakend/krakend.json"]

