# Installation Guide for CentOS

This document explains how to set up infoScoop OpenSource on `CentOS 5` that is newly installed at earliest.  
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

## 1 Unzip infoscoop.zip downloaded from this site.

Download an archive file, `infoscoop-opensource-x.x.x.zip` from this site and place it in home directory. (x is version number.)  
Unzip the archive file that was downloaded just now with the following commands.

    $ cd
    $ unzip infoscoop.zip

The commands output `infoscoop-opensource-x.x.x`, which includes directories of `infoscoop` and `tools`.

## 2 Installation of MySQL

Excecute the following command to install MySQL Server:

    $ yum -y install mysql-server
  
Next, change default character set of MySQL Server.  
Edit `my.cnf`; in the file, add `default-character-set=utf8` to the each last row of [mysqld] section, and save.

```
$ vi /etc/my.cnf
```

    [mysqld]
    datadir=/var/lib/mysql
    socket=/var/lib/mysql/mysql.sock
    # Default to using old password format for compatibility with mysql 3.x
    # clients (those using the mysqlclient10 compatibility package).
    old_passwords=1
    default-character-set=utf8

Execute the following command to restart MySQL.

    $ /etc/init.d/mysql restart

Execute the following command to enable autostart.

    $ chkconfig mysqld on

## 3 Installation of JDK

Go to SUN Java SE download site, `http://java.sun.com/javase/ja/6/download.html`.  
Then download the rpm file type, `jdk-6uxx-linux-i586-rpm.bin`.

**Note:**  
`xx` should be read as a batch version; for example, the newest download file is `jdk-6u23-linux-i586-rpm.bin` at current date, 27 December 2010.

Move the downloaded file to home directory and execute the commands below.

    $ cd
    $ sh ~/jdk-6uxx-linux-i568-rpm.bin

Read license agreement to the bottom and enter `yes`.  
Delete unnecessary files after the installation.

    $ rm -f ~/sun-javadb-*.rpm
    $ rm -f ~/jdk-6uxx-linux-i586-rpm.bin

Next, add JAVA_HOME to profile.

    $ vi /etc/profile

Add the following line at the bottom of the file.

    export JAVA_HOME=/usr/java/default

After saving it, execute the command as follows which reflects the change.

    $ source /etc/profile

## 4 Installation of Apache Tomcat

To download an archive file, access the Apache Tomcat download page whose URL is below.

    http://tomcat.apache.org/download-60.cgi

The newest version is 6.29 at current date, 27 December 2010. And download the tar.gz file type.  
The following command also leads successfull downloading.

    $ wget http://www.meisei-u.ac.jp/mirror/apache/dist/tomcat/tomcat-6/v6.0.29/bin/apache-tomcat-6.0.29.tar.gz

After downloading, unpack it with the commands below.

    $ tar xzf apache-tomcat-6.0.29.tar.gz

Move the unpacked file to `/opt` and rename the Apache Tomcat home directory to `tomcat6`.

    $ mv apache-tomcat-6.0.29 /opt/tomcat6

Then Create a user who is to exeute Tomcat; at the same time, set the user as a owner of the created /opt/tomcat6 directory.

    $ useradd -d /opt/tomcat6 -s /sbin/nologin tomcat
    $ chown -R tomcat /opt/tomcat6

In order to execute it as Tomcat daemon, execute the following commands.

    $ yum install autoconf gcc
    $ cd /opt/tomcat6/bin
    $ cp commons-daemon-native.tar.gz /tmp/
    $ cd /tmp/
    $ tar xvf commons-daemon-native.tar.gz
    $ cd commons-daemon-1.x.x-native-src/unix/
    $ autoconf
    $ sh configure
    $ make (---error---)
    $ make clean
    $ make
    $ chown tomcat jsvc
    $ mv jsvc ../../
    $ mv -f jsvc /opt/tomcat6/bin/
    $ rm -rf /tmp/commons-daemon-1.x.x-native-src/ /tmp/commons-daemon-native.tar.gz/

Create an autostart script.

    $ vi /etc/rc.d/init.d/tomcat6

Copy the following content.

    #!/bin/sh  
    #  
    # chkconfig: - 80 20  
    # description: tomcat6
    
    # Source function library.  
    . /etc/init.d/functions
    
    JAVA_HOME=/usr/java/default  
    CATALINA_HOME=/opt/tomcat6  
    TOMCAT_USER=tomcat  
    TMP_DIR=/tmp  
    CATALINA_OPTS=  
    CLASSPATH=\  
    $JAVA_HOME/lib/tools.jar:\  
    $CATALINA_HOME/bin/commons-daemon.jar:\  
    $CATALINA_HOME/bin/bootstrap.jar  
    PIDFILE=/var/run/tomcat.pid  
    LOCKFILE=/var/lock/subsys/tomcat  
    DAEMON=$CATALINA_HOME/bin/jsvc
    
    start(){  
        #  
        # Start Tomcat  
        #
    
        echo -n "Starting tomcat6: "  
        $DAEMON \  
        -pidfile $PIDFILE \  
        -user $TOMCAT_USER \  
        -home $JAVA_HOME \  
        -Dcatalina.home=$CATALINA_HOME \  
        -Djava.io.tmpdir=$TMP_DIR \  
        -outfile $CATALINA_HOME/logs/catalina.out \  
        -errfile '&1' \  
        $CATALINA_OPTS \  
        -cp $CLASSPATH \  
        org.apache.catalina.startup.Bootstrap
    
        #  
        # To get a verbose JVM  
        #-verbose \  
        # To get a debug of jsvc.  
        #-debug \  
        RETVAL=$?  
        if [ $RETVAL = 0 ]; then  
            echo_success  
            touch $LOCKFILE  
        else  
            echo_failure  
        fi  
        echo  
    }
    
    stop(){  
        #  
        # Stop Tomcat  
        #  
        echo -n "Shutting down tomcat6: "  
        $DAEMON \  
        -stop \  
        -pidfile $PIDFILE \  
        org.apache.catalina.startup.Bootstrap  
        RETVAL=$?  
        if [ $RETVAL = 0 ]; then  
            echo_success  
            rm -f $PIDFILE $LOCKFILE  
        else  
            echo_failure  
        fi  
        echo  
    }
    
    case "$1" in  
        start)  
            start  
            ;;  
        stop)  
            stop  
            ;;  
        restart)  
            stop  
            start  
            ;;  
        status)  
            status $DAEMON  
            RETVAL=$?  
            ;;  
        *)  
            echo $"Usage: jsvc {start|stop|restart|status}"  
            exit 1  
            ;;  
    esac

Change access permissions so that the user can access to the script.

    $ chmod +x /etc/init.d/tomcat6

Set autostart of the script executing the commands as follows.

    $ chkconfig --add tomcat6
    $ chkconfig tomcat6 on

## 5 Installation of MySQL Connector

Download a JDBC driver for MySQL, `MySQL Connector`, from the site below.

    http://dev.mysql.com/downloads/connector/j/5.1.html

Unpack the downloaded file.

    $ tar -xvf ./mysql-connector-java-5.1.x.tar.gz

The unpacked directory contains `mysql-connector-java-5.1.x-bin.jar`; copy it to `/usr/share/tomcat6/lib` (the following command is the case when the fie is unpacked in a home directory).

    $ cp ~/mysql-connector-java-5.1.x/mysql-connector-java-5.1.x-bin.jar /opt/tomcat6/lib

## 6 Create a repository database of infoScoop OpenSource

The following explanation is for the case when MySQL administrator name is
`root`, its password is "", and the database name is `iscoop`.

### Unpack initdb.tar.gz

Unpack initdb.tar.gz in `tools` directory with the commands below.

    $ cd
    $ tar xvf ~/infoscoop-opensource-x.x.x/tools/initdb.tar.gz

### Create A Database

Call mysql console and create a database for infoScoop OpenSource repository.

    $ mysql -u root -p
    mysql>create database iscoop character set utf8;
    mysql>exit

### Define Tables

Add tables to the created database.  
SQL script to create a MySQL schema is at the place below.

    initdb/schema/mysql/mysqlinit.sql

The following commands define the schema for infoScoop OpenSource on the database.

    $ cd
    $ mysql -uroot -p --default-character-set=utf8 iscoop \< initdb/schema/mysql/mysqlinit.sql

The options of -u and -p can specify -u[user name of MySQL administrator] -p[password of MySQL administrator] for each.

### Add A User

Specify a user in advance, which is to be added to the repository database; write the user in the following CSV file.

    $ cd
    $ vi initdb/data/accounts/import.csv

The CSV format is like below.

**Note:**  
do not delete `admin` user since it is set as a default administrator.

### Excute import.sh

Unpack and Copy the JDBC Driver to initdb/lib.

    $ cd
    $ cp ~/mysql-connector-java-5.1.x/mysql-connector-java-5.1.x-bin.jar ~/initdb/lib

Excute `import.sh` with command line. (for English settings.)

    $ cd ~/initdb
    $ ./import.sh

#### [Supplement]

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
              <value>jdbc:mysql://localhost:3306/iscoop?useUnicode=true&characterEncoding=UTF-8</value>  
         </property>
         <property name="username">  
              <value>root</value>  
         </property>  
         <property name="password">  
              <value>root</value>  
         </property>  
    </bean>

## 7 Define a JNDI datasource on Apache Tomcat

Define a JNDI data source for infoScoop OpenSource (mkdir is unnecessary if the directoty is already exists).

    $ mkdir /opt/tomcat6/conf/Catalina
    $ mkdir /opt/tomcat6/conf/Catalina/localhost
    $ vi /opt/tomcat6/conf/Catalina/localhost/infoscoop.xml

Write the following content and save it.
    
    <?xml version='1.0' encoding='utf-8'?>  
    <Context path="infoscoop">  
        <Resource name="jdbc/infoscoop" auth="Container"  
            type="javax.sql.DataSource"  
            username="root"  
            password=""  
            driverClassName="com.mysql.jdbc.Driver"  
            url="jdbc:mysql://localhost:3306/iscoop"  
            validationQuery="select 1" />  
    </Context>

## 8 Create a directory for application logs

Application logs of infoScoop are output to `/var/log/infoscoop/` by default.  
Create a new directory for logs with the commands below.

    $ cd /var/log
    $ mkdir infoscoop
    $ chown tomcat infoscoop
    $ chgrp tomcat infoscoop

## 9 Deploy infoScoop OpenSource in Apache Tomcat

Copy `infoscoop.war` to `/opt/tomcat6/webapps`.

    $ cp ~/infoscoop-opensource-x.x.x/infoscoop/infoscoop.war /opt/tomcat6/webapps

## 10 Operation Check

Start Apache Tomcat.

    $ /etc/init.d/tomcat6 start

Access the following URL and login as admin using a password, `admin`.

    http://<HostName>:8080/infoscoop/

If there appears a display like below, installation is successful.

![Install Suceed]


[Install Suceed]: images/installation-guide-for-centos.png
