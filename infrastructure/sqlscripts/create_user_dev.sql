IF NOT EXISTS(SELECT principal_id FROM sys.database_principals WHERE name = 'pizza-selector-be-{env}}') BEGIN
    CREATE USER [pizza-selector-be-dev] FROM EXTERNAL PROVIDER;

    ALTER ROLE db_datareader ADD MEMBER [pizza-selector-be-dev]; 
    ALTER ROLE db_datawriter ADD MEMBER [pizza-selector-be-dev]; 
    ALTER ROLE db_ddladmin ADD MEMBER [pizza-selector-be-dev];
END

