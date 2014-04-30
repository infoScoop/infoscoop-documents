# QuickStart Setup

This section explains how to setup QuickStart.  
Unzip `infoscoop-x.x.x-quickstart.zip(tar.gz)` and execute the following steps. (x is version number.)

**Note:**　Installation of MySQL 5.1and JDK 5.0 or higher is necessary in advance.

## 1 Create Repository Database

At first, access to the mysql console and create a database for infoScoop OpenSource repository.
  
    $ mysql -uroot -p  
    mysql>create database iscoop character set utf8;  
    mysql>exit

## 2 Import Initial Data to Repository Database

Next, execute the following commands which imports initial data to the created database.
    
    $ cd infoscoop-x.x.x-quickstart  
    $ mysql -uroot -p --default-character-set=utf8 iscoop < init_infoscoop.sql

Choose `init_info_infoscoop.ja.sql`  file, if you want Japanese sample settings.

## 3 Settings of Database

In default settings of quickstart, MySQL uses the same server with default port `3306`, user ID for connection, `root`, and no password.  
If other settings are needed to change, database settings should be changed.  
Database settings can be changed in infoscoop.xml which is in the directory below.
    
    apache-tomcat-6.0.28/conf/Catalina/localhost/infoscoop.xml

Change Resource element of GlobalNamingResources element.

  * username: user ID to connect to the database
  * password: password to connect to the database
  * url: url to connect to the database. If a MySQL server on another server is used, `localhost` must be changed to a proper host name. Besides, If the default port is not used, `3306` must be changed to proper value as well.

## 4 Start up infoScoop OpenSource Server

Execute the following command.
    
    $ startup.bat(sh)

That is how to setup infoScoop OpenSource QuickStart.  
To stop it, execute the following command.
    
    $ shutdown.bat(sh)

## 5 Startup infoScoop OpenSource

Start a browser, and access to the following url.
    
    http://<hostname>:8080/infoscoop/

The login page is to be displayed. Login as admin using a password, `admin`.  
infoScoop OpenSource's main portal screen is to be shown up.

### Loging as a Test User

infoScoop OpenSource now provides 10 test user accounts since version 2.2 so that you can check how it works with several users;

  * test_user1 ~ test_user3: Administrator account
  * test_user4 ~ test_user10: Nomal user account

Thier passwords are all `password`. Use it for testing things on infoScoop.  
  
Next section explains how to add users.

### 1 Edit import.csv

Edit the following file.
    
    infoscoop-x.x.x-quickstart/initdb/data/accounts/import.csv

Add new users with the following format.

    <USER_ID>,<USER_NAME>,<PASSWORD>

### 2 Execute addaccount.bat(sh)

Move to `initdb` directory, and execute `addaccount.bat(sh)` file.
    
    $ cd infoscoop-x.x.x-quickstart/initdb  
    $ addaccount.bat(sh)

Change Resource element of `GlobalNamingResources` element.


