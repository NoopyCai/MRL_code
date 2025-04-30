#!/bin/bash

# 更新 upgrade.sql 中的網址與 sap 設定
sed -e "s|\${ELASTICSEARCH_PATH}|${ELASTICSEARCH_PATH}|g" \
      -e "s|\${WEB_SECURE_BASE_URL}|${WEB_SECURE_BASE_URL}|g" \
      -e "s|\${WEB_UNSECURE_BASE_URL}|${WEB_UNSECURE_BASE_URL}|g" \
      -e "s|\${WEB_SECURE_BASE_URL_BACKEND}|${WEB_SECURE_BASE_URL_BACKEND}|g" \
      -e "s|\${WEB_UNSECURE_BASE_URL_BACKEND}|${WEB_UNSECURE_BASE_URL_BACKEND}|g" \
      -e "s|\${ADMIN_URL_CUSTOM}|${ADMIN_URL_CUSTOM}|g" \
      -e "s|\${MRL_SAP_COMPANY_DB}|${MRL_SAP_COMPANY_DB}|g" \
      -e "s|\${SAP_SYSTEM_ID}|${SAP_SYSTEM_ID}|g" \
      /docker-entrypoint-upgrade.d/upgrade.sql > /docker-entrypoint-initdb.d/upgrade.sql

# 只在 sample 文件存在時才執行移動操作
if [ -f "/docker-entrypoint-initdb.d/init.sql.sample" ]; then
    mv /docker-entrypoint-initdb.d/init.sql.sample /docker-entrypoint-initdb.d/init.sql
fi 