# Usage

`make`

## Local Database (Microsoft SQL Server 2019)

Docker builds for a basic local db

## Folder structure

To minimize the configurations in the project and to keep thigns very simple, there are a few norms the maintainer will have to follow (described in the sections below).
The folder structure is organized so that the schemas and data are separate. this is done because its easier to generate scripts from SSMS for any db/table creation.

### Schemas

These are all under data>db-data>schema

Each file under this will be a full database. The name given to the database will match the case-sensitive filename. A DB schema file should contain 1) Database Creation script 2) Any table creation scripts along with any constraints like primary key/foreign key/ uniqueness etc

For any client databases, the actual entry in Customer DB > customer table needs to be manually done in the data section. Simply creating the schema file will not give you access to the DB when using it in code.

### Data

These are all under data>db-data>table-data

This folder is further organized by DB name. This name should match with a file name in schema folder.
The table data is stored in `<tablename>.csv` files. These filenames should match the table creation script in the schema file.

### Adding new data

To add data to any existing tables, simply edit the csv files to add/edit rows. If editing in excel (recommended) save without reformatting. the end result should be a simple csv file and not excel formatted. in other words, when you do `cat <tablename>.csv` it should give you actual text and not garbage.

To add data to a new table, the easiest way is to take a table sample dump from a copy of database using SSMS or other tools and make a csv with headers. The csv file will be read by mssql's bcp tool and should not contain any fancy BOM's and should be utf8 formatted. It should not contain any `NULL` characters. these should be swapped for a blank field.
