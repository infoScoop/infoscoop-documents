# 属性管理

关于infoScoop OpenSource的各种系统属性的说明和设定属性的属性管理画面进行说明。

## 1 属性管理界面

在属性管理界面，能够变更系统的属性。
从InfoScoopOSS 管理界面的菜单上选择[属性]的话，属性管理界面被表示。
属性管理界面的控制功能如下。

<table>
    <thead>
        <tr>
            <th>图标</th><th>名称</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img src="../../images/display_all_properties.gif"></td>
            <td>表示全部的属性</td>
            <td>
                表示在初期状态控制非表示的程序的内部的动作以及因现在版本不支持而隐藏的属性。<br>
                变更隐藏的属性时候，请咨询担当技术人员和本公司Web支持。
            </td>
        </tr>
        <tr>
            <td><img src="../../images/refresh.gif"></td>
            <td>再读</td>
            <td>表示适用上回的状态。</td>
        </tr>
        <tr>
            <td><img src="../../images/apply_changes.gif"></td>
            <td>适用变更</td>
            <td>变更的适应（保存数据）。<br/>
            <b>注意</b> 最终不点击这个图标的话，编辑操作被废弃。
            </td>
        </tr>
     </tbody>
</table>

## 2 菜单关联属性

关于菜单设定属性如下。
关于「siteAggregationMenuURL」和「sideMenuURL」请参照[菜单的选择][Menu Settings]。

### 2.1 displayTopMenu

设定顶部菜单的表示/非表示。

    表示顶部菜单。
    不表示顶部菜单。
    默认值：表示。

### 2.2 displaySideMenu

侧面菜单的表示/非表示，以及设定与顶部菜单是否为一样的构成。

    表示侧面菜单。 
    不表示：不表示侧面菜单。
    和顶部菜单同样结构：以顶部菜单的构成表示侧面菜单。 
    默认值：表示。

### 2.3 menuAutoRefresh

设定菜单的自动更新是否有效。这个设定的对象是顶部菜单和侧面菜单。

    有效（打勾）： 菜单成为自动更新的对象。
    无效（不打勾）：菜单成为对象外。
    默认值：无效。

### 2.4 menuLockTimeout

在菜单管理界面中，菜单树为编辑中的状态且不做任何操作经过一段时间后，编辑锁会被自动解除。menuLockTimeout用来设定这个的间隔。

    以分钟为单位指定数值。 
    默认值：30

### 2.5 sideMenuTabs

侧面菜单的标签的表示/非表示的设定。
标签的识别子以列表的方式指定。各标签的识别子如下。

    sidemenu：表示[侧面菜单]的标签。 
    addContent：表示[内容追加]标签。 
    mySiteMap：表示[我的网站地图]标签。

**注意** 这个属性的变更属于支持对象外。不保障升级时的兼容性 。

## 3 关于Ajax要求属性

infoScoop以被称为Ajax请求的通信方式来进行各种设定和数据的读取。
详细请参照[代理管理][Proxy Settings]。
关于Ajax要求属性如下。

### 3.1 ajaxRequestTimeout

Ajax要求的最大等待时间。

    以毫秒单位指定数值。 
    默认值：15000

根据这个设定，经由本产品的Ajax代理取得信息时候，应答时间超过15秒的内容不被表示。

**注意** 本属性，为了有必要和应用服务器调谐，如果有需要15秒以上时变更，请到本公司Web支持询问。

### 3.2 ajaxRequestRetryCount

Ajax超时时的再试行回数。
Ajax要求ajaxRequestTimeout属性设定的时间内完成不了的话，请求将被添加在队列的最后。
ajaxRequestRetryCount以选择的次数重复做上面的操作。

    0次到2次指定可能。 
    默认值：2(次)

### 3.3 refreshInterval

各个小工具的自动更新的间隔。关于自动更新的详细请参照『14.2自动更新的式样』。

    以分钟单位指定数值。 
    默认值：10(分)

### 3.4 widgetRefreshInterval

小工具间的自动更新间隔。设定自动更新的1回转内的小工具更新间隔。
关于详细请参照<a href="../user-guide/auto-update.md#updateDurationInTurn">在一轮内的小工具的更新间隔</a>。

    单位以秒指定数值。
    默认值：20(秒)

**注意** 本属性，为了有必要和应用服务器调谐，如果有需要15秒以上时变更，请到本公司Web支持询问。

### 3.5 subWidgetRefreshInterval

复合RSS阅读器内的RSS阅读器的自动更新间隔。
关于详细，请参照『复合RSS阅读器内的RSS间隔』。

    单位以毫秒指定数值。
    默认值：500(毫秒)

**注意** 本属性，为了有必要和应用服务器调谐，如果有需要15秒以上时变更，请到本公司Web支持询问。

## 4 关于使用RSS小工具属性

使用通知和RSS阅读器等的RSS的小工具的属性如下。

### 4.1 rssPageSize

是RSS阅读器的自动读取页功能，一次读取项的件数。

    指定数值。
    默认值：25(条)

### 4.2 rssMaxCount

表示能够表示的RSS的最大数。

    指定数值。 
    默认值：25(条)

指定负数时会取得全部件数。

### 4.3 freshDays

在通知/带图像通知/RSS阅读器/复合阅读器里，新到图标被表示的时间。

    以天为单位指定数值。 
    默认值：1(天)

## 5 关于用户自定义属性

关于用户自定义属性如下。

### 5.1 maxTabs

指定用户可能追加标签的最大数。

    指定数值。 
    默认值:50

### 5.2 maxColumnNum

指定个性化领域的最大列数。不能变更的属性。

    指定数值。
    默认值:10

**注意** 这个属性的变更属于支持的对象以外，不保障升级时的兼容性。

### 5.3 commandQueueWait

指定用户的自定义信息保存间隔。

    以秒为单位指定数值。 
    默认值：30(秒)

保存自定义信息的要求，因为infoScoop独自的Session检查机构也被利用，用户不变更界面的时候也用commandQueueWait上设定间隔被送信。
自定义信息在浏览器关闭时候或者移动到其他的网站时候被保存。

## 6 关于用户操作日志的属性

本产品有把搜索和链接点击等特定的用户操作时的记录保存到数据库的功能。
这个信息在热门小工具以及访问统计被利用。

<a name="6_1_accessLogEntry"></a>
### 6.1 accessLogEntry

指定是否保存通知以及RSS阅读器等，使用RSS小工具的访问日志。

    有效（打勾）：保存数据。
    无效（不打勾）：不保存数据。 
    默认值：有效

### 6.2 keywordEntry

指定搜索关键词排名数据是否被保存。

    有效（打勾）：保存数据。 
    无效（不打勾）：不保存数据。 
    默认值：有效

### 6.3 logCommandQueueWait

指定对本产品服务器送搜索关键词/访问日志间隔。

    以秒为单位指定数值。 
    默认值：3600(秒)

检索key word/访问日志在浏览器关闭时候或者移动到其他的网站时候被保存。

### 6.4 logStoragePeriod

指定访问日志的保存期限。到保存期间的日志自动地从数据库中被删除。

    以天为单位指定数值。 
    默认值：365(天)

指定0以下的整数的时候，日志的保存无限期。

## 7 关于门户网站内框的属性

关于门户内框属性如下。

### 7.1 displayInlineHost

点击菜单和小工具内的各个链接时候，那个链接设定(菜单链接表示目的设定，小工具内容表示模式)被设定为自动判别时，指定在内框中表示的主机名（参照：『内容表示模式』）。

    默认值：无设定
    設定例）
    hostname:80
    hostname:8080
    192.168.11.23

即使主机相同端口不同的时候也被判定为不同的设定。
想在内框中表示所有的链接时，在第一个设定中请指定「*」。

## 8 关于登录以及Session的属性

### 8.1 loginStateKeepPeriod

在本产品的标准登录界面有保存登录状态的功能。loginStateKeepPeriod指定登录状态被保存的期限。

    以天为单位指定数值 
    默认值：7(天)

指定0以下的整数时候，保存登录状态功能无效。

### 8.2 loginCredentialAuthType

以本产品的标准登录界面中输入的登录信息作为在认证小工具中要使用的验证消息来自动登录时，指定被适用的认证类型。

    basic：基本认证 
    ntlm：NTLM认证 
    postCredential：认证信息POST 
    不选择：不登录认证信息

输入上述以外的值时候，作为不正确的认证类型，认证小工具不正常运行。
运用中变更本设定时候，下回用户登录时新设定的认证类型的认证信息作为新的系统认证信息被登录。这时，旧的认证信息降为通常的认证信息，没有被设定的小工具的话，自动被删除。

## 9 关于系统构成的属性

变更系统构成时候，必须设定的项目如下。

### 9.1 staticContentURL

用URL指定infoScoop OpenSource的静的文件存放的位置。
一般为了提高性能，WEB服务器里配置静文件的复制，指定它的URL。特别IE因为不能缓存CSS内的图像，以及javascript生成了的img标记的图像，也配合mod_expires的设定利用。
静态内容，归结在解冻了存档的目录infoscoop/staticContent。staticContent目录配置在Apache的恰当的位置，然后进行mod_expires模块的设定。
以下展示了httpd.conf的设定例子。

    
    LoadModule expires_module modules/mod_expires.so
    
    Alias /is_web "/var/www/infoscoop/staticContent"  
    <Location /is_web >  
      <IfModule mod_expires.c>  
        ExpiresActive On  
        ExpiresByType image/jpg "access plus 1 month"  
        ExpiresByType image/jpeg "access plus 1 month"  
        ExpiresByType image/gif "access plus 1 month"  
        ExpiresByType image/png "access plus 1 month"  
      </IfModule>  
    </Location>

上述的设定，在/var/www/infoscoop/staticContent里复制staticContent，对is_web设定alias，缓存的有效期设为1个月。

    默认值：.(Context 的相对路径)

<a name="9_2_gadgetProxyURL"></a>
### 9.2 gadgetProxyURL

infoScoop上表示的小工具的内容是通过infoScoop的Ajax代理被表示。总之，因为小工具和infoScoop作为同一个域名的内容被表示所以会发生交叉域名脚本的问题。
以下的图，表示在Web浏览器上外部的小工具是可以对 infoScoop实体，或其他的小工具的JavaScript对象进行访问的。

![Invalid Access of Gadgets]

为了解决交叉域问题，需要在另外(区别)域实行在本产品上被表示的全部的小工具,不过，通常准备那样的基础设施是很难的事。
infoScoop为了可以在别的域名中执行外部的小工具（由指定URL来访问的小工具）和infoScoop以及上传至infoScoop的小工具而准备了属性。

![Run Gadgets in Other Domain]

gadgetProxyURL指定处理这个小工具的proxy的URL。

    默认值：./gadgetsrv

在别的域名可以访问的infoScoop的context上附加「．/gadgetsrv」来指定这个URL。
譬如，如果在象以下一样的域准备了本产品的context:
infoScoop的URL： `http://infoscoop/infoscoop/`
小工具代理用的URL： `http://gadgetproxy/infoscoop/`
对gadgetProxyURL指定「`http://gadgetproxy/infoscoop/gadgetsrv`」。

**注意** gadget.pubsub以及gadget.rpc的功能不是交叉脚本问题的对象。

### 9.3 messagePriority

设定在消息控制台里表示消息的级别。
指定下面数值中的一个。

    1:调试 
    2:信息 
    3:警告 
    4:错误 
    默认值：1

譬如，如果指定了3的时候，只有警告以上的消息在消息中央控制台里被表示。
如果输入了1～4以外的价值，缺省值被适用。

### 9.4 searchEngineURL

指定为了取得外部的搜索引擎设定文件的URL。
如果『搜索站点管理』的步骤中把检索设定设为有效的时候，请指定为空。

    以天为单位指定数值。
    默认值：1(天)

**注意** 这个属性的变更属于支持对象外。不保障升级时的兼容性。


[Menu Settings]: menu-settings.md
[Proxy Settings]: proxy-settings.md
[Auto Update]: ../user-guide/auto-update.md
[Search Form Administration]: search-form-administration.md
[Invalid Access of Gadgets]: images/properties-manager/properties-settings-1.png
[Run Gadgets in Other Domain]: images/properties-manager/properties-settings-2.png
