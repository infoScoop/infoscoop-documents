# Webアプリケーションモジュールのカスタマイズ

infoScoop OpenSourceのサーバーモジュールは、J2EE Webアプリケーションサーバー上で稼動するWebアプリケーションとして提供されます。

ここでは、ダウンロードしたアーカイブに含まれるinfoscoop.warをWebアプリケーションサーバーにデプロイする前に、環境に合わせた設定を含むWebアプリケーションモジュールとして再作成する手順について説明します。


## 1 WARファイル再作成ユーティリティ

infoScoop OpenSourceは、Webアプリケーションサーバーにデプロイする前の準備として、接続先データベースの設定や、アプリケーションログの設定等、システムの初期設定を行ったデプロイ(配置)用のWARファイルを作成するためのユーティリティを用意しています。

アーカイブを解凍したディレクトリの/infoscoopに、ユーティリティremakewar.bat(sh)が含まれています。  
remakewar.bat(sh)は実行にApache Antが必要になります。Apache Antが作業環境に未導入の場合は事前にApache Antをインストールしてください。Apache Antのインストールに関しては[Apache Antのドキュメント][Apache Ant Document]をご参照ください。

**注意** ユーティリティ設定ファイル(build.propertiesおよびprincipalHeaderList.json)の各設定値には以下の制限があります。

* build.properties、principalHeaderList.json共に、XML予約文字(「」、「'」、「"」、「&」)を利用することはできません。必要な場合はXMLエスケープをする必要があります。
* build.propertiesは「¥」、「$」文字が禁則文字となります。「$」は、「$$」とエスケープすることにより利用可能です。
* principalHeaderList.jsonは「¥」文字が禁則文字となります。

また、本製品のパッチバージョンはWARファイルで配布されるため、本章の手順はパッチアップの際にも実行することになります。ユーティリティの各設定ファイル(build.properties、principalHeaderList.jsonおよびCustomizationディレクトリ内のファイル)は、パッチアップの際にも必要となりますので安全に保存しておく必要があります。


## 2 データベース設定を変更する

各ユーザーの画面表示状態などを保存するリポジトリデータベースの設定を行います。

1. /infoScoop/build.propertiesをメモ帳などのテキストエディタで開きます。
1. 以下の__太字__の箇所をご利用になる環境に合わせて編集してください。

   <pre><code>
   dataSource.jndiName=<strong>jdbc/infoscoop</strong>
   dataSource.schema=<strong>iscoop</strong>
   </code></pre>

   設定内容は以下の通りです。

   <table>
       <caption>build.properties設定項目</caption>
       <thead>
           <tr>
               <th>プロパティ名</th><th>説明</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td colspan="2">
                   <strong>dataSource.jndiName</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>JNDIデータソース名</td>
           </tr>
           <tr>
               <td>デフォルト値</td>
               <td>jdbc/infoscoop</td>
           </tr>
           <tr>
               <td>詳細</td>
               <td>
                   このプロパティは、Webアプリケーションサーバーに設定したデータソースのJNDI名をデフォルトの「jdbc/infoscoop」に設定した場合、変更の必要はありません。
               </td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>dataSource.schema</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>リポジトリデータベースのスキーマ名</td>
           </tr>
           <tr>
               <td>デフォルト値</td>
               <td>iscoop</td>
           </tr>
           <tr>
               <td>詳細</td>
               <td>
                   本製品リポジトリ用のテーブルをデータベースへアクセスするユーザー名と異なる名前のスキーマに定義した場合、設定ファイルにスキーマ名を指定する必要があります。<br>
                   デフォルトの場合は、変更する必要はありません。<br>
                   <strong>注意</strong> MySQLを使用する場合は、スキーマの設定はデータベース名と同じにするか空に設定します。
               </td>
           </tr>
       </tbody>
   </table>

<!-- This sentence is not written by Markdown. Because it is not reflected on the GitHub. -->
<ol start="3">
    <li>/infoscoop/build.propertiesを上書き保存します。</li>
</ol>

<a name="without_sso"></a>
## 3 認証設定1 SSO環境を利用しない

SSO環境がない場合は、infoScoop OpenSourceが用意するデフォルトのログイン画面を利用します。  
SSO環境がある場合は、次節 <a href="#set_sso_filter">4 認証設定2 SSO製品と連携する</a>に進んでください。


### 3.1 デフォルトのログイン画面による認証を有効にする

以下の手順でデフォルトのログイン画面による認証を有効にします。この設定はデフォルトの設定となります。

1. /infoscoop/build.propertiesをメモ帳などのテキストエディタで開きます。

1. 以下の__太字__の箇所をご利用になる環境に合わせて編集してください。

   _build.properties(抜粋)_

   <pre><code>
   sessionCreateConfig.loginAuthentication=<strong>true</strong>
   </code></pre>

   設定内容は以下の通りです。

   <table>
       <thead>
           <tr>
               <th>プロパティ名</th><th>説明</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td colspan="2">
                   <strong>sessionCreateConfig.loginAuthentication</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>デフォルトのログイン画面による認証を使用するかどうか</td>
           </tr>
           <tr>
               <td>デフォルト値</td>
               <td>true</td>
           </tr>
           <tr>
               <td>詳細</td>
               <td>
                   以下のうちのいずれか1つを選択します。<br>
                   true: デフォルトのログイン画面による認証を使用する。<br>
                   false: デフォルトのログイン画面による認証を使用しない。SSO環境を利用する場合はfalseを設定します。
               </td>
           </tr>
       </tbody>
   </table>

1. /infoscoop/build.propertiesを上書き保存します。


### 3.2 簡易ユーザーマスターによる認証を設定する

本製品のリポジトリデータベースには、認証用の簡易的なユーザーマスターを用意しています。  
デフォルトの設定では、簡易ユーザーマスターによる認証が有効になっています。


### 3.3 ディレクトリサーバーによる認証を設定する

ディレクトリサーバー(ActiveDirectoryまたはLDAP)によるユーザー認証を設定する場合には、以下の設定を行います。

1. /infoScoop/build.propertiesをメモ帳などのテキストエディタで開きます。

1. 以下の行のコメントを外ししてください(行の先頭の「#」を削除します)。

   build.properties(抜粋)

   ```
   accountAccessConfig=sample/ldap.xml
   ```

   設定内容は以下の通りです。


   <table>
       <caption>build.properties設定項目</caption>
       <thead>
           <tr>
               <th>プロパティ名</th><th>説明</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td colspan="2">
                   <strong>searchUidServiceConfig</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>ユーザー検索サービス設定ファイル</td>
           </tr>
           <tr>
               <td>詳細</td>
               <td>
                   ユーザー検索サービス設定ファイルへのパスを設定します。<br>
                   LDAPを利用する場合のサンプル設定ファイルはsample/ldap.xmlです。
               </td>
           </tr>
       </tbody>
   </table>

1. /infoScoop/build.propertiesを上書き保存します。

1. /infoscoop/sample/ldap.xmlをメモ帳などのテキストエディタで開きます。

1. 以下の__太字__の箇所を連携する環境に合わせて修正します。

   _ディレクトリサーバー設定_

   <pre><code>
   &#60;?xml version="1.0" encoding="UTF-8"?&#62;
   &#60;!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN"
           "http://www.springframework.org/dtd/spring-beans.dtd"&#62;
   &#60;beans&#62;
       &#60;bean id="LDAPAccountManager" singleton="true"
               class="org.infoscoop.account.ldap.LDAPAccountManager"&#62;
           &#60;constructor-arg&#62;
               &#60;value&#62;<strong>ldap://localhost:389</strong>&#60;/value&#62;
           &#60;/constructor-arg&#62;&#60;constructor-arg&#62;
               &#60;value&#62;<strong>CN=Administrator,CN=Users,DC=infoscoop,DC=org</strong>&#60;/value&#62;
           &#60;/constructor-arg&#62;&#60;constructor-arg&#62;
               &#60;value&#62;<strong>secret</strong>&#60;/value&#62;
           &#60;/constructor-arg&#62;&#60;constructor-arg&#62;
               &#60;value&#62;<strong>CN=Users,DC=infoscoop,DC=org</strong>&#60;/value&#62;
           &#60;/constructor-arg&#62;&#60;constructor-arg&#62;
               &#60;value&#62;<strong>OU=MyOffice,DC=infoscoop,DC=org</strong>&#60;/value&#62;
           &#60;/constructor-arg&#62;
           &#60;property name="userSearchAttr"&#62;
               &#60;map&#62;
                   &#60;entry key="user_id"&#62;&#60;value&#62;<strong>sAMAccountName</strong>&#60;/value&#62;&#60;/entry&#62;
                   &#60;entry key="user_name"&#62;&#60;value&#62;cn&#60;/value&#62;&#60;/entry&#62;
                   &#60;entry key="user_email"&#62;&#60;value&#62;mail&#60;/value&#62;&#60;/entry&#62;
               &#60;/map&#62;
           &#60;/property&#62;
           &#60;property name="groupSearchAttr"&#62;
               &#60;map&#62;
                   &#60;entry key="org_name"&#62;&#60;value&#62;cn&#60;/value&#62;&#60;/entry&#62;
                   &#60;entry key="org_member"&#62;&#60;value&#62;member&#60;/value&#62;&#60;/entry&#62;
               &#60;/map&#62;
           &#60;/property&#62;
       &#60;/bean&#62;
       &#60;bean id="searchUserService" singleton="false"
               class="org.infoscoop.account.SearchUserService"&#62;
           &#60;property name="accountManager"&#62;
               &#60;ref bean="LDAPAccountManager"/&#62;
           &#60;/property&#62;
       &#60;/bean&#62;
       &#60;bean id="authenticationService" singleton="false"
               class="org.infoscoop.account.AuthenticationService"&#62;
           &#60;property name="accountManager"&#62;
               &#60;ref bean="LDAPAccountManager"/&#62;
           &#60;/property&#62;
       &#60;/bean&#62;
   &#60;/beans&#62;
   </code></pre>

   設定内容は以下の通りです。

   <table>
       <caption>ディレクトリサーバー設定項目</caption>
       <thead>
           <tr>
               <th>プロパティ名</th><th>説明</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td colspan="2">
                   <strong>constructor-arg 1</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>LDAPサーバーのURL</td>
           </tr>
           <tr>
               <td>デフォルト値</td>
               <td>ldap://localhost:389</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>constructor-arg 2</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>LDAPサーバーへアクセスするユーザーの識別名</td>
           </tr>
           <tr>
               <td>デフォルト値</td>
               <td>CN=Administrator,CN=Users,DC=beaconit,DC=domain</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>constructor-arg 3</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>LDAPサーバーへアクセスするユーザーのパスワード</td>
           </tr>
           <tr>
               <td>デフォルト値</td>
               <td>Secret</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>constructor-arg 4</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>ユーザー検索の基準となる識別名</td>
           </tr>
           <tr>
               <td>デフォルト値</td>
               <td>CN=Users,DC=beaconit,DC=domain</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>constructor-arg 5</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>組織検索の基準となる識別名</td>
           </tr>
           <tr>
               <td>デフォルト値</td>
               <td>OU=MyOffice,DC=beaconit,DC=domain</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>userSearchAttrプロパティuser_id</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>ユーザーIDを表す属性名</td>
           </tr>
           <tr>
               <td>デフォルト値</td>
               <td>sAMAccountName(ActiveDirectoryのデフォルトのアカウントID)</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>userSearchAttrプロパティuser_name</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>ユーザーの名を表す属性名。ユーザー名によるユーザー検索の対象となります。</td>
           </tr>
           <tr>
               <td>デフォルト値</td>
               <td>cn(ActiveDirectoryのデフォルトのユーザー名属性)</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>userSearchAttrプロパティuser_mail</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>ユーザーのメールアドレスを表す属性名。Emailによるユーザー検索の対象となります。</td>
           </tr>
           <tr>
               <td>デフォルト値</td>
               <td>mail(ActiveDirectoryのデフォルトのアカウントメール属性)</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>groupSearchAttrプロパティorg_name</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>ユーザーが所属するグループの名前。組織によるユーザー検索の対象となります。</td>
           </tr>
           <tr>
               <td>デフォルト値</td>
               <td>cn(ActiveDirectoryのデフォルトのグループ名属性)</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>groupSearchAttrプロパティorg_member</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>グループに所属するユーザーを参照する属性。</td>
           </tr>
           <tr>
               <td>デフォルト値</td>
               <td>member(ActiveDirectoryのデフォルトの所属ユーザー属性)</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>userNameAttr</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>表示用のユーザー名として使用する属性名。検索対象の属性と表示する属性が異なる場合にセットします。</td>
           </tr>
           <tr>
               <td>デフォルト値</td>
               <td>無し</td>
           </tr>
       </tbody>
   </table>

1. /infoscoop/sample/ldap.xmlを上書き保存します。


<a name="set_sso_filter"></a>
## 4 認証設定2 SSO製品と連携する

ユーザー認証を、導入済みのシングルサインオン(以下SSO)製品と連携するためには、以下の設定をします。  
前節 <a href="#without_sso">3 認証設定1 SSO環境を利用しない</a>の設定を行った場合、この節で行う設定は必要ありません。

通常、SSO製品は連携用のモジュールをサーブレットフィルタとして提供しています。以下の設定を行うことで、SSO用のサーブレットフィルタをinfoScoop OpenSourceに適用することができます。

1. /infoscoop/build.propertiesをメモ帳などのテキストエディタで開きます。

1. 以下の__太字__の箇所を連携するSSO製品に合わせて修正します。

   <pre><code>
   sessionCreateConfig.loginAuthentication=<strong>false</strong>
   customizeSSOFilterClass=<strong>CustomizeSSOFilter</strong>
   sessionCreateConfig.uidHeader=<strong>UID</strong>
   sessionCreateConfig.usernameHeader=<strong>LOGINUSER_NAME</strong>
   </code></pre>

   設定内容は以下の通りです。

   <table>
       <caption>build.properties設定項目</caption>
       <thead>
           <tr>
               <th>プロパティ名</th><th>説明</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td colspan="2">
                   <strong>sessionCreateConfig.loginAuthentication</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>デフォルトのログイン画面による認証を使用するかどうか</td>
           </tr>
           <tr>
               <td>デフォルト値</td>
               <td>true</td>
           </tr>
           <tr>
               <td>詳細</td>
               <td>
                   以下のうちのいずれか一つを選択します。<br>
                   true: デフォルトのログイン画面による認証を使用する。<br>
                   false: デフォルトのログイン画面による認証を使用しない。SSO環境を利用する場合はfalseを設定します。
               </td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>customizeSSOFilterClass</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>SSO製品が提供するサーブレットフィルタクラス名</td>
           </tr>
           <tr>
               <td>詳細</td>
               <td>
                   本製品と連携するSSO製品に合わせて設定を行います。<br>
                   詳細についてはご利用になられるSSO製品のマニュアルをご参照ください。<br>
                   一般的に、リバースプロキシ型の構成で連携をする場合は、この設定は必要ありません。
               </td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>sessionCreateConfig.uidHeader</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>SSO製品から送信されるユーザーID情報を含むHTTPヘッダ名</td>
           </tr>
           <tr>
               <td>詳細</td>
               <td>
                   本製品と連携するSSO製品に合わせて設定を行います。<br>
                   詳細についてはご利用になられるSSO製品のマニュアルをご参照ください。
               </td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>sessionCreateConfig.usernameHeader</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>SSO製品から送信されるユーザー名情報を含むHTTPヘッダ名</td>
           </tr>
           <tr>
               <td>詳細</td>
               <td>
                   本製品と連携するSSO製品に合わせて設定を行います。<br>
                   詳細についてはご利用になられるSSO製品のマニュアルをご参照ください。
               </td>
           </tr>
       </tbody>
   </table>

1. build.propertiesを上書き保存します。

1. SSO製品から提供されるサーブレットフィルタクラスを配置します。
    * サーブレットフィルタクラスがjarファイル形式で提供されている場合は/infoscoop/Customization/WEB-INF/libフォルダに配置してください。
    * サーブレットフィルタクラスがclassファイル形式で提供されている場合は/infoscoop/Customization/WEB-INF/classesフォルダにパッケージ階層と共に配置してください。

**注意** 上記の説明以外の方法でSSO製品と連携を行う必要がある場合は、ユーザーフォーラムに質問してください。

<a name="http-header"></a>
## 5 HTTPヘッダをロール情報として定義する

infoScoop OpenSouceは、ユーザーのロール(所属情報)に従ってメニュー、初期画面の構成を切り替える機能があります。  
この機能は、HTTPヘッダとして送られてくる情報をロール情報として利用することが可能です。ロール設定は、連携するシングルサインオン製品やユーザー認証機構に応じて行います。  
また、ディレクトリサーバーから直接ユーザーの所属情報をHTTPヘッダにマッピングするモジュールを追加する場合、サーブレットフィルタとして実装しそれを設定することも可能です。

ロール(所属情報)に従って初期表示画面の構成を切り替える機能の詳細については[管理ガイド][Administration Guide]をご参照ください。

1. /infoscoop/principalHeaderList.jsonをメモ帳などのテキストエディタで開きます。

1. 以下の例をご利用になる環境に合わせて編集します。

   ```
   [
       {
           type: "UserGroupPrincipal",
           displayName: "ユーザーグループ",
           headerName: "ROLE_USER_GROUP"
       }
   ]
   ```

   principalHeaderList.jsonはJSON形式のファイルです。  
   下記が、1つの設定となり、このエントリを配列として指定します。

   ```
   {type:"OrganizationPrincipal",displayName:"組織",headerName:"ORGANIZATION"}

   ```

   各エントリの配列は、以下のように"[","]"の中にカンマ区切りで指定します。

   ```
   [{エントリ1},{エントリ2},{エントリ3}]
   ```

   以下に、各設定項目について説明します。

   <table>
       <caption>principalHeaderList.json設定</caption>
       <thead>
           <tr>
               <th>プロパティ名</th><th>説明</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td>type</td>
               <td>
                   ロールの主体者の識別子。一意に設定する。<br>
                   「UIDPrincipal」は本製品で予約されています。<br>
                   typeで使用できる文字は半角アルファベットのみです。<br>
                   各エントリに指定したtypeは重複しないように設定してください。
               </td>
           </tr>
           <tr>
               <td>displayName</td>
               <td>
                   管理画面の主体者を選択するプルダウンリストに表示されるラベル。
               </td>
           </tr>
           <tr>
               <td>headerName</td>
               <td>
                   実際の主体者の文字列を送信するHTTPヘッダ名。
               </td>
           </tr>
       </tbody>
   </table>

1. principalHeaderList.jsonを上書き保存します。  
   Directoryサーバー、その他のユーザーマスタの情報を主体者として利用するためには、取得した情報をHTTPヘッダにマッピングするサーブレットフィルタを作成し本製品モジュールに追加する必要があります。  
   以下は、カスタムサーブレットフィルタを追加する場合のみ設定下さい。

1. /infoscoop/build.propertiesをメモ帳などのテキストエディタで開きます。

1. 以下の___太字斜体___の箇所を連携するSSO製品に合わせて修正します。

   <pre><code>
   customizeSetRoleHeaderFilterClass=<strong><i>org.infoscoop.web.CustomizeRoleFilter</i></strong>
   </code></pre>

   設定内容は以下の通りです。

   <table>
       <caption>build.properties設定項目</caption>
       <thead>
           <tr>
               <th>プロパティ名</th><th>説明</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td colspan="2">
                   <strong>customizeSetRoleHeaderFilterClass</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>
                   ロール情報マッピング用カスタムサーブレットフィルタ名
               </td>
           </tr>
           <tr>
               <td>詳細</td>
               <td>
                   連携するユーザーマスタ(Directoryサーバー)から取得した情報をHTTPヘッダとして本製品に渡すサーブレットフィルタのクラス名を指定します。
               </td>
           </tr>
       </tbody>
   </table>

1. build.propertiesを上書き保存します。

1. 作成したサーブレットフィルタクラスを配置します。

    * サーブレットフィルタクラスをjarファイル形式で配置する場合は/infoscoop/Customization/WEB-INF/libフォルダに配置してください。
    * サーブレットフィルタクラスをclassファイルのまま配置する場合は/infoscoop/Customization/WEB-INF/classesフォルダにパッケージ階層と共に配置してください。


# 6 ログ出力を設定する

infoScoop　OpenSourceのデフォルト設定は、アプリケーション実行時のログを以下の場所に出力します。

Windowsの場合:

```
<infoScoopがデプロイされているAPサーバーのドライブ>:\var\log\infoscoop\
```

Linuxの場合:

```
/var/log/infoscoop
```

**注意** Webアプリケーションサーバーを実行するユーザーに、上記のディレクトリに対する書き込み権限が必要です。

ログは日ごとに「infoscoop_log_yyyyMMdd.log」の形式のファイル名で出力されます。  
__例__: infoscoop_log_20080808.log  
上記のデフォルト設定で問題ない場合は、ログ出力の設定を行う必要はありません。  
ログ出力の設定を変更したい場合は、以下のファイルを修正します。

```
/infoscoop/Customization/WEB-INF/conf/log4j.xml
```

設定ファイルの修正方法については、「infoScoop運用マニュアル(準備中)」を参照ください。


# 7 ログインユーザーIDの大文字小文字を区別しない

本製品はデフォルト設定では、ログインユーザーIDの大文字小文字を区別します。  
LDAPのように認証サービスがユーザーIDの大文字小文字を区別しない場合、以下の設定を行います。

**注意** ActiveDirectoryを始め多くのディレクトリサーバーは認証時に大文字小文字を区別しません。

1. /infoscoop/build.propertiesをメモ帳などのテキストエディタで開きます。

1. 以下の行のコメントを外し(行の先頭の「#」を削除します)、___太字斜体___の箇所を修正します。

   build.properties(抜粋)

   <pre><code>
   sessionCreateConfig.uidIgnoreCase=<strong><i>false</i></strong>
   </code></pre>

   設定内容は以下の通りです。

   <table>
       <caption>build.properties設定項目</caption>
       <thead>
           <tr>
               <th>プロパティ名</th><th>説明</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td colspan="2">
                   <strong>sessionManagerFilter.uidIgnoreCase</strong>
               </td>
           </tr>
           <tr>
               <td>設定内容</td>
               <td>
                   ログインユーザーIDの大文字小文字の区別を行うかどうか
               </td>
           </tr>
           <tr>
               <td>詳細</td>
               <td>
                   以下のうちのいずれか1つを選択します。<br>
                   true: 大文字小文字の区別を行わない。<br>
                   false: 大文字小文字の区別を行う。
               </td>
           </tr>
       </tbody>
   </table>

1. build.propertiesを上書き保存します。

__sessionManagerFilter.uidIgnoreCaseの設定をfalse(デフォルト)からtrueに変更した場合__、既存のユーザー情報の中に大文字小文字が異なるユーザーIDでログインした複数のユーザープロファイル(ユーザーの画面設定情報)がある場合、ユーザープロファイルを選択する画面が表示されます。


# 8 その他の設定

remakewar.bat(sh)は、infoscoop.warファイルを展開しCustomizationディレクトリの内容で上書きして再度WARファイルにまとめます。
Customizationディレクトリは、以下のように構成されています。

    Customization  
    |   changePassword.jsp
    |   login.jsp
    |   openid_login.jsp.sample
    |
    \---WEB-INF
        +---classes
        +---conf
        |       log4j.xml
        |
        \---lib

* **changePassword.jsp:** パスワード変更フォーム表示用JSP
* **login.jsp:** ログインフォーム表示用JSP
* **openid_login.jsp.sample:** OpenIDログイン画面のサンプルJSP
* **classes:** SSOまたはロール情報取得用のサーブレットフィルタのクラス。ファイル配置用ディレクトリ
* **log4j.xml:** ログ出力設定ファイル
* **lib:** SSOまたはロール情報取得用のサーブレットフィルタのjarファイル配置用ディレクトリ

上記の表に、記載されている以外のファイルのカスタマイズは、バージョンアップの保護の象外となります。  
前節までに説明した設定以外では、本製品標準のログイン機構を使用する場合に表示されるログインページとパスワード変更ページのみとなります。上記の表に含まれないファイルの扱いについては、ユーザーフォーラムにお問い合わせください。


## 9 WARファイルを再作成する

システムの初期設定が完了したら、コマンドラインからWARファイルを再作成するためのバッチ(シェルスクリプト)を実行します。以下のバッチ(シェルスクリプト)を実行します。

```
Windowsの場合:
\infoscoop\remakewar.bat
Linuxの場合:
/var/infoscoop
```

¥infoscoop¥distディレクトリに設定が反映されたinfoscoop.warが再作成されます。  
この手順により、再作成されるWARファイルにここまでに施した設定内容が反映されます。

**注意** Apache Antが正常に稼動していない場合、WARファイルを正しく作成することができませんのでご注意ください。


## 10 カスタマイズ設定の保存

WARファイルのカスタマイズを行った場合、バージョンおよびパッチアップの際に再度remakewar.bat(sh)によってデプロイ用のWARファイルを再作成することになります。  
build.propertiesとCustomizationディレクトリについては、次回のパッチアップ、バージョンアップに必要となるため大切に保管してください。


[Apache Ant Document]: http://ant.apache.org/manual/index.html "Apache Antのドキュメント"
[Administration Guide]: ../administration-guide/index.md "管理ガイド"
