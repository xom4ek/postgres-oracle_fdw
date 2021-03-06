BEGIN;
	-- CREATE EXTENSION IF NOT EXISTS oracle_fdw;
    DROP SERVER IF EXISTS ${FDW_NAME} CASCADE;
	-- ALTER FOREIGN DATA WRAPPER oracle_fdw OPTIONS (nls_lang '.AL32UTF8');
    CREATE SERVER $FDW_NAME FOREIGN DATA WRAPPER oracle_fdw OPTIONS (dbserver '${FDW_FOREIGN_SERVER}');
    DROP USER MAPPING IF EXISTS FOR public SERVER ${FDW_NAME};
    CREATE USER MAPPING FOR public SERVER ${FDW_NAME} OPTIONS (user '${FDW_USER}', password '${FDW_PASS}');
    DROP SCHEMA IF EXISTS ${FDW_SCHEMA};										
    CREATE SCHEMA ${FDW_SCHEMA};
    IMPORT FOREIGN SCHEMA "${FDW_FOREIGN_SCHEMA}" FROM SERVER ${FDW_NAME} INTO ${FDW_SCHEMA};
    -- DROP ROLE IF EXISTS fdw_reader;
    -- CREATE ROLE fdw_reader;
    GRANT USAGE ON SCHEMA ${FDW_SCHEMA} TO fdw_reader;
    GRANT SELECT ON ALL TABLES IN SCHEMA ${FDW_SCHEMA} TO fdw_reader;
    GRANT fdw_reader to "${POSTGRES_USER}";
	COMMIT;