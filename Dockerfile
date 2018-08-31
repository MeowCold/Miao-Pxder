FROM node:10.9

ENV PXDER_VERSION 1.1.0
ENV PXDER_SOURCE /home/node/app
ENV GHOST_CONTENT /home/node/app

WORKDIR $GHOST_SOURCE

RUN buildDeps=' \
		gcc \
		make \
		python \
		unzip \
	' \
	&& set -x \
	&& apt-get update && apt-get install -y \
	&& npm cache clean \
	&& rm -rf /tmp/npm*

VOLUME $GHOST_CONTENT

RUN npm i -g pxder

COPY docker-entrypoint.sh /entrypoint.sh
COPY hosts /hosts

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 23685
CMD ["NODE_ENV=production", "node", "start"]
