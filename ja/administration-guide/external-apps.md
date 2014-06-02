# 外部アプリ管理

APIアクセスするためのOAuthプロバイダー設定および管理方法について説明します。


## 1 外部アプリについて

この設定項目では、外部のアプリケーションからAPI経由でinfoScoopにアクセスするための認証設定を行います。  

認証方式は、OAuth2を利用しており、ここでクライアントIDおよびクライアントシークレットを発行し、それらを使って外部アプリケーションからのアクセスが可能となります。  

OAuthとは、マッシュアップを行いたいサービス(コンシューマー)が、ユーザのidやパスワードを直接受け取ることなく、マッシュアップ元のサービス(サービスプロバイダー)で認証させ、必要なデータの取得を可能にする仕様のことです。  

本製品のOAuth2プロバイダーの仕様は、draft31に準拠しています。詳細な仕様については、[The OAuth 2.0 Authorization Framework draft-ietf-oauth-v2-31][The OAuth 2.0 Authorization Framework draft-ietf-oauth-v2-31]を参照してください。


## 2 外部アプリ管理画面

![external-apps-admin-page-icon]

外部アプリ管理画面は、管理画面上部のメニューより[外部アプリ]をクリックして開きます。  

ここでは、外部アプリの追加、削除、編集をこの画面で行います。  

### 2.1 外部アプリ設定

外部アプリ一覧より、設定を変更する外部アプリを選択すると、選択した項目が反転し右側に設定可能な項目が表示されます。  

![external-apps-settings-icon]

[外部アプリ設定の編集]には、infoScoopにAPIアクセスするために必要な項目が表示されます。  

### 2.2 外部アプリの追加／更新

この項目では、外部アプリの各種設定方法に関して説明します。  

#### 2.2.1 外部アプリの追加

外部アプリをinfoScoopに登録する場合、右上の[外部アプリの追加]をクリックします。  

[設定の保存]をクリックすることで外部アプリを追加することができます。  

![external-apps-add-icon]
各項目の詳細は以下になります。  

<table>
    <thead>
        <tr>
            <th>名前</th>
            <th>説明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>(1)</td>
            <td>
            外部アプリの名前を入力する項目です。  
            ここで設定された名前が[外部アプリ一覧]に表示されます。
            </td>
        </tr>
        <tr>
            <td>クライアントID</td>
            <td>
            外部アプリを登録した際に発行されるクライアントIDが表示されます。  
            クライアントIDは50桁の乱数になります。  
            追加時には、表示されません。
            </td>
        </tr>
        <tr>
            <td>クライアントシークレット</td>
            <td>
            外部アプリを登録した際に発行されるクライアントシークレットが表示されます。  
            クライアントシークレットは50桁の乱数になります。  
            追加時には、表示されません。
            </td>
        </tr>
        <tr>
            <td>リダイレクトURL</td>
            <td>
            外部アプリから送信されてくるリダイレクトURLとのマッチングに利用します。  
            送信されてくるリダイレクトURLと一致しない場合、認証エラーとなります。  
            [外部アプリの種類]をネイティブアプリケーションに設定した場合、利用しません。
            </td>
        </tr>
        <tr>
            <td>外部アプリの種類</td>
            <td>
            infoScoopにアクセスする外部アプリの種類を設定する項目です。
            </td>
        </tr>
        <tr>
            <td>外部アプリの説明</td>
            <td>
            外部アプリ設定の説明を記述する項目です。
            </td>
        </tr>
    </tbody>
</table>

#### 2.2.2 外部アプリの更新

[外部アプリ一覧]から外部アプリを選択した場合、右ペインに選択した外部アプリの設定が表示されます。  

![external-apps-save-icon]

設定を変更し、[設定の保存]ボタンをクリックすることで、外部アプリを更新することができます。  

**注意** 初期登録されている[infoScoop Utility]の設定は、削除できません。

#### 2.2.3 外部アプリの削除

[外部アプリ一覧]から外部アプリを選択した場合、右ペインに選択した外部アプリの設定が表示されます。  

![external-apps-delete-icon]

[外部アプリの削除]ボタンをクリックすると、選択した外部アプリを削除することができます。  

**注意** 初期登録されている[infoScoop Utility]の設定は、削除できません。

#### 2.2.4 クライアントシークレットの再設定

外部アプリの設定画面から登録されている外部アプリのクライアントシークレットを再設定できます。  

![external-apps-client-secret-reset-icon]

クライアントシークレット項目の右側に[再設定]リンクがあります。これをクリックすることで、クライアントシークレットを再設定することができます。  
クライアントシークレットの再設定は、[設定の保存]ボタンを押さなくても、サーバーに保存されます。  

**注意** クライアントシークレットの再設定を行った場合、データベースに保存されている認証情報がすべて削除されます。 



[The OAuth 2.0 Authorization Framework draft-ietf-oauth-v2-31]: http://tools.ietf.org/html/draft-ietf-oauth-v2-31 "The OAuth 2.0 Authorization Framework draft-ietf-oauth-v2-31"

[external-apps-admin-page-icon]: images/external-apps/external-apps-admin-page.png "外部アプリ管理画面"
[external-apps-settings-icon]: images/external-apps/external-apps-settings.png "外部アプリ設定画面"
[external-apps-add-icon]: images/external-apps/external-apps-add.png "外部アプリ追加画面"
[external-apps-save-icon]: images/external-apps/external-apps-save.png "設定の保存ボタン"
[external-apps-delete-icon]: images/external-apps/external-apps-delete.png "外部アプリの削除ボタン"
[external-apps-client-secret-reset-icon]: images/external-apps/external-apps-client-secret-reset.png "クライアントシークレットの再設定リンク"