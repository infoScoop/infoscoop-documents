# インストールガイド - CentOS編

本ドキュメントは、新規にCentOS 5をインストールしたサーバーに、最短でinfoScoop OpenSourceを構築する方法について説明します。  
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


## 1 ダウンロードしたinfoscoop.zipを解凍する

本サイトよりダウンロードしたinfoScoop OpenSourceのアーカイブinfoscoop-opensource-x.x.x.zipをホームディレクトリにダウンロードします。(xにはバージョン番号が入ります。)  
ダウンロードしたアーカイブを、以下のコマンドを実行し解凍します。

```
#cd
#unzip infoscoop.zip
```

infoscoopディレクトリとtoolsディレクトリを含むディレクトリinfoscoop-opensource-x.x.xが出力されます。


## 2 MySQLのインストール

以下のコマンドで、MySQLをインストールします。

```
# yum -y install mysql-server
```

次に、MySQLのデフォルトの文字セットを変更します。  
設定はmy.cnfを編集します。__default-character-set=utf8__を追記して保存します。

```
#vi /etc/my.cnf
```

```
[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
# Default to using old password format for compatibility with mysql 3.x
# clients (those using the mysqlclient10 compatibility package).
old_passwords=1
default-character-set=utf8
```

以下のコマンドを実行しMySQLの再起動します。

```
# /etc/init.d/mysqld restart
```

以下のコマンドを実行して、自動起動を有効にします。

```
#chkconfig mysqld on
```


## 3 JDKのインストール

SUN Java SE ダウンロードサイト`http://java.sun.com/javase/ja/6/download.html`より、Java SE Development Kit(JDK)のRPM`jdk-6uxx-linux-i586-rpm.bin`をダウンロードします。

**注意** `xx`はパッチバージョンに置き換えて読み進めてください。2010年12月27日現在では最新は23ですので、ダウンロードファイルの名前は`jdk-6u23-linux-i586-rpm.bin`です。

ダウンロードしたファイルをホームディレクトリに移動して、以下のコマンドを実行します。

```
#cd
#sh ~/jdk-6uxx-linux-i568-rpm.bin
```

ライセンスアグリーメントを最後の行まで読み「yes」を入力して下さい。

インストール後にできる不要なファイルを削除しておきます。

```
# rm -f ~/sun-javadb-*.rpm
# rm -f ~/jdk-6uxx-linux-i586-rpm.bin
```

次に、JAVA_HOMEをプロファイルに追加します。

```
# vi /etc/profile
```

以下を最終行に追加してください。

```
export JAVA_HOME=/usr/java/default
```

保存後、以下のコマンドを実行し変更を反映させます。

```
# source /etc/profile
```


## 4 Apache Tomcatのインストール

以下のURLのApache Tomcatのダウンロードページよりアーカイブをダウンロードします。

```
http://tomcat.apache.org/download-60.cgi
```

2010年12月27日現在の最新は6.29です。tar.gz形式のファイルをダウンロードしてください。  
また、以下のコマンドでダウンロードすることもできます。

```
# wget http://www.meisei-u.ac.jp/mirror/apache/dist/tomcat/tomcat-6/v6.0.29/bin/apache-tomcat-6.0.29.tar.gz
```

ダウンロードしたら、以下のコマンドで解凍します。

```
# tar xzf apache-tomcat-6.0.29.tar.gz
```

解凍したファイルを、/optに移動し、Apache Tomcatのホームディレクトリ名をtomcat6に変更します。

```
# mv apache-tomcat-6.0.29 /opt/tomcat6
```

次に、Tomcatの実行ユーザーを作成し、作成したディレクトリ/opt/tomcat6の所有者に設定します。

```
# useradd -d /opt/tomcat6 -s /sbin/nologin tomcat
# chown -R tomcat /opt/tomcat6
```

Tomcatのデーモンとして実行させるために、以下の一覧のコマンドを実行します。

```
#yum install autoconf gcc
#cd /opt/tomcat6/bin
#cp commons-daemon-native.tar.gz /tmp/
#cd /tmp/
#tar xvf commons-daemon-native.tar.gz
#cd commons-daemon-1.x.x-native-src/unix/
#autoconf
#sh configure
#make (---エラー---)
#make clean
#make
#chown tomcat jsvc
#mv jsvc ../../
#mv -f jsvc /opt/tomcat6/bin/
#rm -rf /tmp/commons-daemon-1.x.x-native-src/ /tmp/commons-daemon-native.tar.gz/
```

自動起動スクリプトを作成します。

```
#vi /etc/rc.d/init.d/tomcat6
```

以下の内容をコピーしてください。

```
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
```

作成した起動スクリプトに実行権限を付けます。

```
#chmod +x /etc/init.d/tomcat6
```

以下のコマンドを実行しスクリプトの自動起動を登録します。

```
#chkconfig --add tomcat6
#chkconfig tomcat6 on
```


## 5 MySQL Connectorの準備

MySQL用のJDBCドライバMySQL Connectorを以下のサイトからダウンロードします。

```
http://dev.mysql.com/downloads/connector/j/5.1.html
```

ダウンロードしたファイルを解凍します。

```
#tar -xvf ./mysql-connector-java-5.1.x.tar.gz
```

解凍したディレクトリ以下にあるmysql-connector-java-5.1.x-bin.jarを/opt/tomcat6/libにコピーします。(以下は、ホームディレクトリに解凍した場合の例です。)

```
#cp  ~/mysql-connector-java-5.1.x/mysql-connector-java-5.1.x-bin.jar /opt/tomcat6/lib
```


## 6 infoScoop OpenSource用のリポジトリデータベースを作成する

以下、MySQLの管理者ユーザーを「root」、パスワードなし、データベース名を「iscoop」と仮定し説明します。


### initdb.tar.gzを解凍する

以下のコマンドで、tools以下にあるinitdb.tar.gzを解凍します。

```
#cd
#tar xvf ~/infoscoop-opensource-x.x.x/tools/initdb.tar.gz
```


### データベースを作成する

mysqlのコンソールを呼び出し、infoScoop OpenSourceリポジトリ用のデータベースを作成します。

```
#mysql -u root -p
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
#cd
#mysql -uroot -p --default-character-set=utf8 iscoop < initdb/schema/mysql/mysqlinit.sql
```

-uと-pオプションは、-u\<MySQL管理者ユーザー名\>、-p\<MySQL管理者パスワード\>を指定します。


### ユーザーの追加

リポジトリデータベースに追加するユーザーを予め指定します。以下のコマンドを実行してCSVファイルを編集して下さい。

```
#cd
#vi initdb/data/accounts/import.csv
```

CSVは以下の形式です。

```
<ユーザーID>,<ユーザー名>,<パスワード>
```

**注意** adminは、デフォルト設定の管理者ですので消さないでください。


### import.shの実行

JDBCドライバをinitdb/libに解凍コピーします。

```
#cd
#cp  ~/mysql-connector-java-5.1.10/mysql-connector-java-5.1.10-bin.jar ~/initdb/lib
```

コマンドラインでimport.shを実行してください。

```
#cd ~/initdb
#./import.sh -lang ja
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

infoScoop OpenSource用のJNDIデータソースを定義します。(mkdirは既にディレクトリが存在する場合は不要です。)

```
#mkdir /opt/tomcat6/conf/Catalina
#mkdir /opt/tomcat6/conf/Catalina/localhost
#vi /opt/tomcat6/conf/Catalina/localhost/infoscoop.xml
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
