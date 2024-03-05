# SQL

link to the page with the DB backup files:
https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms



when sql server is run in docker:

open Docker Desktop panel
go to Containers
on the container with sql server select options and -> go to details
on container details select Files tab
right clic on for example usr folder and in the menu select 'import' options
in the file explorer select folder with the bak file and inport the folder to the container
now you can see the folder with the bak file in the sql management studio and restore the db
