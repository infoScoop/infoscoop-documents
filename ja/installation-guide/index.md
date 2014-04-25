# インストールガイド

クイックスタートを利用する方法と通常のインストール方法があります。


## クイックスタートを利用したインストール方法

クイックスタートとはユーザーが「すぐ使える」ことを目的にinfoScoop OpenSourceにTomcatをバンドルしたモジュールのことです。  
MySQLに対応した形になっており、初期データを簡単に投入できるダンプファイルもご用意しています。  
infoScoop OpenSourceをインストールするためには、基本的にはこちらのクイックスタートををご利用ください。  

* [クイックスタートのセットアップ][QuickStart Setup]
  クイックスタートを使用したinfoScoop OpenSourceのインストール方法を説明します。


## 通常のインストール方法

通常のインストールモジュールはWebアプリケーションサーバー、データベースを限定していません。Tomcat以外のWebアプリケーションサーバー、MySQL以外のデータベースを使用したい場合は、こちらの手順に従って、インストールを行ってください。  
Ubuntu編/CentOS編のインストールガイドはチュートリアル形式で詳細なインストール手順を説明しています。 これらのドキュメントはその他の環境にインストールする際も参考になると思いますので、合わせてご参照ください。  
また、LDAPやSSO製品との連携など高度な設定については、以下の「Webアプリケーションモジュールのカスタマイズ」のドキュメントをご参照ください。

* [インストール概要][Installation Summary]
  infoScoop OpenSourceのインストール手順の概要を説明します。

* [インストールガイド - Ubuntu編][Installation Guide for Ubuntu]
  infoScoop OpenSourceをUbuntuにインストールする場合の手順を説明します。

* [インストールガイド - CentOS編][Installation Guide for CentOS]
  infoScoop OpenSourceをCentOSにインストールする場合の手順を説明します。

* [Webアプリケーションモジュールのカスタマイズ][Customizing Web Application Module]
  ダウンロードしたアーカイブに含まれるinfoscoop.warをWebアプリケーションサーバーにデプロイする前に、環境に合わせた設定を含むWebアプリケーションモジュールとして再作成する手順について説明します。


[QuickStart Setup]: quickstart-setup.md "クイックスタートのセットアップ"
[Installation Summary]: installation-summary.md "インストール概要"
[Installation Guide for Ubuntu]: installation-guide-for-ubuntu.md "インストールガイド - Ubuntu編"
[Installation Guide for CentOS]: installation-guide-for-centos.md "インストールガイド - CentOS編"
[Customizing Web Application Module]: customizing-web-application-module.md "Webアプリケーションモジュールのカスタマイズ"
