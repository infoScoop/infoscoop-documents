# Installation Summary

This document provides an overview of how to setup infoScoop OpenSource.

## Installation Requirements

These are requirements that needs before the setup of infoScoop OpenSource.

### Apache Ant

Apache Ant is used for settings of deploying WAR file. Install later version than Ant 1.6.5.

### Database

infoScoop OpenSource supports following DBMS.

* MySQL
* DB2
* Oracle

See [System Requirements][System Requirements] for checking the supported version for the each DBMS.

## Setup for Repository Database

Create database for infoscoop repository in using DBMS.

  
**Note:**  
The database that can process multibyte characters is needed to be created if multibyte characters are used.

**Note:**  
Specify 32k for page size in DB2

### Schema Definition

Add tables to prepared database. Schema is prepared in the directory of each database.  
Execute file named `tools/initdb/schema/\<DataBase Name>/init.sql` and define table.
  
Example:  For MySQL, `tools/initdb/schema/mysql> mysql -uroot -proot < mysqlinit.sql`

### Import of initial data

Import tool `initdb/import.bat(sh)` is used for inserting initial data.

### Copy of JDBC driver

Copy the jar file including JDBC driver of using database to following directory.

```
tools/initdb/lib
```

### Settings of database

Settings of database is described in bin/datasource.xml. The following is the example of settings for MySQL.

```
...
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
        <value></value>
    </property>
</bean>
<bean id="sessionFactory" ... >
    ...
    <property name="hibernateProperties">
        <props>
            <prop key="hibernate.dialect">org.hibernate.dialect.MySQLDialect</prop>
            <prop key="hibernate.default_schema"></prop>
            ...
        <props>
    </property>
</bean>
```

<table>
	<tr>
		<td>Property name</td>
		<td>Description</td>
	</tr>
	<tr>
		<td>driverClassName</td>
		<td>
        	Class name of JDBC driver</br>
            Default：com.mysql.jdbc.Driver
    	</td>
	</tr>
	<tr>
		<td>url</td>
		<td>
        	Database URL</br>
            Default：jdbc:mysql://localhost:3306/iscoop?useUnicode=true&characterEncoding=UTF-8
   		</td>
	</tr>
	<tr>
		<td>username</td>
		<td>
        	User Name of Database Connection</br>
            Default：root
        </td>
	</tr>
	<tr>
		<td>password</td>
		<td>
        	 User Password of Database Connection</br>
             Default：
        </td>
	</tr>
	<tr>
		<td>hibernate.dialect</td>
		<td>
        	Specify following values as using database</br>
            MySQL: org.hibernate.dialect.MySQLDialect</br>
            Oracle: org.hibernate.dialect.Oracle10gDialect</br>
			DB2: org.hibernate.dialect.DB2Dialect
        </td>
	</tr>
	<tr>
		<td>hibernate.default_schema</td>
		<td>Schema name of repository database. Setting is not required for MySQL</td>
	</tr>
</table>

### Adding User

Specify adding user to repository database in advanced. Describe user in the following CSV file.

```
tools/initdb/data/accounts/import.csv
```

CSV is described in following format.
  
**Note:**  
Do not delete user `admin` as it is administrator by default.

### Executing import.bat(sh)

Execute `import.bat(sh)` in command line.

## Prepare Web application server

infoScoop OpenSource is worked on web application server that conform to J2EE. Prepare for web application server to deploy infoScoop OpenSource.

### Define prepared database as the datasource of  web application server.

jdbc/infoscoop is specified for default JNDI name that is also specified in WAR file of infoScoop OpenSource.

Follow the manual of using web application server and define datasource.

## Deploying Web Application Module

### Change Settings of WAR File

infoScoop OpenSource is distributed in WAR file format. The settings of WAR file can be changed by using tool  called `remakewar.bat`. `remakewar.bat` is in the following directory.

```
infoscoop/remakewar.bat
```

Specify the file below for executing property of `remakewar.bat`.

```
infoscoop/build.properties
```

The property required in minimum configuration is explained below.

In addition, refer to [Customizing Web Application Module] for detailed customization, such as an SSO setup.

<table>
	<tr>
		<td>Property name</td>
		<td>Description</td>
	</tr>
	<tr>
		<td>datasource.jndiName</td>
		<td>Specify JNDI name of datasource. This property does not need to be changed if the JNDI name of datasource is set as "jdbc/infoscoop" by default in Web application server.</td>
	</tr>
	<tr>
		<td>datasource.schema</td>
		<td>Schema name of repository database. Setting is not required for MySQL</td>
	</tr>
	<tr>
		<td>datasource.dialect</td>
		<td>
        	Specify following values as using database</br><br>
            MySQL: org.hibernate.dialect.MySQLDialect</br>
            Oracle: org.hibernate.dialect.Oracle10gDialect</br>
			DB2: org.hibernate.dialect.DB2Dialect
        </td>
	</tr>
</table>

Refer to Install Manual of infoScoop OpenSource for other properties.  
`dist` directory is created and WAR file for deployment is created in the `dist` directory if remakewar.bat(sh) is executed.

## Deploying WAR File

Setup is done after deploying this WAR file to web application server and start context.

Start Apache Tomcat, and then access the following URL and login as admin using a password, `admin`.

    http://<HostName>:8080/infoscoop/

infoScoop OpenSource's main portal screen is to be shown up.

infoScoop OpenSource now provides 10 test user accounts since version 2.2 so that you can check how it works with several users;

  * test_user1 ~ test_user3: Administrator account
  * test_user4 ~ test_user10: Nomal user account

Thier passwords are all `password`. Use it for testing things on infoScoop.


[Customizing Web Application Module]: customizing-web-application-module.md
[System Requirements]: ../system-requirements.md "System Requirements"