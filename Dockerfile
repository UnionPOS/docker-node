FROM unionpos/ubuntu:16.04

# runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
	build-essential \
	wget \
	&& wget -O nodesource_setup.sh https://deb.nodesource.com/setup_16.x \
	&& bash nodesource_setup.sh && rm -f nodesource_setup.sh \
	&& apt-get install -y nodejs \
	&& apt-get purge --auto-remove -y wget \
	&& rm -rf /var/lib/apt/lists/*

ENV NPM_CONFIG_LOGLEVEL warn

# create mount point for volumes holding custom startup
RUN mkdir /docker-entrypoint.d

# create mount point for volumes holding application source
RUN mkdir -p /opt/portal

COPY scripts/docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
