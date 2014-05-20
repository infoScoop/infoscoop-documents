# RSSリーダー

RSSリーダーのコントロールとその操作について説明します。

![RSSリーダー][RSS Reader Gadget]

<table>
    <thead>
        <tr>
            <th>番号</th><th>名前</th><th>説明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>(1)</td>
            <td>タイトル</td>
            <td>
                <p>
                    ガジェットのタイトルです。<br>
                    リンクが張られている場合、クリックすると当該サイトのコンテンツを表示します。
                </p>
            </td>
        </tr>
        <tr>
            <td>(2)</td>
            <td>アイコン</td>
            <td>
                <p>
                    RSSリーダーの各機能を実行するコントロール。<br>
                    各アイコンの説明は以下の表を参照。
                </p>
            </td>
        </tr>
        <tr>
            <td>(3)</td>
            <td>RSSアイテムタイトル</td>
            <td>
                <p>
                    RSSアイテムのタイトル。<br>
                    リンクをクリックすると当該サイトのコンテンツを表示します。
                </p>
            </td>
        <tr>
        <tr>
            <td>(4)</td>
            <td>新着アイコン</td>
            <td>
                <p>
                    1営業日(デフォルト)以内に更新されたRSSアイテムに付けられます。<br>
                    最後にinfoScoopを閉じてから1営業日以上経っている場合は、前回の終了時刻以降に更新されたRSSアイテムに新着アイコンが付けられます。
                </p>
            </td>
        </tr>
        <tr>
            <td>(5)</td>
            <td>更新日時/作者名</td>
            <td>
                <p>
                    RSSアイテムの更新日時および作成者(作成者を含む場合のみ表示)
                </p>
            </td>
        </tr>
        <tr>
            <td>(6)</td>
            <td>詳細</td>
            <td>
                <p>
                    詳細リンクをクリックするとRSSアイテムの詳細(コンテンツの要約)を表示します。<br>
                    <img src="images/widget/rss-reader-gadget-2.png" alt="RSSアイテムの詳細"><br>
                    [閉じる&#60;&#60;]リンクをクリックすると詳細を閉じます。
                </p>
            </td>
        </tr>
    </tbody>
</table>


## ヘッダアイコンの説明

<table>
    <thead>
        <tr>
            <th>アイコン</th><th>名前</th><th>説明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img src="../../images/refresh.gif" alt="更新アイコン"></td>
            <td>更新</td>
            <td>
                <p>
                    RSSを再読み込みします。<br>
                    <b>注意</b> 各RSSリーダーは通常、サーバーで設定された間隔で自動的に更新が行われます。<br>
                    前回の表示以降に更新されたRSSアイテムに付けられる新着アイコンは回転し情報が新しい事を知らせます。
                </p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/minimize.gif" alt="最小化アイコン"></td>
            <td>最小化/新着件数表示</td>
            <td>
                <p>
                    ガジェットを最小化します。「最小化」アイコンは「元に戻す」アイコンに替わります。<br>
                    最小化すると太陽アイコンが表示され、新着RSSアイテムの件数が表示されます。<br>
                    RSSアイテムの件数は、新着件数/総件数の順で表示されます。<br>
                    <img src="images/widget/rss-reader-gadget-3.png" alt="RSSリーダーの最小化">
                </p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/sun.gif" alt="新着表示アイコン"></td>
            <td>新着をすべて表示</td>
            <td>
                <p>
                    ガジェット最小化時に<img src="../../images/sun.gif" alt="新着表示アイコン">アイコンをクリックすると、1営業日(デフォルト)以内に更新されたRSSアイテムをすべて表示します。<br>
                    新着アイコンを表示する期間は<a href="global-settings.md" title="全体設定">全体設定</a>により変更可能です。
                </p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/restore.gif" alt="元に戻すアイコン">
            <td>元に戻す</td>
            <td>
                <p>
                    最小化されているガジェットを元に戻します。
                </p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/maximize.gif" alt="最大化アイコン"></td>
            <td>最大化</td>
            <td>
                <p>
                    ガジェットを最大化します。最大化されたRSSリーダーの説明は次節を参照してください。
                </p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/show_hidden_icons.gif" alt="ガジェットメニュー表示アイコン"></td>
            <td>メニューを開く</td>
            <td>
                <p>
                    ガジェットのメニューを開きます。
                </p>
            </td>
        </tr>
    </tbody>
</table>


## メニューの説明

メニューを開くアイコン![ガジェットメニュー表示アイコン][Gadget Menu icon]をクリックすると、ガジェットのメニューが開きます。

![ガジェットメニューの表示][Show Gadget menu]

<table>
    <thead>
        <tr>
            <th>アイコン</th><th>名前</th><th>説明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img src="../../images/edit.gif" alt="設定アイコン"></td>
            <td>設定</td>
            <td>
                <p>
                    クリックするとガジェット設定が表示されます。<br>
                    <img src="images/widget/rss-reader-gadget-5.jpg" alt="RSSリーダーガジェットの設定項目"><br>
                    <ul>
                        <li>ガジェットタイトル: 任意のガジェットタイトルを挿入します。</li>
                        <li>改行する: RSSアイテムのタイトルを改行して表示するか、一行で表示できない部分を隠すかどうかを選択します。</li>
                        <li>日付を表示する: 更新日時の表示/非表示を切り替えます。</li>
                        <li>記事表示件数: プルダウンでRSSアイテムの表示件数を選択できます。</li>
                        <li>スクロールモード:
                            <ul>
                                <li>スクロール: スクロール機能を有効にします。</li>
                                <li>スクロールなし: スクロール機能を無効にします。</li>
                            </ul>
                        </li>
                        <li>詳細表示モード: 詳細の表示方法を設定します。
                            <ul>
                                <li>インライン: RSSリーダー内の選択したアイテムの下に詳細を表示します。</li>
                                <li>ポップアップ: 詳細を詳細表示用のポップアップウィンドウに表示します。</li>
                            </ul>
                        </li>
                        <li>コンテンツ表示モード: RSSアイテムのリンクをクリックしたターゲットを設定します。
                            <ul>
                                <li>ポータル内フレーム: ポータル内フレームにリンク先を表示します。</li>
                                <li>新しいウィンドウ: 新しいウィンドウにリンク先を表示します。</li>
                                <li>自動判別: 上記のどちらかについて、システム設定が適用されます。</li>
                            </ul>
                        </li>
                        <li>
                            タイトルで絞り込み: タイトルが指定した条件に合致するRSSアイテムのみが表示されます。<br>
                            以下の記述が使用できます。
                                <ul>
                                    <li>AND検索: 「A AND B」(AおよびBを含む)</li>
                                    <li>OR検索: 「A OR B」(AまたはBを含む)</li>
                                    <li>NOT検索: 「-A」(Aを含まない)</li>
                                </ul>
                            使用例: (東京 OR 大阪) ニュース -社会
                        </li>
                        <li>作者で絞り込み: 作者名が指定した文字列で始まるRSSアイテムのみが表示されます。</li>
                        <li>カテゴリで絞り込み: カテゴリが指定した文字列と完全一致するRSSアイテムのみが表示されます。</li>
                        <li><img src="../../images/rss.gif" alt="RSSアイコン">アイコン: RSSのソースを表示します。RSSのURLを取得するときなどに使用して下さい。</li>
                    </ul>
                    [CANCEL]: 設定を保存せずにガジェット設定を閉じます。<br>
                    [OK]: 設定を保存しガジェット設定を閉じます。
                </p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/up_arrow.gif" alt="表示件数減アイコン"></td>
            <td>表示件数を減らす</td>
            <td>
                <p>表示するRSSアイテムの件数を1件減らします。</p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/down_arrow.gif" alt="表示件数増アイコン"></td>
            <td>表示件数を増やす</td>
            <td>
                <p>表示するRSSアイテムの件数を1件増やします。</p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/access.gif" alt="アクセス統計アイコン"></td>
            <td>アクセス統計</td>
            <td>
                <p>RSSのアクセス統計情報を表示します。詳しくは<a href="access-statistics.md" title="アクセス統計">アクセス統計</a>を参照してください。</p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/search.gif" alt="検索アイコン"></td>
            <td>検索</td>
            <td>
                <p>
                    検索ボックスにキーワードを入力して、実行ボタンをクリック、またはEnterキーを押すことでサイト内検索を行います。<br>
                    サイト内検索は、システム設定により有効になっている場合のみ利用できます。
                </p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/clock.gif" alt="詳細日時表示アイコン"></td>
            <td>詳細日時表示/非表示</td>
            <td>
                <p>更新日時の表示/非表示を切り替えます。</p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/newline.gif" alt="改行有無アイコン"></td>
            <td>改行有無</td>
            <td>
                <p>RSSアイテムのタイトルを改行して表示するか、一行で表示できない部分を隠すかどうかを選択します。</p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/trash.gif" alt="削除アイコン"></td>
            <td>削除</td>
            <td>
                <p>パーソナライズエリアからガジェットが削除されます。</p>
            </td>
        </tr>
    </tbody>
</table>


<a name="maximize"></a>
## RSSリーダーの最大化

ガジェットヘッダの最大化アイコンをクリックすると、最大化されたRSSガジェットを表示します。

![拡大化RSSリーダー][Maximizing RSS Reader Gadget]

<table>
    <thead>
        <tr>
            <th>番号</th><th>名前</th><th>説明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>(1)</td>
            <td>RSSアイテムリスト</td>
            <td>
                <p>RSSのリンクをクリックすると詳細が表示されます。</p>
            </td>
        </tr>
        <tr>
            <td>(2)</td>
            <td>絞り込み設定</td>
            <td>
                <p>
                    <ul>
                        <li>タイトル: タイトルで絞り込んで表示(中間一致、演算子「or」、「not」、「and」を使用可能)</li>
                        <li>作者: 作者名で絞り込んで表示(先頭一致)</li>
                        <li>日付: 期間別に絞り込んで表示</li>
                        <li>カテゴリ: カテゴリで絞り込んで表示(完全一致)</li>
                    </ul>
                </p>
            </td>
        </tr>
        <tr>
            <td>(3)</td>
            <td>アイコン</td>
            <td>
                <p>
                    最大化されたRSSリーダーの機能を実行するコントロール。<br>
                    各アイコンの説明は以下の表を参照。
                </p>
            </td>
        </tr>
        <tr>
            <td>(4)</td>
            <td>RSSアイテム詳細/コンテンツ表示領域</td>
            <td>
                <p>RSSの内容を表示します。サマリー表示モード時にはRSSのサマリー情報を、全文表示モード時にはRSSアイテムのリンク先のコンテンツを表示します。</p>
            </td>
        </tr>
        <tr>
            <td>(5)</td>
            <td>幅変更領域</td>
            <td>
                <p>この領域をドラッグ&ドロップすることでRSSアイテムリストの幅を変更することが出来ます。</p>
            </td>
        </tr>
        <tr>
            <td>(6)</td>
            <td>メール送信</td>
            <td>
                <p>現在、表示しているRSSアイテムのタイトルをメールでお知らせするための機能。ご利用のメールクライアントが起動します。</p>
            </td>
        </tr>
        <tr>
            <td>(7)</td>
            <td>メッセージを送る</td>
            <td>
                <p>指定したアカウントのメッセージガジェットに記事のお知らせを送信する機能です。</p>
            </td>
        </tr>
    </tbody>
</table>


## 最大化時のヘッダアイコンの説明

<table>
    <thead>
        <tr>
            <th>アイコン</th><th>名前</th><th>説明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img src="../../images/html_valid.png"/></td>
            <td>全文表示</td>
            <td>右側の詳細表示パネルをコンテンツ全体をインナーフレームに表示するモードに切り替えます。</td>
        </tr>
        <tr>
            <td><img src="../../images/html_gray.png"/></td>
            <td>サマリー表示</td>
            <td>右側の詳細表示パネルをRSSのサマリー情報を表示するモードに切り替えます。</td>
        </tr>
        <tr>
            <td><img src="../../images/clock.gif"/></td>
            <td>詳細日時表示/非表示</td>
            <td>更新日時の表示/非表示を切り替えます。</td>
        </tr>
        <tr>
            <td><img src="../../images/refresh.gif"/></td>
            <td>更新</td>
            <td>RSSを再読み込みします。</td>
        </tr>
        <tr>
            <td><img src="../../images/help.png"/></td>
            <td>ヘルプ</td>
            <td>ヘルプウィンドウを表示します。</td>
        </tr>
        <tr>
            <td><img src="../../images/restore.gif"/></td>
            <td>元に戻す</td>
            <td>最大化されているガジェットを元に戻します。</td>
        </tr>
    </tbody>
</table>


## 最大化時の詳細表示

RSSリーダーを最大化した場合のコンテンツの詳細表示は、2つのパターンが用意されています。

1. サマリー表示![サマリー表示アイコン][Summary display icon]の時にRSSアイテムをクリック  
   インナーフレーム内に選択したRSSアイテムのサマリー情報が表示されます。  
   ![サマリー表示の画面][Summary display]

1. 全文表示![全文表示アイコン][Full display icon]の時にRSSアイテムをクリック  
   インナーフレーム内に選択したRSSアイテムのコンテンツが表示されます。  
   ![全文表示の画面][Full display]


## キーボードによる操作

RSSリーダーは以下のようなキーにより、キーボードから操作することが可能です。

<table>
    <thead>
        <tr>
            <th>キー</th><th>説明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>↓↑</td>
            <td>文書間を移動</td>
        </tr>
        <tr>
            <td>→←</td>
            <td>サマリー表示/全文表示の切り替え(<img src="../../images/html_gray.png"/>/<img src="../../images/html_valid.png"/>と同様)</td>
        </tr>
        <tr>
            <td>ENTER</td>
            <td>選択した文書のサマリー表示または全文表示</td>
        </tr>
        <tr>
            <td>SHIFT+M</td>
            <td>メール送信</td>
        </tr>
        <tr>
            <td>R</td>
            <td>更新(<img src="../../images/refresh.gif"/>と同様)</td>
        </tr>
        <tr>
            <td>Q</td>
            <td>元に戻る(最大化解除)(<img src="../../images/restore.gif"/>と同様)</td>
        </tr>
        <tr>
            <td>T</td>
            <td>詳細日時表示/非表示(<img src="../../images/clock.gif"/>と同様)</td>
        </tr>
        <tr>
            <td>M</td>
            <td>サマリー表示/全文表示の切り替え(<img src="../../images/html_gray.png"/>/<img src="../../images/html_valid.png"/>と同様)</td>
        </tr>
        <tr>
            <td>H</td>
            <td>ヘルプの表示(<img src="../../images/help.png"/>と同様)</td>
        </tr>
    </tbody>
</table>


[RSS Reader Gadget]: images/widget/rss-reader-gadget-1.png "RSSリーダー"
[Show Gadget menu]: images/widget/rss-reader-gadget-4.png "ガジェットメニューの表示"
[Maximizing RSS Reader Gadget]: images/widget/rss-reader-gadget-6.png "拡大化RSSリーダー"
[Summary display]: images/widget/rss-reader-gadget-7.png "サマリー表示の画面"
[Full display]: images/widget/rss-reader-gadget-8.png "全文表示の画面"
[Full display icon]: ../../images/html_valid.png "全文表示アイコン"
[Gadget Menu icon]: ../../images/show_hidden_icons.gif "ガジェットメニュー表示アイコン"
[Summary display icon]: ../../images/html_gray.png "サマリー表示アイコン"
