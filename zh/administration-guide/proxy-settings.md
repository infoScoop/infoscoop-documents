# 代理管理

在这里，关于InfoScoop OpenSource的Ajax代理机构的说明和Ajax代理的各种设定方法进行说明。

## 1 Ajax代理机构

被小工具表示的RSS和iCalend等的信息通过以下的方法取得。infoScoop OpenSource 服务器的Ajax代理机构(以下称Ajax代理)从Web浏览器处获得内容请求后，在后台的内容服务器处取得信息，之后加工要显示的数据后再返还给浏览器 (除了利用内框的功能)。

![Data Communication Path of Gadgets]

就是说，Ajax代理代替Web浏览器对于后台的内容服务器是作为HTTP客户端动作而运行的。
系统构成上有以下的考量。
从网上的服务器取得信息的时候，通常必须通过代理服务器对网上的对象进行访问(参考下图)。
例） 代理服务器被构成时候的通信线路图

![Communication Paths if Using a Proxy Server]

这种场合，必须经由代理服务器对Ajax代理进行通信设定。
另外，访问公司内的内容服务器的时候也是，在与表示infoScoop OpenSource客户端的网络是不同的网络中因配备了infoScoop OpenSource的服务器有时必须对每个进行设定。
比如, 有不能解决的从infoScoop OpenSource的服务器配备的网络段向内容服务器名称解析的问题(参照下图)。

![Communication Error]

即使这样的名字不能解决时候，也可以设定从主机名向IP地址变换。
这种功能在上述情况以外，在客户端和服务器端的通信通过逆向代理，服务器间的通信也可以利用直接通信来设定。
像这样，infoScoop OpenSource的Ajax代理机构以代理服务器的设定为代表，经由Ajax代理关于被送信的请求可以定义以下的处理。

1. 代理服务器的定义
2. 请求URL的置换
3. 送信HTTP头域定义
4. 服务器缓存设定

以上这些通过以正则表达式记述地址模式使灵活的设定成为可能。

## 2 管理界面

在管理界面的代理管理界面中进行代理设定。
界面由以下项目构成。
代理/URL置换设定

  * 地址模式
  * 代理服务器
   * 有效
   * 主机
   * 端口
   * 认证
  * 置换URL
  * 头送信
  * 缓存设定 
   * 有效
   * 期间(分)
  * 删除

### 2.1 设定的适用规则

Ajax代理适用是，对由接收到的请求的URL和各代理/URL置换设定中被设定的地址模式的正则表达式从上到下进行判断，选用第一个匹配的设定。
没有匹配的地址模式时，默认设定被使用。
默认设定中不做任何操作或者只进行代理服务器的设定。
另外，正规表现的格式遵循Java的格式。详细请阅览以下的URL。

    http://java.sun.com/j2se/1.5.0/ja/docs/ja/api/java/util/regex/Pattern.html

地址模式在点击表格时候会切换成编辑模式。
点击[Enter]键或其他的地方的话，变更会被确定。
地址模式最大可以输入512个字符。
可以通过拖放各行左侧的[替代]图标来更换设定的顺序。

### 2.2 设定的追加/删除

要追加设定单击[追加]图标。
单击各行右端的[删除]可以删除设定。

### 2.3 context菜单

关于代理管理画面右上的控制在以下说明。

<table>
    <thead>
        <tr>
            <th>图标</th><th>名称</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img src="../../images/refresh.gif"/></td>
            <td>再读</td>
            <td>表示上次变更的状态</td>
        </tr>
        <tr>
            <td><img src="../../images/apply_changes.gif"/></td>
            <td>适用变更</td>
            <td>
                点击的话，适用到现在的编辑操作(保存数据)。
                <br><strong>注意</strong> 最后不单击这个图标，编辑操作被废弃。
            </td>
        </tr>
    </tbody>
</table>

## 3 代理服务器设定

关于代理服务器的设定方法进行说明。
利用代理时候，在代理的项目里打上记号后。选择的话，代理服务器设定框变为有效。
点击设定框的主机·端口项目会切换到编辑模式。
以下关于代理服务器设定项目进行说明。

  * [有效]: 选择的话，代理服务器的设定的输入变为有效。
  * [主机]：指定代理主机或者IP地址。勾选[有効]一栏的时候必须指定。最大可以输入128文字。
  * [端口]：指定代理的端口号。勾选[有効]一栏的时候必须指定。端口输入0～65535数值。
  * [认证]：对代理服务器必须要认证的时候，需要输入认证信息。点击认证列的[编辑]图标的话，认证信息输入用的对话框被表示。以下的项目被表示。
    * 用户名：代理服务器认证时用的用户名
    * 密码：代理服务器认证时用的用户名
    * 认证服务器：有必要对ActiveDirectory认证时候，指定域控制的服务器名。

![Proxy Server Use Case]

## 4 置换URL设定

Ajax代理有把接收到的请求的URL转换成别的URL的功能。这个功能只要是对在逆向代理后台配置有infoScoop OpenSource的时候使用。

<table>
    <thead>
        <tr>
            <th>地址模式</th><th>置换URL</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>^http://hostA/(.*)</code></td>
            <td><code>http://172.22.115.234/$1</code></td>
        </tr>
    </tbody>
</table>

像上面的那样，指定地址模式中输入的URL相对应的置换URL。
点击置换URL的格，成为编辑模式。
和地址模式里的「()」匹配的字符串在置换URL可以使用。上表情况「`http://hostA/rss.xml`」被置换成「`http://172.22.115.234/rss.xml`」，从Ajax代理要求被送信。

![Substitution of the Request URL]

<a name="5_http_headers_transmission_settings"></a>
## 5 HTTP头域送信设定

Ajax代理可以设定相对于对象的URL把从浏览器接收的请求中所包含的HTTP头域全部包含于请求中，或是只限于指定的HTTP头域。
在单击头域发送列的编辑图标后被显示的画面中，进行HTTP头域发送设定。

### 5.1 发送全部的头域

Ajax代理把接收的请求头域全部包括于相对于后台的请求中。在HTTP头送信设定界面，把[送信全部的头]设为有效。

**注意** 外部网站一定要设定无效。有个人信息会有互联网泄漏的危险性。

### 5.2 只发被指定的请求的头域

默认的设定只发送已在INNA登记的头域（RFC4229）。
界面上，[选择送信头]有效，并且在INNA已登记的头域的复选框都有效。
一键登录的环境等的场合，有时必须要使用个人的头域进行送信的时候，请追加必要的头域。
以下的图是，选择个别设定，默认设定的情况。
如果不是在INNA已登记的头域，[is-user]不被发送至RSS的内容服务器。
对后端的RSS发信服务器[is-user]送信时候，有必要手动设定追加独自的域名。

![Custom Headers Transmission]

**注意** 关于Host、User-Agent、Content-Length，不管选择有无对应要求Ajax代理自动附加HTTP头域。

### 5.3 送信的Cookie的设定

关于Cookie 头域，可以在选择是否发送Cookie头域的设定之上，只发送所指定名称的Cookie。
对HTTP头发送设定画面的Cookie有以下的3个选择。

 * [发送全部的Cookie]：发送所有的Cookie头信息。
 * [不发送Cookie]：遮断Cookie 头的全部的信息。
 * [指定送信的Cookie]：只是被指定名字的Cookie送信到后端。

选择[指定送信的cookie]的时候要追加cookie名，在单选按钮下的文本框内输入cookie名后单击[追加]按钮。
选择[指定送信的cookie]，不追加1个cookie名如果单击了[设定]，保存时候和选择了[不送信Cookie]效果变得一样。
同时，如果[发送全部的头域]的选择有效，那么[发送全部的cookie]被选择。

<a name="proxy_manage_intranet"></a>
## 6 公司内（企业网）的设定

这是安全性的设定。把公司内（企业网）设为无效的时候，对于成为对象的网站采取以下的完全性对策。

  * 详细表示RSS的项目时，为了跨站脚本执行要把危险的代码除去（RSS阅读器,复合式RSS阅读器）
  * 不使用loginCredentialAuthType进行自动登录（RSS阅读器，截取迷你浏览器）

设为有效的时候，对于成为对象的网站不采取上述的安全性对策。
没有特殊情况的话，不推荐把此项目设为无效。

## 7 服务器缓存设定

在对外部的互联网连接时负载较重的环境中，为了维持性能可以设定共用的服务器缓存。
服务器缓存，每被指定了的地址模式的代理设定中，可以设定缓存的有效/无效和有效期限。
被指定了的地址模式中缓存设定为有效时，在所设定的有效期限的期间，每一个与地址模式匹配的URL中头域和正文主体的信息被保存于infoScoop服务器便于再利用。

**注意** 服务器缓存只对GET请求有効。

选择了「缓存设定」有效的话，期间(分)是10分钟。单击期间(分钟)的列的文本框的话，能编辑期间。
期间的最大值是1440(1日)。

## 8 必须设定

infoScoop OpenSource的菜单设定还有检索设定，休假设定等，几个设定是由URL指定。在初期设定，这些设定被设定为localhost。
所以，代理设定的地方，初期定义的地址模式[^http://localhost(:[0-9]*)?/.*]的行不要变更，而且，这个设定必须设定在先头。

## 9 注意事项

对默认设定设定代理服务器时候，经由Ajax代理访问公司内的所有的内容服务器的设定有必要作为直接访问追加。
不设定[代理设定]、[置换URL]的时候、是直接访问。


[Trash icon]: ../../images/trash.gif
[Data Communication Path of Gadgets]: images/proxy-management/proxy-settings-1.png
[Communication Paths if Using a Proxy Server]: images/proxy-management/proxy-settings-2.png
[Communication Error]: images/proxy-management/proxy-settings-3.png
[Proxy Server Use Case]: images/proxy-management/proxy-settings-4.png
[Substitution of the Request URL]: images/proxy-management/proxy-settings-5.png
[Custom Headers Transmission]: images/proxy-management/proxy-settings-6.png
