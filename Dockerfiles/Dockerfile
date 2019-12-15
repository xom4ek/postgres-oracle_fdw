FROM registry.gitlab.nglm.rt.ru/containers/postgres-oracle:12

# COPY init-scripts /docker-entrypoint-initdb.d
RUN date
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint
RUN chmod a+x /usr/bin/docker-entrypoint
EXPOSE 5432