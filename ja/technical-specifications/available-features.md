# 利用可能なFeature一覧

このページでは、ガジェットで利用可能なFeatureに関して解説します。

これらの機能を利用するためには、ガジェットXML内で **&lt;Require feature="dynamic-height"&gt;** のように指定してください。

<table>
    <thead>
        <tr>
            <th>feature属性値</th>
            <th>説明</th>
        </tr>
    </thead>
    <tbody>
	<tr>
    	<td nowrap>dynamic-height</td>
        <td>ガジェットが配置される領域について操作するための機能です。</td>
    </tr>
	<tr>
    	<td nowrap>flash</td>
        <td>ガジェットにFlashコンテンツを埋め込む機能です。</td>
    </tr>
	<tr>
    	<td nowrap>minimessage</td>
        <td>ガジェット内で通知メッセージなどのミニメッセージを扱えるようにするための機能です。</td>
    </tr>
	<tr>
    	<td nowrap>oauthpopup</td>
        <td>OAuthポップアップウィンドウを提供します。</td>
    </tr>
	<tr>
    	<td nowrap>opensocial-i18n</td>
        <td>JavaScriptやデータファイルの国際化機能です。</td>
    </tr>
	<tr>
    	<td nowrap>osapi</td>
        <td>JSONオブジェクトを用いたデータ通信の仕組みを提供します。</td>
    </tr>
	<tr>
    	<td nowrap>pubsub</td>
        <td>ガジェット間通信の仕組みを提供します。このFeatureはopensocial-spec v0.8の仕様です。</td>
    </tr>
	<tr>
    	<td nowrap>pubsub-2</td>
        <td>ガジェット間通信の仕組みを提供します。</td>
    </tr>
	<tr>
    	<td nowrap>rpc</td>
        <td>ガジェット−コンテナー間、およびガジェット−ガジェット間におけるリモートプロシージャーコールによる操作を提供します。</td>
    </tr>
	<tr>
    	<td nowrap>setprefs</td>
        <td>
        	ガジェットの設定を操作する機能です。<br>
            <strong>gadget.Prefs</strong> クラスを利用するために必要となります。
    	</td>
    </tr>
	<tr>
    	<td nowrap>settitle</td>
        <td>ガジェットのタイトルを設定する機能です。</td>
    </tr>
	<tr>
    	<td nowrap>skins</td>
        <td>現在表示されている画面情報を操作するための方法を提供します。</td>
    </tr>
	<tr>
    	<td nowrap>tabs</td>
        <td>
        	タブUIを実現するための機能です。<br>
            このFeatureは<strong>gadgets.TabSet</strong>クラスを含んでいます。
        </td>
    </tr>
	<tr>
    	<td nowrap>views</td>
        <td>ビューに関する処理を提供する機能です。</td>
    </tr>
    <tbody>
</table>

[JavaScript APIの制限事項][JavaScript API Limitation]


[JavaScript API Limitation]: javascript-api-limitation.md "JavaScript APIの制限事項"
