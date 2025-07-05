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
  * Name: dvdrental
  * Leave owner as `postgres`
  * Click Save

* Restore the .tar file :
  * Right-click your new database dvdrental > Restore
  * In the dialog:
     * Format: Custom or tar
     * Filename: Browse to and select dvdrental.tar
     * Leave other settings as-is
     * Click Restore
* Done!
  * After a few seconds, your schema and tables will appear.
* Go to dvdrental > Schemas > public > Tables to explore.

# **Connecting to PowerBI desktop**
* Install PowerBI desktop
* Open Power BI Desktop
* Connect to PostgreSQL
  * Click Home > Get Data > More...
  * Search for PostgreSQL database
  * Click Connect
* Enter Connection Details
  * Server:	localhost:5432
  * Database:	your_database_name
  * Data Connectivity Mode:	Import (or DirectQuery for live data)
* Enter Authentication
  * Choose Database authentication:
   * Username: e.g., postgres
   * Password: your password
   * Click Connect 

# **To write multiple queries**
When you go to: Home → Get Data → PostgreSQL → Paste a new SQL query...Power BI treats this as a new data source and loads only the result of that one query. So if you overwrite the connection each time with a new query:
 * The old data table is removed
 * Visuals based on that old table break or disappear
  
Solution: Load Multiple Queries as Separate Tables
 * Instead of replacing the old query each time:
   * Get Data → PostgreSQL
   * Paste your first SQL query (e.g., for customer rentals)
   * Load it
   * The result appears as a table in the Fields pane
   * You can build visualizations now
   * To Add Another Query:
     * Again: Home → Get Data → PostgreSQL
     * Paste another query (e.g., top movies)
     * Click Load
     * Power BI adds a new table to the Fields pane - the previous one stays intact.
     * Now you can: Build visuals from both tables independently and even combine them later using relationships if needed
 * Naming the Queries (Important!)
    * After loading a query, rename the table in the Fields pane:
      * Right-click → Rename
      * Example: CustomerRentals, TopMovies, MonthlyRevenue
      * This keeps your visuals organized and avoids confusion.
 * Optional: Combine Queries in Power Query Editor
    * You can also:
      * Go to Home > Transform Data
      * Click Advanced Editor
      * Add multiple queries and rename each as a table
