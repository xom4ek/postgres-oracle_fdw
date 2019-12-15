Docker container with oracle_fdw plugin and correct setting NLS_LANG for Russian character set

CI-CD work with NGLM:

SLOMAP1
SPVPROD

## FDW Environment Variables ##

The following environment variables are used to configure the FDW:

| Name | Purpose | Example |
| ---- | ------- | ------- |
| FDW_NAME | The name of the foreign data wrapper | appname_wrapper |
| FDW_FOREIGN_SCHEMA | Oracle schema to get data from | oracle_schema |
| FDW_FOREIGN_SERVER | The Oracle server reference |  //servername.domain.name/schemaname |
| FDW_USER | Oracle username | oracle_username |
| FDW_PASS | Oracle password (store in a secret if sensitive) | ******** |
| FDW_SCHEMA | Postgres schema to send data to | oracle_mirror |



Example usage:
```shell
docker run -it --rm -e POSTGRES_PASSWORD=pguser -e POSTGRES_USER=pguser -e POSTGRES_DB=pgdb --network host \
-e FDW_NAME=test \
-e FDW_FOREIGN_SCHEMA=test \
-e FDW_FOREIGN_SERVER=//localhost:1531/testservicename \
-e FDW_USER=test \
-e FDW_PASS=test \
-e FDW_SCHEMA=test \
test:oraclefdw
```