# 画面その他
ここでは、ユーザー画面に表示されるタイトルやヘッダなど画面の共通部分のカスタマイズ方法について説明します。

## 1 カスタマイズ箇所
画面共通部分のカスタマイズは、管理画面の［**レイアウト**］を選択し、サイドバーの［**画面その他**］で行います。  
本管理機能により本製品では、以下の内容をカスタマイズすることができます。

* タイトル
* カスタムテーマ  
  ポータル画面の色やスタイルを設定できます。
* コンテントフッター
* カスタムJavaScript  
  本製品に機能追加用のJavaScriptを指定する際に使用します。
* カスタムスタイルシート  
  本製品のデザインをカスタマイズする際にスタイルシートを指定します。

**注意** カスタムJavaScriptとカスタムスタイルシートの設定ついては、製品が正しく動作しなくなる可能性がありますので、変更は推奨しておりません。


## 2 画面説明

ここからは、管理画面の画面その他管理の操作方法について説明します。  
［**レイアウト**］を選択し、サイドバーの［**画面その他**］を選択すると、［**画面その他**］の管理画面が表示されます。  
サイドバーの右に表示される以下のリストから編集する対象をクリックで選択します。

* title
* customTheme
* contentFooter
* javascript
* css

選択するとリストの右側に設定されている内容が表示されますので、編集を行います。

［**画面その他**］管理画面の、右上のコントロールについては以下の表で説明します。
<table>
    <thead>
        <tr>
            <th>アイコン</th><th>名前</th><th>説明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img src="../../images/refresh.gif" alt="読み直しアイコン"></td>
            <td>読み直し</td>
            <td>前回変更を適用した状態を表示します。</td>
        </tr>
        <tr>
            <td><img src="../../images/apply_changes.gif" alt="変更を適用するアイコン"></td>
            <td>変更を適用する</td>
            <td>
                クリックすると今までに行った編集操作を適用（データを保存）します。<br>
                <strong>注意</strong> 最終的にこのアイコンをクリックしないと、編集操作は破棄されます。
            </td>
        </tr>
    </tbody>
</table>


## 3 設定例
ここでは、画面その他の編集で設定可能な項目について説明します。


### 3.1 タイトル（title）
タイトルを指定します。タイトルを設定すると本製品にログインした際、ブラウザの左上に表示されます。  
ログイン画面を使用している場合、タイトルの設定はログイン画面にも反映されます。


### 3.2 カスタムテーマ（customTheme）
カスタムテーマを設定します。ポータル画面の色やスタイルをinfoScoopの規定するフォーマットに則って部分的に設定できます。

管理画面の［**設定サンプル**］をクリックすると、「設定サンプル」ウィンドウが開きます。表示された設定サンプルの文字列をコピーし、設定編集フォームに貼り付けます。文字列は下記に説明する値でカスタマイズできます。
<table>
    <thead>
        <tr>
            <th>設定項目</th><th>説明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><strong>tabbar</strong></td>
            <td>タブバーのスタイルを指定します。</td>
        </tr>
        <tr>
            <td>&nbsp;fontColor</td>
            <td>タブの文字色をHTMLカラーコードで指定します。</td>
        </tr>
        <tr>
            <td>&nbsp;backgroundColor</td>
            <td>タブの背景色をHTMLカラーコードで指定します。</td>
        </tr>
        <tr>
            <td>&nbsp;backgroundGradiationTop</td>
            <td>タブの上部の背景にかけるグラデーションをHTMLカラーコードで指定します。</td>
        </tr>
        <tr>
            <td>&nbsp;backgroundGradiationBottom</td>
            <td>タブの下部の背景にかけるグラデーションをHTMLカラーコードで指定します。</td>
        </tr>
        <tr>
            <td>&nbsp;borderBottom</td>
            <td>タブバーのボトムの線の色をHTMLカラーコードで指定します。</td>
        </tr>
        <tr>
            <td>&nbsp;iconClass</td>
            <td>
                タブバーのアイコンのスタイルを指定します。指定できる値は以下の2種類です。
                <ul>
                    <li>white: アイコンの色を白にします。</li>
                    <li>gray: アイコンの色を灰色にします。</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>&nbsp;activetab</td>
            <td>選択中のタブのスタイルを指定します。</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;type</td>
            <td>
                選択中のタブのスタイルを指定します。
                <ul>
                    <li>fill: タブを長方形で表示します。activetab/backgroundColorがタブの背景色として適用されます。</li>
                    <li>border: タブの底辺にactivetab/backgroundColorで指定した色の線が表示されます。</li>
                </ul>
                なお、activetab/backgroundColorが指定されていない場合は、適用されません。
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;fontColor</td>
            <td>選択中のタブの文字色をHTMLカラーコードで指定します。</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;backgroundColor</td>
            <td>選択中のタブの背景色をHTMLカラーコードで指定します。typeが指定されていない場合は、適用されません。</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;fontWeight</td>
            <td>
                選択中のタブの文字の太さを指定します。指定できる値は以下の2種類です。
                <ul>
                    <li>normal</li>
                    <li>bold</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><strong>commandbar</strong></td>
            <td>コマンドバーのスタイルを指定します。</td>
        </tr>
        <tr>
            <td>&nbsp;searchFormButton</td>
            <td>検索フォームのボタンのスタイルを指定します。</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;backgroundColor</td>
            <td>ボタンの背景色をHTMLカラーコードで指定します。</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;backgroundGradationTop</td>
            <td>ボタンの上部の背景にかけるグラデーションをHTMLカラーコードで指定します。</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;backgroundGradationBottom</td>
            <td>ボタンの下部の背景にかけるグラデーションをHTMLカラーコードで指定します。</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;borderColor</td>
            <td>ボタンの線の色をHTMLカラーコードで指定します。</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;iconClass</td>
            <td>
                ボタンのアイコンのスタイルを指定します。指定できる値は以下の2種類です。
                <ul>
                    <li>white: アイコンの色を白にします。</li>
                    <li>gray: アイコンの色を灰色にします。</li>
                </ul>
            </td>
        </tr>
    </tbody>
</table>

backgroundColorおよびbackgroundGradationTopとbackgroundGradationBottomについて説明します。

* backgroundColorとグラデーションの設定（backgroundGradationTopとbackgroundGradationBottom）の両方に指定がある場合、グラデーションの設定が優先されます。
* グラデーションはbackgroundGradationTopとbackgroundGradationBottomの両方に指定が無いと適用されません。

以下に設定例を示します。

```
{
    "tabbar":{
        "fontColor":"#ffffff",
        "backgroundColor":"#0085be",
        "backgroundGradationTop":"#008bc7",
        "backgroundGradationBottom":"#0081b8",
        "borderBottom":"#0072a7",
        "iconClass":"white",
        "activetab": {
            "type":"fill",
            "fontColor":"#ffffff",
            "backgroundColor":"#0097d8",
            "fontWeight": "normal"
        }
    },
    "commandbar":{
        "searchFormButton":{
            "backgroundColor":"#bacf02",
            "backgroundGradationTop":"#c3d900",
            "backgroundGradationBottom":"#bbcf06",
            "borderColor":"#bacf02",
            "iconClass":"white"
        }
    }
}
```


### 3.3 コンテントフッター（contentFooter）
コンテントフッターのスタイルはXMLの一部を記述します。  
フォーマットは以下の通りです。

```
<icon><![CDATA[ ここにHTMLで記述 ]]></icon>
```

またicon要素には規定のアイコンを表示させることもできます。

```
<icon type="規定のアイコンのタイプ名"/>
```

規定のアイコンのタイプ名は以下の値が設定できます。
<table>
    <thead>
        <tr>
            <th>アイコンタイプ名</th><th>説明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>mail</td>
            <td>メール送信ボタンを表示します。</td>
        </tr>
        <tr>
            <td>message</td>
            <td>この記事についてメッセージを送信するボタンを表示します。</td>
        </tr>
    </tbody>
</table>

またアイコン要素は複数設定することができます。  
例えば、以下のように設定した場合、ポータル内フレームの下側と最大化RSSリーダーにフッターが表示されます。

```
<icon type="mail"></icon>
<icon type="message"></icon>
```

ポータル内フレームは、ポータル内フレームに本製品と同一ドメインに配置されているページを表示する場合に表示されます。  
また設定されたアイコンの他に開かれているページのURLが表示されます。  
最大化RSSリーダーではサマリー表示時にコンテントフッターが表示されます。  
アイコンが一つも設定されていない場合、フッターは表示されません。


### 3.4 JavaScript（javascript）
JavaScriptを直接記述します。  
記述したJavaScriptの関数は、ヘッダー、コマンドバーおよびコンテントフッターで利用できます。

**注意** JavaScriptに不正な記述をした場合、本製品が起動しなくなる恐れがあります。また、設定にしたJavaScriptの動作を保障することはできませんので、本設定内容については製品サポート対象外となります。


### 3.5 スタイルシート（css）
カスタムスタイルシートを直接記述します。

**注意** スタイルシートに不正な記述をした場合、本製品が起動しなくなる恐れがあります。また、設定にしたスタイルシートの動作を保障することはできませんので、本設定内容については製品サポート対象外となります。カスタマイズ可能なスタイルシートについては将来のバージョンで整理される予定です。
