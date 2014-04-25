# Installation Guide for Ubuntu

This document explains how to set up infoScoop OpenSource on `ubuntu Server 9.10` that is newly installed at earliest.  
There are following steps for setting up:

  1. Unzip infoscoop.zip downloaded from this site.
  2. Installation of MySQL
  3. Installation of JDK
  4. Installation of Apache Tomcat
  5. Installation of MySQL Connector
  6. Create a repository database of infoScoop OpenSource
  7. Define a JNDI datasource on Apache Tomcat
  8. Create a directory for application logs
  9. Deploy infoScoop OpenSource in Apache Tomcat
  10. Operation Check

**Note:**  
Although Ubuntu Server 9.1 could optionally include LAMP Stack and Apache Tomcat when it is installed, this document explains for the case of the Server with no optional softwares like them.

## 1 Unzip infoscoop.zip downloaded from this site.

Download an archive file, `infoscoop-opensource-x.x.x.zip` from this site and place it in home directory. (x is version number.)  
Unzip the archive file that was downloaded just now with the following commands.

    $ cd
    $ unzip infoscoop.zip

## 2 Installation of MySQL

Excecute the following command to install MySQL Server:

    $ sudo apt-get install mysql-server
  
Next, change default character set of MySQL Server.  
Edit `my.cnf`; in the file, add `default-character-set=utf8` to the each last row of [client] and [mysqld] section, and save.

```
$ sudo vi /etc/mysql/my.cnf
```

    [client]  
    port            = 3306  
    socket          = /var/run/mysqld/mysqld.sock  
    default-character-set=utf8
    
    [mysqld]  
    default-character-set=utf8

Execute the following command to restart MySQL.

    $ sudo /etc/init.d/mysql restart

## 3 Installation of JDK

Execute the following command to install JDK.

    $ sudo apt-get install sun-java6-jdk

## 4 Installation of Apache Tomcat

Execute the following command to install Apache Tomcat.

    $ sudo apt-get install tomcat6

Then Stop Apache Tomcat, because it starts automatically after installation.

    $ sudo /etc/init.d/tomcat6 stop

Change default request encoding to UTF-8.

    $ sudo vi /etc/tomcat6/server.xml

Add URI attribute to Connecter element.

    <connector protocol="HTTP/1.1" port="8080"  
                  connectionTimeout="20000"  
                  redirectPort="8443"  
                  URIEncoding="UTF-8"/>  

Tomcat that is installed by apt-get has enabeled security manager by default.
In order to disable it, edit `/etc/init.d/tomcat6`.

```
$ sudo vi /etc/init.d/tomcat6
```

    # Use the Java security manager? (yes/no)  
    TOMCAT6_SECURITY=no

## 5 Installation of MySQL Connector

Download MySQL connector from the site below. It is a JDBC driver for MySQL.

```
http://dev.mysql.com/downloads/connector/j/5.1.html
```

Unpack the downloaded file.

    $ tar -xvf ./mysql-connector-java-5.1.x.tar.gz

The unpacked directory has `mysql-connector-java-5.1.x-bin.jar`; copy it to `/usr/share/tomcat6/lib` (the following command is the case when the fie is unpacked in a home directory).

    $ sudo cp  ~/mysql-connector-java-5.1.x/mysql-connector-java-5.1.x-bin.jar /usr/share/tomcat6/lib

## 6 Create a repository database of infoScoop OpenSource

The following explanation is for the case when MySQL administrator name is `root`, its password is "", and the database name is `iscoop`.

### Unpack initdb.tar.gz

Unpack initdb.tar.gz in `tools` directory with the commands below.

    $ cd
    $ tar xvf ~/infoscoop-opensource-x.x.x/tools/initdb.tar.gz

### Create A Database

Call mysql console and create a database for infoScoop OpenSource repository.

    $mysql -uroot -p
    mysql>create database iscoop character set utf8;
    mysql>exit

### Define Tables

Add tables to the created database.  
SQL script to create a MySQL schema is at the place below.

    initdb/schema/mysql/mysqlinit.sql

The following commands define the schema for infoScoop OpenSource on the database.

    $ cd
    $ mysql -uroot -p  iscoop < initdb/schema/mysql/mysqlinit.sql

The options of -u and -p can specify -u[user name of MySQL administrator] -p[password of MySQL administrator] for each.

### Add A User

Specify a user in advance, which is to be added to the repository database; write the user in the following CSV file.

    $ cd ~/tools
    $ vi initdb/data/accounts/import.csv

The CSV format is like below.  
\<user id>,\<user name>,\<password>

**Note:**  
do not delete `admin` admin since it is set as a default administrator.

### Execute import.sh

Unpack and Copy the JDBC Driver to `initdb/lib'.

    $ cd
    $ cp ~/mysql-connector-java-5.1.x/mysql-connector-java-5.1.x-bin.jar ~/initdb/lib

Execute import.sh with command line. (for English settings)

    $ cd ~/initdb
    $ ./import.sh

##### [Supplement]

When the user ID/ password of the database manager is different from a default, it is necessary to revise the setting of the following files before execution of the command mentioned above.

    ~/initdb/bin/datasource.xml

Execute the following command for opening `datasource.xml` file.

    $ vi ~/initdb/bin/datasource.xml

`Proerty` element that `name` attribute is `username` is userid for connecting to the database, and `Proerty` element that `name` attribute is `password` is password for connecting to the database.  
In the following example, userid/password is `root`/`root`.

    
    <bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource">  
          <property name="driverClassName">  
               <value>com.mysql.jdbc.Driver</value>  
          </property>  
          <property name="url">  
               <value>jdbc:mysql://localhost:3306/iscoop?useUnicode=true&char  
    acterEncoding=UTF-8</value>  
          </property>  
          <property name="username">  
               <value>root</value>  
          </property>  
          <property name="password">  
               <value>root</value>  
           </property>  
    </bean>  
    

## 7 Define JNDI Data Source on Apache Tomcat

Define a JNDI data source for infoScoop OpenSource.

    $ sudo vi /etc/tomcat6/Catalina/localhost/infoscoop.xml

Write the following content and save it.
    
    <context path="infoscoop">  
       <resource name="jdbc/infoscoop" auth="Container"  
            type="javax.sql.DataSource"  
            username="root"  
            password=""  
            driverClassName="com.mysql.jdbc.Driver"  
            url="jdbc:mysql://localhost:3306/iscoop"  
            validationQuery="select 1" />  
    </context>

## 8 Create a directory for application logs

Application logs of infoScoop are output to /var/log/infoscoop/ by default.

  
Create a new directory for logs with the commands below.

    $ cd /var/log
    $ sudo mkdir infoscoop
    $ sudo chown tomcat6 infoscoop
    $ sudo chgrp tomcat6 infoscoop

## 9 Deploy infoScoop OpenSource in Apache Tomcat

Copy `infosoop.war` to `/usr/share/tomcat6/webapps`.

    $ sudo cp ~/infoscoop-opensource-x.x.x/infoscoop/infoscoop.war /usr/share/tomcat6/webapps

## 10 Operation Check

Start Apache Tomcat.

    $sudo /etc/init.d/tomcat6 start

Access the following URL and login as admin using a password, `admin`.

    http://<HostName>:8080/infoscoop/

If there appears a display like below, installation is successful.

![Install Suceed]


[Install Suceed]: images/installation-guide-for-centos.png
