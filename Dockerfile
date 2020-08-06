FROM postgres:12

RUN apt-get update && apt-get install -y --no-install-recommends \
  postgresql-$PG_MAJOR-pgaudit

USER postgres
  
CMD ["postgres", "-c", "shared_preload_libraries=pgaudit", "-c", "logging_collector=on", "-c", "log_statement=all"]
  
# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]