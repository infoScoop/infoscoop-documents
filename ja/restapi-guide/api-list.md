# API一覧
ここでは、提供されるAPIの仕様詳細について説明します。


## 1 プロファイル情報系API
プロファイル情報系APIに分類されるAPIは以下の2つです。

1. ユーザーID一覧取得API  
   infoScoopに存在するユーザープロファイルのユーザーID一覧を取得するAPIです。
2. ユーザプロファイル削除API  
   infoScoopに存在する特定のユーザープロファイルを削除するAPIです。


### 1.2 ユーザーID一覧取得API
ユーザーID一覧取得APIのURLは次の通りです。
<pre>
<code>http://<infoScoop稼動ホスト>/infoscoop/isapi/v1/admin/profiles/user.<i>{データ形式}</i></code>
</pre>
*{データ形式}*には`xml`または`json`を入力します。
* xml  
  データをXML形式で取得します。
* json  
  データをJSON形式で取得します。

以下は入力例です。
```
http://localhost:8080/infoscoop/isapi/v1/admin/profiles/user.xml
```

このAPIの利用に必須となる条件は以下の通りです。
<table>
    <thead>
        <tr>
            <th>項目名</th>
            <th>項目値</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>HTTPメソッド</td>
            <td>GET</td>
        </tr>
        <tr>
            <td>スコープ</td>
            <td>USERPROFILE</td>
        </tr>
        <tr>
            <td>ロール</td>
            <td>管理者、またはネイティブアプリケーション</td>
        </tr>
    </tbody>
</table>

以下はXML形式で取得したデータの例です。
```
<userProfiles>
    <userProfile>
        <uid>test_user1</uid>
    </userProfile>
    <userProfile>
        <uid>test_user2</uid>
    </userProfile>
</userProfiles>
```

以下はJSON形式で取得したデータの例です。
```
{
    "userProfiles" : [
        {
            "uid" : "test_user1"
        }, {
            "uid" : "test_user2"
        }
    ]
}
```


### 1.3 ユーザープロファイル削除API
ユーザープロファイル削除APIのURLは次の通りです。
<pre>
<code>http://<infoScoop稼動ホスト>/infoscoop/isapi/v1/admin/profiles/user/<i>{uid}</i></code>
</pre>
*{uid}*には削除するプロファイルのユーザーIDを入力します。

以下は入力例です。
```
http://localhost:8080/infoscoop/isapi/v1/admin/profiles/user/test_user1
```

このAPIの利用に必須となる条件は以下の通りです。
<table>
    <thead>
        <tr>
            <th>項目名</th>
            <th>項目値</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>HTTPメソッド</td>
            <td>DELETE</td>
        </tr>
        <tr>
            <td>スコープ</td>
            <td>USERPROFILE</td>
        </tr>
        <tr>
            <td>ロール</td>
            <td>管理者、またはネイティブアプリケーション</td>
        </tr>
    </tbody>
</table>

**注意** 一度削除したユーザープロファイルを元に戻すことはできません。
