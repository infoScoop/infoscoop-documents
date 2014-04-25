# JavaScript APIの制限事項

## Core Gadget Specification

### osapi

  * 以下の関数以外は未対応。
    * osapi.http.get, osapi.http.post, osapi.http.put, osapi.http.delete, newBatch.
  * osapi.http.* の以下のパラメータは未対応。
    * alias, oauth_request_token, oauth_request_token_secret, oauth_token_name, oauth_use_token, refreshInterval, sign_owner, sign_viewer.

### rpc

  * gadgets.rpc.getReceiverOrigin 関数は未対応。

### views

  * gadgets.views.bind 関数は未対応。
  * gadgets.views.openEmbeddedExperience 関数は未対応。
  * gadgets.views.View.bind 関数は未対応。
  * gadgets.views.View.getUrlTemplate 関数は未対応。
  * 以下のViewTypeに対応。
    * CANVAS
    * HOME
  * ViewTypeのDEFAULTはHOME。

### core

  * gadgets.io.MethodType.* の以下のパラメータは未対応。
    * HEAD, PATCH
  * gadgets.io.RequestParameters.* の以下のパラメータは未対応。
    *  ALIAS, OAUTH_REQUEST_TOKEN, OAUTH_REQUEST_TOKEN_SECRET, OAUTH_TOKEN_NAME, OAUTH_USE_TOKEN, REFRESH_INTERVAL, SIGN_OWNER, SIGN_VIEWER.
  * gadgets.io.ProxyUrlRequestParameters.REFRESH_INTERVAL には未対応。
  * gadgets.io.makeRequestで受信できるのはUTF-8のみ。

## Social Gadget Specification

### osapi

  * 以下の関数以外は未対応。
    * osapi.people.*
  * osapi.people.* で取得されるプロフィール情報は、以下のフィールド以外は未対応。
    * id, displayName, emails, organizations
    * emails、 organizationsの値を取得するためには、認証設定がディレクトリサーバーである必要があります。
  * osapi.people.* でグループIDを指定する場合、全て@selfとして扱われます。osapi.people.getOwnerFriends、osapi.people.getViewerFriendsも同様です。


