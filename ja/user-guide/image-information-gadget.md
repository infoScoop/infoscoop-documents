# 画像付きお知らせ

画像付きお知らせは、固定エリア専用のガジェットです。管理権限を持つユーザーによって設定されます。

お知らせガジェットとの違いは、記事の作成者の画像が表示される点です。  
RSSアイテムがXMLエスケープされたHTMLのsrcタグをcreator要素に含んでいる場合、そのsrcタグに指定されている画像が表示されます。

    <dc:creator>&lt;img src="http://hostname/image/author.gif"&gt;</dc:creator>


## ガジェットヘッダーアイコン

以下に画像付きお知らせのガジェットヘッダーアイコンについて説明します。

<table>
    <thead>
        <tr>
            <th>アイコン</th>
            <th>名前</th>
            <th>説明</th>
        </tr>
        <tr>
            <td><img src="../../images/refresh.gif" alt="更新"></td>
            <td>更新</td>
            <td>コンテンツを再読み込みします。</td>
        </tr>
        <tr>
            <td><img src="../../images/maximize.gif" alt="最大化"></td>
            <td>最大化</td>
            <td>ガジェットを最大化します。</td>
        </tr>
        <tr>
            <td><img src="../../images/show_hidden_icons.gif" alt="メニューを開く"></td>
            <td>メニューを開く</td>
            <td>ガジェットのメニューを開きます。</td>
        </tr>
</table>


## ガジェットメニュー

ガジェットヘッダーの![Gadget Menu Open]アイコンをクリックすると、画像付きお知らせのガジェットメニューが表示されます。
以下に画像付きお知らせのガジェットメニューについて説明します。

<table>
    <thead>
        <tr>
            <th>項目</th>
            <th>説明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img src="../../images/access.gif" alt="アクセス統計">アクセス統計</td>
            <td>RSSのアクセス統計情報を表示します。詳しくは<a href="access-statistics.md">アクセス統計</a>を参照してください。</td>
        </tr>
        <tr>
            <td><img src="../../images/newline.gif" alt="改行有無">改行有無</td>
            <td>RSSアイテムのタイトルを改行して表示するか、一行で表示できない部分を隠すかどうかを選択します。</td>
        </tr>
    </tbody>
</table>


[Gadget Menu Open]: ../../images/show_hidden_icons.gif
