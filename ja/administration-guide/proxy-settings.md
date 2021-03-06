# プロキシ管理

infoScoop OpenSourceのAjaxプロキシ機構の説明とAjaxプロキシの各種設定方法について説明します。

## 1 Ajaxプロキシ機構

ガジェットに表示されるRSSやiCalendarなどの情報は、infoScoop OpenSourceサーバーのAjaxプロキシ機構(以下、Ajaxプロキシ)が一度Webブラウザからのコンテンツ要求を受け付け、バックエンドのコンテンツサーバーよりデータを取得し、表示に適したデータに加工した後、ブラウザに返します（インナーフレームを利用した機能を除く）。

![Data Communication Path of Gadgets]

つまり、Ajaxプロキシは、Webブラウザに代わりバックエンドのコンテンツサーバーに対してHTTPクライアントとして動作します。  
システム構成上、以下のような考慮事項があります。  
情報をインターネット上のサーバーから取得する場合、通常、プロキシサーバーを介してインターネット上の対象サーバーにアクセスする必要があります(下図参照)。

例） プロキシサーバーが構成されている場合の通信経路例  
![Communication Paths if Using a Proxy Server]

この場合、Ajaxプロキシに、プロキシサーバーを経由する通信を設定する必要があります。  
また、社内のコンテンツサーバーにアクセスする場合でも、infoScoop
OpenSourceを表示しているクライアントのネットワークとは、異なるネットワークにinfoScoop OpenSourceのサーバーが配備されているため個々に設定が必要となる場合があります。  
例えば、infoScoop OpenSourceのサーバーが配備されているネットワークセグメントからコンテンツサーバーへの名前解決ができないなどの問題があります(下図参照)。

![Communication Error]

このような名前解決ができない場合でもIPアドレスでは解決可能な場合、ホスト名をIPアドレスに変換するように設定することもできます。  
この機能は上記の場合の他に、クライアントとサーバーの通信にリバースプロキシを介するネットワーク構成でサーバー間の通信は直接通信する設定などにも利用できます。  
このように、infoScoop OpenSourceのAjaxプロキシ機構は、プロキシサーバーの設定をはじめ、Ajaxプロキシを経由して送信されるリクエスト
について以下の処理を定義することができます。

1. プロキシサーバーの定義
2. リクエストURLの置換
3. 送信するHTTPヘッダの定義
4. サーバーキャッシュ設定

これらは、アドレスパターンを正規表現で記述することにより柔軟な設定が可能となっています。

## 2 管理画面

プロキシ設定は、管理画面のプロキシ管理画面で行います。  
画面は以下の項目から構成されています。  
プロキシ／ＵＲＬ置換設定

  * アドレスパターン
  * プロキシ
   * 有効
   * ホスト
   * ポート
   * 認証
  * 置換ＵＲＬ
  * ヘッダ送信
  * 社内
  * キャッシュ設定
   * 有効
   * 期間（分）
  * 削除

### 2.1 設定の適用規則

Ajaxプロキシは、受信したリクエストのURLと各プロキシ/URL置換設定に設定されたアドレスパターンの正規表現を上から順に判定し最初にマッチした設定を適用します。  
マッチするアドレスパターンがない場合デフォルト設定が使用されます。  
デフォルト設定は何もしないかプロキシサーバーのみ設定可能です。  
なお、正規表現の書式はJavaの書式に従います。詳しくは以下のURLをご覧ください。

    http://java.sun.com/j2se/1.5.0/ja/docs/ja/api/java/util/regex/Pattern.html

アドレスパターンは、表のセルをクリックすると編集モードに切り替わります。  
［**Enter**］キーまたは他の場所をクリックすると変更が確定されます。  
アドレスパターンは、最大512文字まで入力可能です。  
設定の順序は、各行の左にある［**並替**］アイコンをドラッグ＆ドロップすることで入れ替えられます。

### 2.2 設定の追加/削除

設定を追加するには［追加］アイコンをクリックします。  
設定の削除は、各行の右端の![Trash icon]アイコンをクリックします。

### 2.3 コンテキストメニュー

プロキシ管理画面の右上のコントロールについては以下に説明します。
<table>
    <thead>
        <tr>
            <th>アイコン</th><th>名前</th><th>説明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img src="../../images/refresh.gif"/></td>
            <td>読み直し</td>
            <td>前回変更を適用した状態を表示します。</td>
        </tr>
        <tr>
            <td><img src="../../images/apply_changes.gif"/></td>
            <td>変更を適用する</td>
            <td>クリックすると今までに行った編集操作を適用（データを保存）します。<br><strong>注意</strong> 最終的にこのアイコンをクリックしないと、編集操作は破棄されます。</td>
        </tr>
    </tbody>
</table>

## 3 プロキシサーバー設定

プロキシサーバーの設定方法について説明します。  
プロキシを利用する場合は、プロキシの項目で有効にチェックを入れます。チェックすると、プロキシサーバー設定フォームが有効になります。  
設定フォームのホスト・ポート項目は、クリックで編集モードに切り替わります。  
以下は、プロキシサーバー設定項目について説明しています。

  * ［**有効**］: チェックを入れることでプロキシサーバー設定の入力を有効にします。
  * ［**ホスト**］：プロキシのホスト名またはIPアドレスを指定します。［有効］にチェックを入れた場合に必須。ホストは、最大128文字まで入力可能です。
  * ［**ポート**］：プロキシのポート番号指定します。［有効］にチェックを入れた場合に必須。ポートは、0～65535の数値を入力します。
  * ［**認証**］：プロキシサーバーに認証が必要な場合は、認証情報を入力します。認証列の［編集］アイコンをクリックすると認証情報入力用のダイアログが表示されます。以下の項目が表示されます。
    * ユーザー名：プロキシサーバー認証用のユーザー名
    * パスワード：プロキシサーバー認証用のユーザー名
    * 認証サーバー：ActiveDirectoryに対して認証する必要がある場合は、ドメインコントローラのサーバー名を指定します。
    * ドメイン：Active Directoryに対して認証する必要がある場合、認証するドメイン名を指定します。

![Proxy Server Use Case]

## 4 置換URL設定

Ajaxプロキシは、受信したリクエストのURLを別のURLに置換する機能があります。この機能は主にリバースプロキシのバックエンドにinfoScoop OpenSourceを配置している場合などに利用します。

<table>
    <thead>
        <tr>
            <th>アドレスパターン</th><th>置換ＵＲＬ</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>^http://hostA/(.*)</code></td>
            <td><code>http://172.22.115.234/$1</code></td>
        </tr>
    </tbody>
</table>

上記のように、アドレスパターンに入力したURLに対応する置換URLを指定します。  
置換URLのセルもクリックすると編集モードになります。  
アドレスパターン内の`()`にマッチした文字列は置換URLで使用することができます。上記表の設定の場合`http://hostA/rss.xml`は`http://172.22.115.234/rss.xml`に置換されAjaxプロキシからリクエストが送信されます。

![Substitution of the Request URL]

<a name="5_http_headers_transmission_settings"></a>
## 5 HTTPヘッダ送信設定

Ajaxプロキシは、ブラウザから受け付けたリクエストに含まれるHTTPヘッダを、対象のURLに対するリクエストに全て含めるか、指定したHTTPヘッダのみ含めるかを設定することができます。  
HTTPヘッダ送信設定は、ヘッダ送信列の編集アイコンをクリックして表示される画面で設定します。

### 5.1 全てのヘッダを送信する

Ajaxプロキシが受け付けたリクエストヘッダをすべて、バックエンドに対するリクエストに含めます。設定は、HTTPヘッダ送信設定画面で［全てのヘッダを送信］を有効にします。

**注意** 外部サイトに対しては必ず無効になるように設定してください。個人情報がインターネットに漏洩する危険性があります。

### 5.2 指定されたリクエストヘッダのみ送信する

デフォルト設定では、INNA登録済みヘッダ（RFC4229）のみ送信する設定となっています。  
画面上では、［**送信するヘッダを選択**］が有効で、かつINNA登録済みヘッダのチェックボックスが全て有効になっています。  
シングルサインオン環境など、独自のヘッダ送信を利用する必要がある場合は、必要なヘッダを追加してください。  
以下の図は、個別設定を選択し、デフォルト設定の場合を示しています。  
INNA登録済みヘッダではない「is-user」はRSSを配信するコンテンツサーバーに送信されません。  
バックエンドのRSS配信サーバーに「is-user」ヘッダを送信するには、手動設定で独自のヘッダ名を追加する必要があります。

![Custom Headers Transmission]

**注意** Host、User-Agent、Content-Lengthについては、チェックの有無に関わらずリクエストに応じてAjaxプロキシが自動的にHTTPヘッダを付加します。

### 5.3 送信するクッキーの設定

Cookieヘッダについては、Cookieヘッダを送信するか否かの設定に加え、指定した名前のクッキーのみを送信する設定を行うことができます。  
HTTPヘッダ送信設定画面のCookieフィールドセットには以下の3つのオプションがあります。  

 * ［**全てのクッキーを送信する**］：Cookieヘッダの情報を全て送信します。
 * ［**クッキーを送信しない**］：Cookieヘッダの全ての情報を遮断します。
 * ［**送信するクッキーを指定**］：指定された名前のクッキーのみをバックエンドに送信します。

［**送信するクッキーを指定**］を選択した場合にクッキー名を追加するには、ラジオボタンの下のテキストボックス内にクッキー名を入力し［**追加**］ボタンをクリックします。  
クッキー名を追加するためには、［**送信するクッキーを指定**］を選択し、ラジオボタンの下にあるテキストボックス内にクッキー名を入力してから［設定する］ボタンをクリックします。  
また、［**全てのヘッダを送信**］のチェックを有効にした場合、［**全てのクッキーを送信**］が選択されます。


### 5.4 独自のＨＴＴＰヘッダーの設定

独自のＨＴＴＰヘッダーを設定するには、［**送信するヘッダーを選択**］を有効にし、「独自のＨＴＴＰヘッダー」フィールドセットを操作します。

独自のＨＴＴＰヘッダをテキストボックスに入力し、［**追加**］ボタンをクリックしてください。  
追加した独自のＨＴＴＰヘッダーを削除するには![Trash icon]削除アイコンをクリックします。


<a name="proxy_manage_intranet"></a>
## 6 社内（イントラネット）設定

これはセキュリティの設定です。社内（イントラネット）を無効に設定した場合は、対象となるサイトに対して以下のセキュリティ対策が行われます。

  * RSSのアイテム詳細表示時、クロスサイトスクリプティングのために危険なコードを除去する（RSSリーダー、まとめてRSSリーダー）
  * loginCredentialAuthTypeによる自動ログインを行わない（RSSリーダー、切り取りミニブラウザ）

有効にした場合、対象となるサイトに対して上記のセキュリティ対策は行いません。  
特に問題がなければ、この設定は無効にすることを推奨します。

## 7 サーバーキャッシュ設定

外部へのインターネット接続に負荷がかかる環境などで、パフォーマンスを維持するために共用のサーバーキャッシュを設定できます。  
サーバーキャッシュは、指定されたアドレスパターンのプロキシ設定ごとに、キャッシュの有効／無効、有効期限を設定することができます。  
指定されたアドレスパターンで、キャッシュ設定が有効になっている場合、設定された期間の間、そのアドレスパターンにマッチしたURLごとにヘッダやボディの情報をinfoScoopサーバーに保存され再利用されます。

**注意** サーバーキャッシュはGETリクエストにのみ有効です。

［**キャッシュ設定**］の有効にチェックを入れると、期間（分）に１０が入ります。期間（分）の列のテキストボックスをクリックすると、期間を編集することができます。  
期間の最大値は1440(1日)です。

## 8 必須設定

本製品は、メニュー設定や検索設定、休日設定（変更不可）など、いくつかの設定をＵＲＬによって指定します。初期設定では、これらの設定はlocalhostに設定されています。  
そのため、プロキシ設定に初期設定として定義されている、下図の赤枠に囲まれた行は変更しないでください。また、この設定は必ず先頭に設定されている必要があります。

![Required Settings]

## 9 注意事項

デフォルト設定にプロキシサーバーを設定した場合、Ajaxプロキシを介してアクセスする必要のある社内のコンテンツサーバー全ての設定を直接アクセスの設定として追加する必要があります。  
［プロキシ設定］、［置換URL］の設定をしない場合、直接アクセス設定になります。


[Trash icon]: ../../images/trash.gif "ごみ箱"
[Data Communication Path of Gadgets]: images/proxy-management/proxy-settings-1.png "ガジェットのデータ取得通信経路図"
[Communication Paths if Using a Proxy Server]: images/proxy-management/proxy-settings-2.png "プロキシサーバーを利用する場合の通信経路図"
[Communication Error]: images/proxy-management/proxy-settings-3.png "通信エラー"
[Proxy Server Use Case]: images/proxy-management/proxy-settings-4.png "プロキシサーバー利用例"
[Substitution of the Request URL]: images/proxy-management/proxy-settings-5.png "リクエストURLの置換"
[Custom Headers Transmission]: images/proxy-management/proxy-settings-6.png "カスタムヘッダの送信"
[Required Settings]: images/proxy-management/proxy-settings-7.png "必須設定"
