# インストール概要

このドキュメントは、infoScoop OpenSourceをセットアップする手順についての概要を解説しています。


## 前提条件

infoScoop OpenSourceのセットアップを行う前に、以下の準備が必要です。

### Apache Antの準備

infoScoop OpenSourceは、WARファイルにデプロイ用の設定する際にAntを利用します。Ant 1.6.5以上をインストールしてください。


### データベースの準備

infoScoop OpenSourceは、以下のDBMSをサポートします。

* MySQL
* DB2
* Oracle

サポートする各DBMSのバージョンについては、[システム要件][System Requirements]をご確認ください。


## リポジトリデータベースのセットアップ

利用するDBMSにinfoScoop OpenSourceのリポジトリを作成するためのデータベースを作成して下さい。

**注意** マルチバイト文字を利用する場合は、マルチバイト文字が利用できる設定でデータベースを作成する必要があります。  
**注意** DB2はページサイズを32kに指定してください。


### スキーマ定義

用意したデータベースにテーブルを追加します。スキーマは対象となるデータベースごとのディレクトリに用意されています。

```
tools/initdb/schema/<DB名>/init.sql <DB名>init.sqlという名前のSQLファイルを実行し、テーブルを定義してください。 
```

__例__: MySQLの場合

```
tools/initdb/schema/mysql> mysql -uroot -proot < mysqlinit.sql
```


### 初期データのインポート

初期データはインポートツールinitdb/import.bat(sh)を使用します。


### JDBCドライバのコピー

利用するデータベースのJDBCドライバを含むjarファイルを以下のディレクトリにコピーしてください。
```
tools/initdb/lib
```


### データベースの設定

データベースの設定は、bin/datasource.xmlに記述します。以下は、デフォルトのMySQLの設定例です。


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
            <th>プロパティ名</th><th>説明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>driverClassName</td>
            <td>
                JDBCドライバのクラス名<br>
                デフォルト: com.mysql.jdbc.Driver
            </td>
        </tr>
        <tr>
            <td>url</td>
            <td>
                デフォルト: jdbc:mysql://localhost:3306/iscoop?useUnicode=true&characterEncoding=UTF-8
            </td>
        </tr>
        <tr>
            <td>username</td>
            <td>
                データベース接続ユーザー名<br>
                デフォルト: root
            </td>
        </tr>
        <tr>
            <td>password</td>
            <td>
                データベース接続ユーザーパスワード<br>
                デフォルト:
            </td>
        </tr>
        <tr>
            <td>hibernate.dialect</td>
            <td>
                利用するデータベースに応じて以下の値を指定します。<br>
                MySQL: org.hibernate.dialect.MySQLDialect<br>
                Oracle: org.hibernate.dialect.Oracle10gDialect<br>
                DB2: org.hibernate.dialect.DB2Dialect
            </td>
        </tr>
        <tr>
            <td>hibernate.default_schema</td>
            <td>
                リポジトリデータベースのスキーマ名。MySQLの場合は設定は必要ありません。
            </td>
        </tr>
    </tbody>
</table>


### ユーザーの追加

リポジトリデータベースに、追加するユーザーを予め指定します。ユーザーは以下のCSVファイルに記述します。

```
tools/initdb/data/accounts/import.csv
```

CSVは以下の形式です。

```
<ユーザーID>,<ユーザー名>,<パスワード>
```

**注意** adminは、デフォルト設定の管理者ですので、消さないでください。


### import.bat(sh)の実行

コマンドラインでimport.bat(sh)を実行してください。



### 投入されるデータの言語を指定する

import.bat(sh)に-langオプションを付けることでリポジトリに投入されるデータの言語を指定することが出来ます。

```
import.bat -lang [LANGUAGE]
import.bat -lang ja
```

-langオプションを指定しなかった場合や有効ではない言語が指定された場合、リポジトリに投入されるデータの言語は英語になります。


## Webアプリケーションサーバーの準備

infoScoop OpenSourceはJ2EEに準拠する、Webアプリケーションサーバー上で動作します。infoScoop OpenSourceをデプロイするためのWebアプリケーションサーバーを用意してください。


### Webアプリケーションサーバーにデータソースを定義する

用意したデータベースを、Webアプリケーションサーバーのデータソースとして定義します。予めinfoScoop OpenSourceのWARファイルに指定されている、デフォルトのJNDI名はjdbc/infoscoopが指定してあります。

利用するWebアプリケーションサーバーのマニュアルにしたがってデータソースを定義してください。


##Webアプリケーションモジュールのデプロイ


### WARファイルの設定を変更する

infoScoop OpenSourceは、WARファイル形式で配布されます。WARファイル内に含まれる各種設定は、WARファイルに各種設定を行うツールremakewar.batで変更することができます。remakewar.batは以下のディレクトリにあります。

```
infoscoop/remakewar.bat
```

remakewar.batの実行プロパティは以下のファイルに指定します。

```
infoscoop/build.properties
```

以下、最小構成で必要なプロパティについてのみ説明します。

その他SSO設定など詳細なカスタマイズについては[Webアプリケーションモジュールのカスタマイズ][Customizing Web Application Module]を参照してください。

<table>
    <thead>
        <tr>
            <th>プロパティ名</th><th>説明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>datasource.jndiName</td>
            <td>
                データソースのJNDI名を指定します。このプロパティは、Webアプリケーションサーバーに設定したデータソースのJNDI名をデフォルトの「jdbc/infoscoop」に設定した場合、変更の必要はありません。
            </td>
        </tr>
        <tr>
            <td>datasource.schema</td>
            <td>
                リポジトリデータベースのスキーマ名、MySQLの場合は設定は必要ありません。
            </td>
        </tr>
        <tr>
            <td>datasource.dialect</td>
            <td>
                利用するデータベースに応じて以下の値を指定します。<br>
                MySQL: org.hibernate.dialect.MySQLDialect<br>
                Oracle: org.hibernate.dialect.Oracle10gDialect<br>
                DB2: org.hibernate.dialect.DB2Dialect
            </td>
        </tr>
    </tbody>
</table>

remakewar.bat(sh)を実行すると、distディレクトリが作成されその中にデプロイ用のWARファイルが作成されます。


### WARファイルをデプロイする

このWARファイルをWebアプリケーションサーバーにデプロイし、コンテキストを起動するとセットアップは完了です。


## 起動確認

Apache Tomcatを起動した後、以下のURLにアクセスし、admin/adminでログインします。

```
http://<ホスト名>:8080/infoscoop/
```


### テストユーザーでログインする

以下の通りテストユーザーアカウントを初期状態でご用意しています。

* test_user1 ~ test_user3: 管理者アカウント
* test_user4 ~ test_user10: 一般ユーザーアカウント

パスワードはいずれのアカウントも「password」となっています。  
試験運用にお役立て下さい。


[Customizing Web Application Module]: customizing-web-application-module.md "Webアプリケーションモジュールのカスタマイズ"
[System Requirements]: ../system-requirements.md "システム要件"