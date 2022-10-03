# Usage

`make`

## Local Database (Microsoft SQL Server 2019)

Docker builds for a local db named TaskManagement and creates 3 tables that are going to be used. 

### Schemas

These are all under data>db-data>schema

Each file under this will be a full database. The name given to the database will match the case-sensitive filename. A DB schema file should contain 1) Database Creation script 2) Any table creation scripts along with any constraints like primary key/foreign key/ uniqueness etc

For any client databases, the actual entry in Customer DB > customer table needs to be manually done in the data section. Simply creating the schema file will not give you access to the DB when using it in code.

### Data

These are all under data>db-data>table-data

This folder is further organized by DB name. This name should match with a file name in schema folder.
The table data is stored in `<tablename>.csv` files. These filenames should match the table creation script in the schema file.
