# 署名付きリクエスト

署名付き リクエストとは、呼び出し先のWebサービスに対し、RSA証明書による署名付きのリクエストを行うことです。
呼び出し先の Web サービスでは、署名を使うことで呼び出しの際のリクエストが改ざんされていないこと等を検証することができます。
外部サービスを利用する場合は、署名付きリクエストを使うことを推奨します。
詳細な仕様については、以下の [OAuth Consumer Request 1.0 Draft 1] を参照してください。

## 送信されるパラメーター

署名付きリクエスト時、呼び出し先Web サーバーに以下の情報が送信されます。

**opensocial_viewer_id**  
ログインユーザー ID です。（通常はこちらを利用してください）

**opensocial_owner_id**  
ログインユーザー ID です。

**opensocial_app_id**  
ガジェットのモジュール ID です。

**opensocial_instance_id**  
ガジェットのモジュール ID です。

**oauth_consumer_key**  
管理画面で設定されるコンシューマーキーです。

**oauth_signature_method**  
署名方法（RSA-SHA1 固定）です。

**oauth_timestamp**  
UNIX タイムスタンプ値です。

**oauth_nonce**  
ランダムな文字列です。

**oauth_version**  
OAuth のバージョン (1.0 固定) です。

**oauth_signature**  
リクエストの妥当性を検証するための署名です。

RSA証明書の設定については、管理ガイドの<a href="../administration-guide/oauth-administration.md#container_cert">3.2 コンテナの証明書</a>を参照してください。


[OAuth Consumer Request 1.0 Draft 1]: http://oauth.googlecode.com/svn/spec/ext/consumer_request/1.0/drafts/1/spec.html
[OAuth Administration]: ../administration-guide/oauth-administration.md "OAuth管理"
