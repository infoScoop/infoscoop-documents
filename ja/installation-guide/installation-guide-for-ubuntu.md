# インストールガイド - Ubuntu編

本ドキュメントは、新規にUbuntu Server 9.10をインストールしたサーバーに最短でinfoScoop OpenSourceを構築する方法について説明します。  
インストールは以下の手順があります。

1. ダウンロードしたinfoscoop.zipを解凍する
1. MySQLのインストール
1. JDKのインストール
1. Apache Tomcatのインストール
1. MySQL Connectorの準備
1. infoScoop OpenSource用のリポジトリデータベースを作成する
1. Apache TomcatにJNDIデータソースを定義する
1. アプリケーションログ用ディレクトリを作成する
1. Apache TomcatにinfoScoop OpenSourceをデプロイする
1. 起動確認

**注意** Ubuntu Server 9.1はインストール時にLAMPスタックとApach Tomcatをインストールすることが可能ですが、このドキュメントではインストール時に追加するソフトウェアのオプションを全く選択しなかった場合について説明しています。


## 1 ダウンロードしたinfoscoop.zipを解凍する

本サイトよりダウンロードしたinfoScoop OpenSourceのアーカイブinfoscoop-opensource-x.x.x.zipをホームディレクトリにダウンロードします。(xにはバージョン番号が入ります。)  
ダウンロードしたアーカイブを、以下のコマンドを実行し解凍します。

```
$cd
$unzip infoscoop.zip
```

infoscoopディレクトリとtoolsディレクトリが現れます。


## 2 MySQLのインストール

以下のコマンドで、MySQLをインストールします。

```
$ sudo apt-get install mysql-server
```

次に、MySQLのデフォルトの文字セットを変更します。  
設定はmy.cnfを編集します。__default-character-set=utf8__を[client]と[mysqld]の後に追記して保存します。

```
$sudo vi /etc/mysql/my.cnf
```

```
[client]
port            = 3306
socket          = /var/run/mysql/mysqld.sock
default-character-set=utf8

[mysqld]
default-character-set=utf8
```

以下のコマンドを実行しMySQLを再起動します。

```
$sudo /etc/init.d/mysql restart
```


## 3 JDKのインストール

以下のコマンドを実行しJDKをインストールします。

```
$ sudo apt-get install sun-java6-jdk
```


## 4 Apache Tomcatのインストール

以下のコマンドを実行しApache Tomcatをインストールします。

```
$ sudo apt-get install tomcat6
```

インストールが完了すると、Tomcatが自動的に起動されますので停止します。

```
$sudo /etc/init.d/tomcat6 stop
```

デフォルトのリクエストエンコーディングをUTF-8に変更します。

```
$sudo vi /etc/tomcat6/server.xml
```

Connecter要素に `URIEncoding="UTF-8"` 属性を追加します。

```
<Connector port="8080" protocol="HTTP/1.1"
        connectionTimeout="20000"
        redirectPort="8443"
        URIEncoding="UTF-8"/>
```

apt-getでインストールされたTomcatはセキュリティマネージャがデフォルトで有効になっています。  
無効にするために/etc/init.d/tomcat6を編集します。

```
$ sudo vi /etc/init.d/tomcat6
```

```
# Use the Java security manager? (yes/no)
TOMCAT6_SECURITY=no
```


## 5 MySQL Connectorの準備

MySQL用のJDBCドライバMySQL Connectorを以下のサイトからダウンロードします。

```
http://dev.mysql.com/downloads/connector/j/5.1.html
```

ダウンロードしたファイルを解凍します。

```
$tar -xvf ./mysql-connector-java-5.1.x.tar.gz
```

解凍したディレクトリ以下にあるmysql-connector-java-5.1.x-bin.jarを/usr/share/tomcat6/libにコピーします。(以下は、ホームディレクトリに解凍した場合の例です。)

```
$sudo cp  ~/mysql-connector-java-5.1.x/mysql-connector-java-5.1.x-bin.jar /usr/share/tomcat6/lib
```


## 6 infoScoop OpenSource用のリポジトリデータベースを作成する

以下、MySQLの管理者ユーザーを「root」、パスワードなし、データベース名を「iscoop」と仮定し説明します。


### initdb.tar.gzを解凍する

以下のコマンドで、tools以下にあるinitdb.tar.gzを解凍します。

```
$cd
$tar xvf ~/infoscoop-opensource-x.x.x/tools/initdb.tar.gz
```


### データベースを作成する

mysqlのコンソールを呼び出し、infoScoop OpenSourceリポジトリ用のデータベースを作成します。

```
$mysql -uroot -p
mysql>create database iscoop character set utf8;
mysql>exit
```


### テーブルを定義する

作成したデータベースにテーブルを追加します。  
MySQL用のスキーマ作成用SQLは以下の場所にあります。

```
initdb/schema/mysql/mysqlinit.sql
```

以下のコマンドを実行し、infoScoop OpenSource用のスキーマをデータベースに定義します。

```
$ cd
$ mysql -uroot -p  iscoop < initdb/schema/mysql/mysqlinit.sql
```

-uと-pオプションは、-u\<MySQL管理者ユーザー名\>、-p\<MySQL管理者パスワード\>を指定します。


### ユーザーの追加

リポジトリデータベースに追加するユーザーを予め指定します。以下のコマンドを実行してCSVファイルを編集して下さい。

```
$cd ~/tools
$vi initdb/data/accounts/import.csv
```

CSVは以下の形式です。

```
<ユーザーID>,<ユーザー名>,<パスワード>
```

**注意** adminは、デフォルト設定の管理者ですので消さないでください。

### import.shの実行

JDBCドライバをinitdb/libに解凍コピーします。

```
$cd
$cp  ~/mysql-connector-java-5.1.x/mysql-connector-java-5.1.x-bin.jar ~/initdb/lib
```

コマンドラインでimport.shを実行してください。

```
$cd ~/initdb
$./import.sh -lang ja
```

なお、データベース管理者のユーザーIDとパスワードがデフォルトと異なる場合は、上記のコマンドを実行する前に以下のファイルの設定を修正する必要があります。

```
~/initdb/bin/datasource.xml
```

以下のコマンドでdatasource.xmlを開きます。

```
#vi ~/initdb/bin/datasource.xml
```

name属性が"username"のproperty要素がデータベース接続ユーザーのユーザーID、"password"のproperty要素がパスワードになります。それぞれのvalue要素に適切な値に変更してください。  
以下は、ユーザーID/パスワードをroot/rootに設定している場合の例です。

```XML
<bean id="dataSource">
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
```


## 7 Apache TomcatにJNDIデータソースを定義する

infoScoop OpenSource用のJNDIデータソースを定義します。

```
$sudo vi /etc/tomcat6/Catalina/localhost/infoscoop.xml
```

以下の内容を記述して保存してください。

```XML
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
```


## 8 アプリケーションログ用ディレクトリを作成する

infoscoopはデフォルト設定では、/var/log/infoscoop/にアプリケーションログを出力します。  
以下のコマンドを実行してディレクトリを作成してください。

```
$ cd /var/log
$ sudo mkdir infoscoop
$ sudo chown tomcat6 infoscoop
$ sudo chgrp tomcat6 infoscoop
```


## 9 Apache TomcatにinfoScoop OpenSourceをデプロイする

infoscoop.warを/usr/share/tomcat6/webappsにコピーします。

```
$ sudo cp ~/infoscoop-opensource-x.x.x/infoscoop/infoscoop.war /usr/share/tomcat6/webapps
```


## 10 起動確認

Apache Tomcatを起動します。

```
$sudo /etc/init.d/tomcat6 start
```

以下のURLにアクセスし、admin/adminでログインします。

```
http://<ホスト名>:8080/infoscoop/
```

以下のような画面が表示されれば、インストールは成功です。

![Install Suceed]


[Install Suceed]: images/installation-guide-for-centos.png "インストール成功"
