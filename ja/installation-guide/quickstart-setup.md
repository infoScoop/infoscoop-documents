# クイックスタートのセットアップ

クイックスタートのセットアップ方法について説明します。

`infoscoop-x.x.x-quickstart.zip(tar.gz)`を解凍し以下の手順を実行して下さい。(xにはバージョン番号が入ります。)

**注意** 事前にMySQL及びJDKをインストールしてください。インストールするバージョンについては[システム要件][System Requirements]をご確認ください。


## 1 リポジトリデータベースの作成

mysqlのコンソールを呼び出し、infoScoop OpenSourceリポジトリ用のデータベースを作成します。

```
$mysql -uroot -p
mysql>create database iscoop character set utf8;
mysql>exit
```


## 2 リポジトリデータベースへ初期データを投入

以下のコマンドを実行し、作成したデータベースに初期データを投入します。

```
$ cd infoscoop-x.x.x-quickstart
$ mysql -uroot -p --default-character-set=utf8 iscoop < init_infoscoop.ja.sql
```

`init_infoscoop.sql`を選択した場合はメニュー等のサンプル設定が英語になります。


## 3 データベース接続設定

クイックスタートはデフォルト設定では、MySQLが同じサーバー、デフォルトポート`3306`、データベースへの接続ユーザーIDが`root`、パスワードは無しになっています。  
これ以外の場合は、データベース設定を変更する必要があります。  
設定を変更する場合は、以下のファイルを編集します。

    apache-tomcat-x.x.x/conf/Catalina/localhost/infoscoop.xml

以下の属性を適切な値に変更してください。

* username：データベース接続ユーザーID
* password：データベース接続パスワード
* url：データベース接続URL。別サーバーのMySQLに接続する場合は`localhost`を適切なホスト名に、デフォルトポートを使用していない場合は`3306`を適切な値に変更します。


## 4 infoScoop OpenSourceサーバーの起動

以下のコマンドを実行してください。

    $ startup.bat(sh)

以上で、infoScoop OpenSourceクイックスタートのセットアップは終了です。

停止は以下のコマンドを実行します。

    $ shutdown.bat(sh)


## 5 infoScoop OpenSourceの起動

ブラウザを起動し以下のアドレスを表示してください。

    http://<ホスト名>:8080/infoscoop/

ログイン画面が表示されます。パスワード`admin`を使用してadminユーザーでログインします。

以下の通りテストユーザーアカウントを初期状態でご用意しています。

* test_user1～test_user3：管理者アカウント
* test_user4～test_user10：一般ユーザーアカウント

パスワードはいずれのアカウントも`password`となっています。


## ユーザーの追加方法

ユーザーの追加方法を説明します。


### 1 import.csvの編集

以下のファイルを編集します。


    infoscoop-x.x.x-quickstart/initdb/data/accounts/import.csv


以下の形式でユーザーを追加します。

    <ユーザーID>,<ユーザー名>,<パスワード>


### 2 addaccount.bat(sh)の実行

`initdb`ディレクトリに移動し、`addaccount.bat(sh)`を実行します。

    $ cd infoscoop-x.x.x-quickstart/initdb
    $ addaccount.bat(sh)


[System Requirements]: ../system-requirements.md "システム要件"