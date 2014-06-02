# 安装概要

这个文档解说关于安装infoScoop OpenSource的概要。


## 前提条件

在进行infoScoop OpenSource的安装之前，需要以下的准备。

### Apache Ant的准备

infoScoop OpenSource对WAR文件部署设定时候利用Ant。请安装Ant 1.6.5以上。


### 数据库的准备

infoScoop OpenSource支持下面的数据库管理系统。

* MySQL
* DB2
* Oracle

See [System Requirements][System Requirements] for checking the supported version for the each DBMS.

## 数据存储器数据库的安装

请在infoScoop OpenSource利用的DBMS中创建作业库的数据库。

**注** 利用多字节文字时候，需要制作数据库时候，做多字节文字能利用的设定。
**注** DB2请指定page size为32k。


### 表定义

在准备了的数据库中追加表。 表是成目录结构准备在对象数据库。

```
请执行tools/initdb/schema//init.sql 这个SQL文件定义表。
```

__例__ 对于MySQL

```
tools/initdb/schema/mysql> mysql -uroot -proot < mysqlinit.sql
```


### 初期数据的导入

初期数据请使用initdb/import.bat(sh)。


### JDBC驱动程序的拷贝

请在以下的目录里复制含利用的数据库的JDBC驱动程序的jar文件。
```
tools/initdb/lib
```


### 数据库的设定

数据库的设定记述在bin/datasource.xml，以下是缺省的MySQL的设定例。


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
    <thead>
        <tr>
            <th>属性名</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>driverClassName</td>
            <td>
                JDBC驱动程序的类名<br>
                缺省： com.mysql.jdbc.Driver
            </td>
        </tr>
        <tr>
            <td>url</td>
            <td>
                数据库URL<br>
                缺省： jdbc:mysql://localhost:3306/iscoop?useUnicode=true&characterEncoding=UTF-8
            </td>
        </tr>
        <tr>
            <td>username</td>
            <td>
                接续数据库用户名<br>
                缺省: root
            </td>
        </tr>
        <tr>
            <td>password</td>
            <td>
                数据库接续用户密码<br>
                缺省:
            </td>
        </tr>
        <tr>
            <td>hibernate.dialect</td>
            <td>
                根据利用数据库指定以下的值<br>
                MySQL: org.hibernate.dialect.MySQLDialect<br>
                Oracle: org.hibernate.dialect.Oracle10gDialect<br>
                DB2: org.hibernate.dialect.DB2Dialect
            </td>
        </tr>
        <tr>
            <td>hibernate.default_schema</td>
            <td>
                作业库数据库的表名，MySQL的时候没有必要设定。
            </td>
        </tr>
    </tbody>
</table>


### 用户的追加

预先指定对数据存储器的数据库追加用户。 用户信息在以下的CSV文件里记述。

```
tools/initdb/data/accounts/import.csv
```

CSV是以下形式。

```
<用户ID>,<用户名>,<密码>
```

**注** admin，因为是默认设定管理者，请别删除。


### import.bat(sh)的执行

在命令行请执行import.bat(sh)。



### 指定被投入的数据的语言

对import.bat(sh)加-lang 选项，能够指定被投入数据的语言。

```
import.bat -lang [LANGUAGE]
import.bat -lang ja
```

-lang 没有指定-lang 选项时候和指定不是有效的语言的情况，投入到作业库里面的数据语言是英语。


## Web应用服务器的准备

infoScoop OpenSource依据J2EE，Web应用服务器动作。 请准备为了部署infoScoop OpenSource的Web应用服务器。


### 为Web 应用服务器定义数据源

准备了的数据库作为Web应用服务器的数据源。预先infoScoop OpenSource的WAR文件指定默认的JNDI名为jdbc/infoscoop。
利用Web应用服务器手册定义数据源。


## Web应用程序模块的部署的设定变更


### 变更WAR文件的设定

infoScoop OpenSource以WAR文件格式被发布。WAR文件内中包含的各种设定，对WAR文件进行各种设定的工具通过remakewar.bat使其能变更。 remakewar.bat以下的目录有

```
infoscoop/remakewar.bat
```

remakewar.bat的执行属性指定为以下的文件。

```
infoscoop/build.properties
```

以下关于用最小构成必要的属性说明。

其他关于SSO设定等详细的自定义请参照[Web应用程序模块的自定义][Customizing Web Application Module]。

<table>
    <thead>
        <tr>
            <th>属性名</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>datasource.jndiName</td>
            <td>
                指定数据源的JNDI名。这个属性，如果对默认的「jdbc/infoscoop」设定了对Web应用服务器设定了的数据源的JNDI名，不需要变更。
            </td>
        </tr>
        <tr>
            <td>datasource.schema</td>
            <td>
                作业库数据库的表名，MySQL的情况没有必要设定。
            </td>
        </tr>
        <tr>
            <td>datasource.dialect</td>
            <td>
                按照利用的数据库指定以下值。<br>
                MySQL: org.hibernate.dialect.MySQLDialect<br>
                Oracle: org.hibernate.dialect.Oracle10gDialect<br>
                DB2: org.hibernate.dialect.DB2Dialect
            </td>
        </tr>
    </tbody>
</table>

执行remakewar.bat(sh)的话，dist目录被创建，并且部署用的WAR文件会被创建。


### 部署WAR文件

在Web应用服务器里部署这个WAR文件，启动后，安装完了。


[Customizing Web Application Module]: customizing-web-application-module.md "Web应用程序模块的自定义"
[System Requirements]: ../system-requirements.md "System Requirements"