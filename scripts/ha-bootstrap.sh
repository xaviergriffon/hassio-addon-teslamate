#!/usr/bin/env bashio

# Database things
export DATABASE_HOST=$(bashio::config 'database_host')
export DATABASE_NAME=$(bashio::config 'database_name')
export DATABASE_PASS=$(bashio::config 'database_pass')
export DATABASE_PORT=$(bashio::config 'database_port')
export DATABASE_USER=$(bashio::config 'database_user')

# MQTT things
export DISABLE_MQTT=$(bashio::config 'disable_mqtt')
export MQTT_HOST=$(bashio::config 'mqtt_host')
export MQTT_NAMESPACE=$(bashio::config 'mqtt_namespace')
export MQTT_PASSWORD=$(bashio::config 'mqtt_pass')
export MQTT_TLS_ACCEPT_INVALID_CERTS=$(bashio::config 'mqtt_tls_accept_invalid_certs')
export MQTT_TLS=$(bashio::config 'mqtt_tls')
export MQTT_USERNAME=$(bashio::config 'mqtt_user')


# Other things
export IMPORT_DIR=$(bashio::config 'import_dir')
export PORT=4000
export TZ=$(bashio::config 'timezone')
export ENCRYPTION_KEY=$(bashio::config 'encryption_key')
export DEFAULT_GEOFENCE=$(bashio::config 'default_geofence')

# Import dashboards
if [ $(bashio::config 'grafana_import_dashboards') == 'true' ]; then
    /dashboards.sh restore
fi

# Set max open file limit to avoid memory allocation issues
if [ "$(ulimit -Hn)" -gt 524288 ]; then
    ulimit -n 524288
fi

exec $(/usr/bin/env sh) /entrypoint.sh "$@"
