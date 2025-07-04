# **Data**
Downloaded the PostgreSQL DVD Rental sample database and extracted `dvdrental.tar`

# **PostgreSQL 16.9**
Installed PostgreSQL 16.9 and set the username, password and port.

# **Stackbuilder**
On installing postgresql, stackbuilder is asking to select applications you would like to install.
StackBuilder is a utility bundled with PostgreSQL to help you install optional tools like:
  * pgAdmin (GUI)
  * ODBC/JDBC drivers
  * PostGIS (for geospatial support)
  * Sample databases
  * Backup/restore utilities
  * Foreign data wrappers
I selected psqlODBC (ODBC Driver) - Needed if you want to connect PostgreSQL to Power BI or Excel.
But I could not find pgAdmin among the list. pgAdmin is the GUI to manage databases, run SQL, etc.
So I installed pgAdmin Manually

# **pgAdmin 4 - version 9.4**
After installing, I launched pgAdmin and connected to PostgreSQL Server by providing the password I set earlier.
Once connected, you can:
  * Browse databases
  * Create tables
  * Run SQL queries
  * Import .csv files

# **Setting up the DVD Rental sample database in PostgreSQL**
* Open pgAdmin
* In pgAdmin, expand `Servers > PostgreSQL > Databases`
* Right-click `Databases > Create > Database`
  Name: dvdrental
  Leave owner as `postgres`
  Click Save

* Restore the .tar file :
  Right-click your new database dvdrental > Restore
  In the dialog:
    Format: Custom or tar
    Filename: Browse to and select dvdrental.tar
    Leave other settings as-is
    Click Restore
* Done!
  After a few seconds, your schema and tables will appear.
* Go to dvdrental > Schemas > public > Tables to explore.
