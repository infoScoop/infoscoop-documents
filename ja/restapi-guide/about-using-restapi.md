# REST APIの利用方法について
ここでは、infoScoop OpenSourceにおけるREST APIの認証方式およびアクセス方法について説明します。


## 1 認証方式について
infoScoop REST APIでは、ユーザー認証と権限の認可にOAuth 2.0プロトコルを用います。

infoScoop OpenSourceのOAuth 2.0で利用可能な認可フローは以下の通りです。
* 認可コード
* クライアントクレデンシャル

OAuth 2.0仕様の詳細についてはRFC6749「The OAuth 2.0 Authorization Framework」を参照してください。


### 1.1 クライアントIDとクライアントシークレットの取得
OAuth 2.0で使用するクライアントIDとクライアントシークレットの取得は、infoScoop管理画面の「外部アプリ」設定から取得します。外部アプリの設定方法については[外部アプリ管理][external-apps]を参照してください。

外部アプリの種類については、認可フローに認可コードを使用する場合は「ウェブアプリケーション」を、クライアントクレデンシャルを使用する場合は「ネイティブアプリケーション（バッチ、シェルスクリプトなど）」を選択してください。


### 1.2 認可コードによる認証
認可コードによるAPIアクセス方法について説明します。


#### 1.2.1 認可リクエスト
Webブラウザを利用して、エンドユーザーの認可コードを取得します。

以下のURLをエンドユーザーにリクエストさせて、アクセスを認可の画面にリダイレクトさせます。
* リクエストURL  
  ```
  http://<infoScoop稼動ホスト>/infoscoop/oauth/authorize
  ```

以下は認可リクエストにおけるリクエストパラメーターの一覧です。
<table>
    <thead>
        <tr>
            <th>項目名</th>
            <th>項目値</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>client_id</td>
            <td>OAuth 2.0クライアントIDを指定します。</td>
        </tr>
        <tr>
            <td>scope</td>
            <td>APIへのアクセス権限があるスコープを指定します。</td>
        </tr>
        <tr>
            <td>redirect_uri</td>
            <td>外部アプリ登録時に設定したリダイレクトURLを指定します。</td>
        </tr>
        <tr>
            <td>response_type</td>
            <td><code>code</code>を指定します。</td>
        </tr>
    </tbody>
</table>

エンドユーザーが承認すると、`redirect_uri`で指定したURLへ認可コード付きでリダイレクトされます。認可コードのURLパラメーター名は`code`になります。


#### 1.2.2 アクセストークンリクエスト
認可リクエストで取得した認可コードを利用して、APIアクセスに必要なアクセストークンをリクエストします。
* トークンエンドポイント  
  ```
  http://<infoScoop稼動ホスト>/infoscoop/oauth/token
  ```

以下は、アクセストークンリクエストにおけるリクエストパラメーター（認可コード）の一覧です。
<table>
    <thead>
        <tr>
            <th>項目名</th>
            <th>項目値</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>grant_type</td>
            <td><code>authorization_code</code>を指定します。</td>
        </tr>
        <tr>
            <td>client_id</td>
            <td>OAuth 2.0クライアントIDを指定します。</td>
        </tr>
        <tr>
            <td>client_secret</td>
            <td>OAuth 2.0クライアントシークレットを指定します。</td>
        </tr>
        <tr>
            <td>code</td>
            <td>認可コードを指定します。</td>
        </tr>
        <tr>
            <td>redirect_uri</td>
            <td>外部アプリ登録時に設定したリダイレクトURLを指定します。</td>
        </tr>
    </tbody>
</table>

リクエストが正常に処理されると、アクセストークンを含むJSON形式のレスポンスが返されます。

以下は、アクセストークンリクエストにおけるレスポンスパラメーター（認可コード）の一覧です。
<table>
    <thead>
        <tr>
            <th>項目名</th>
            <th>項目値</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>access_token</td>
            <td>アクセストークン</td>
        </tr>
        <tr>
            <td>refresh_token</td>
            <td>リフレッシュトークン</td>
        </tr>
        <tr>
            <td>token_type</td>
            <td><code>Bearer</code>という値が返されます。</td>
        </tr>
        <tr>
            <td>expires_in</td>
            <td>アクセストークンの有効期限を表す秒数</td>
        </tr>
    </tbody>
</table>


### 1.3 クライアントクレデンシャルによる認証
クライアントクレデンシャルによるREST APIアクセス方法について説明します。

#### 1.3.1 アクセストークンリクエスト

APIアクセスに必要なアクセストークンをリクエストします。
* トークンエンドポイント  
  ```
  http://<infoScoop稼動ホスト>/infoscoop/oauth/token
  ```

以下は、アクセストークンリクエストにおけるリクエストパラメーター（クライアントクレデンシャル）の一覧です。
<table>
    <thead>
        <tr>
            <th>項目名</th>
            <th>項目値</th>
        </tr>
        <tr>
            <td>grant_type</td>
            <td><code>client_credentials</code>を指定します。</td>
        </tr>
        <tr>
            <td>client_id</td>
            <td>OAuth 2.0クライアントIDを指定します。</td>
        </tr>
        <tr>
            <td>client_secret</td>
            <td>OAuth 2.0クライアントシークレットを指定します。</td>
        </tr>
        <tr>
            <td>code</td>
            <td>認可コードを指定します。</td>
        </tr>
    </tbody>
</table>

リクエストが正常に処理されると、アクセストークンを含むJSON形式のレスポンスが返されます。

以下は、アクセストークンリクエストにおけるレスポンスパラメーター（クライアントクレデンシャル）の一覧です。
<table>
    <thead>
        <tr>
            <th>項目名</th>
            <th>項目値</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>access_token</td>
            <td>アクセストークン</td>
        </tr>
        <tr>
            <td>token_type</td>
            <td><code>Bearer</code>という値が返されます。</td>
        </tr>
        <tr>
            <td>expires_in</td>
            <td>アクセストークンの有効期限を表す秒数</td>
        </tr>
    </tbody>
</table>


### 1.4 APIへのアクセス
アクセストークンを使ってAPIにリクエストを送信する方法について説明します。

アクセストークンは、Authorizationリクエストヘッダーフィールドに含めて送信します。`Bearer`という文字列に続けて空白を1つ入れた後に、アクセストークンを記述します。
<pre>
<code>GET /resource/1 HTTP/1.1
    Host: example.com
    Authorization: Bearer <i>アクセストークン</i></code>
</pre>


[external-apps]: ../administration-guide/external-apps.md "外部アプリ管理"