# 小工具管理

在这里关于小工具的管理方法进行说明。


## 1 什么是小工具

所谓小工具，就是在infoScoop OpenSource画面上被配置的像窗口一样的面板，是用来构成用户界面的基本单位。


## 2 内置小工具 VS 小工具

在infoScoop OpenSource画面上被配置的零部件的单位，被称作 内置小工具 或 小工具。

infoScoop OpenSource，在管理上没有区别地处理 内置小工具 及 小工具,不过，严密来说 内置小工具 和 小工具的定义如下。


### 2.1 小工具

所谓 小工具 是指严密遵循旧版本的Google Gadget API的方法所做成的部件，是遵循OpenSocial API的方法被做所做成的部件。

**注意** 最新版本的infoScoop，只支持OpenSocial API其中的Gadget Core API。

小工具的使用是指登记在infoScoop OpenSource的作业库里然后直接使用或是也可以直接调用公司内外部的网络服务器上的小工具。

**注意** 小工具作为infoScoop被配备的服务器和同样域的内容被执行，如果利用公司外的小工具需要注意访问正当性。为了解决这个问题，需要在另外的域执行在infoScoop里没有被登记的小工具。关于那个方法请参照<a href="properties-settings.md#9_2_gadgetProxyURL">9.2 gadgetProxyURL</a>。


### 2.2 内置小工具

内置小工具 是只有在本产品infoScoop OpenSource上才可以使用的部件。
经常被利用的RSS阅读器和日程等的共同部件，作为被infoScoop OpenSource的服务器最佳化了的部件被提供。


## 3 与小工具配置地方对应的管理画面

小工具中，关于用户画面上的配置有以下几处设定。有着各自相对应的管理画面。

<table>
    <thead>
        <tr>
            <th>小工具配置地方</th><th>设定界面</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>顶部菜单</td>
            <td>
                菜单管理界面
            </td>
        </tr>
        <tr>
            <td>侧面菜单</td>
            <td>
                菜单管理界面
            </td>
        </tr>
        <tr>
            <td>命令栏</td>
            <td>
                初始画面管理界面[commandbar]标签
            </td>
        </tr>
        <tr>
            <td>固定领域</td>
            <td>
                初始画面管理界面[tab（标签号）]的固定领域设定
            </td>
        </tr>
        <tr>
            <td>个性化领域</td>
            <td>
                初始画面管理界面[tab（标签号）]的个性化领域 初始表示小工具设定
            </td>
        </tr>
    </tbody>
</table>


## 4 与用户设定的初始值适用

每个小工具都有用户设定值(UserPref)。[※1]

小工具，初期通过画面设定初期配置，这时被适用的用户设定的初始值，在管理画面被设定了的值被适用。

用户设定的初始值，可以从以下的项目设定。

* 小工具管理（管理界面）
* 菜单管理（管理界面）
* 用户设定(被拖放的小工具的设定界面)

用户设定的初始值，如果从菜单追加小工具的话，以下面的顺序被适用。

1. 小工具管理（管理界面）中被设定的值
1. 菜单管理（管理界面）中被设定的值
1. 用户设定（被拖放的小工具的设定界面）中被设定的值

总之，由于菜单管理变更了的值自默认被覆盖，在面板上追加小工具的话，小工具管理，菜单管理中所设定的UserPref会全部被复制。

以后也不可以通过管理员设定变更URL以外的UserPref。

小工具管理画面中的datatype「hidden」的UserPref的初始值不能编辑。[※2]
在菜单/初始画面管理的小工具设定画面中可以设定「hidden」类型的UserPref。

[※1] 小工具式样，模块的设定根据XML被记述，用户设定在/Module/UserPref要素里被记述。
[※2] UserPref要素的datatype属性被hidden设定的用户设定，作为用户不能编辑的项目为定义。


## 5 小工具管理画面

从管理画面选择[小工具]的话，小工具管理画面被表示。在小工具管理画面中，设定各小工具的共同设定及设定用户可以编辑的属性的默认值。
同时，在这个画面也可以进行小工具的追加和初始值的设定。


### 5.1 小工具设定

从内置小工具一览或小工具一览表，选择要变更设置的小工具后，所选项目翻转，在右侧设定可以的项目被表示。
内置小工具设定的编辑，内置小工具共同设定项目被表示。
小工具的场合，Module/ModulePrefs的属性值成为对象。[※3]
用户设定(初始值)的编辑能设定小工具的用户设定的初始值。
小工具属性值，Module/UserPref的default_value属性值成为对象。
如果变更了设定请单击[保存设定]按钮。
在按[保存设定]按钮之前，是不是选择其他的小工具单击[取消]按钮的话变更内容被废弃。

[※3]实际可以设定的ModulePrefs的属性只有「title」，「title_url」，「directory_title」，「height」，「singleton」。


### 5.2 链接追加/HTML追加

在infoScoop服务器上追加（上传）小工具的时候，需要指定XML形式的小工具设定文件，或小工具设定文件和小工具使用的资源绑定和CSS等的文件含有的ZIP形式的压缩文件。
ZIP形式的压缩文件的场合，在被解冻后的根目录下配置小工具设定文件。
小工具设定文件必须使用去除了扩展名后的ZIP文件的名字再加上XML扩展名的名字。
譬如，解冻的话，有以下一样的阶层的ZIP文件。

```
C:\Hello
    |_Hello.xml
    |_ALL_ALL.xml
    |_ja_ALL.xml
```

Hello.zip解冻的话，Hello.xml被作为小工具设定文件来处理。
上传的各文件，可以通过被分配到小工具文件的URL开始的相对路径来访问。被分配到小工具文件的URL以「__IS_GADGET_BASE_URL__」被表示。
上述的情况，ALL_ALL.xml在小工具设定文件中像以下一样地被记述。

```
<Locale messages="__IS_GADGET_BASE_URL__/ALL_ALL.xml"/>
```


#### 5.2.1 小工具的追加

如果在infoScoop里登记小工具的话，请点击小工具管理画面右面上的[追加小工具]。
之后，用以上传小工具的对话框被表示。
单击[浏览]按钮，请选择要上传的小工具文件。
选择文件，单击[上传]按钮的话小工具设定文件被infoScoop服务器上传，小工具则被追加到[小工具一览表]。


#### 5.2.2 小工具的更新

从小工具一览表选择了小工具后，在设定框里[小工具更新]按钮被表示。
单击[小工具更新]按钮的话，小工具要使用的资源一览表比如小工具上传框和小工具构成xml被表示。

* 小工具上传框
  从小工具上传框上传小工具设定文件或ZIP形式的小工具的时候，全部的内容被覆盖保存。

* 小工具资源
  在这个项目的操作方法如下。

    * 归结下载
      [归结下载]按钮，以ZIP形式下载现在被infoScoop服务器保存的小工具的内容。
    * 小工具资源的编辑
      单击小工具设定文件，和资源捆绑文件的[编辑]图标的话，编辑框在模态窗口被表示，在此可以直接编辑各个文件的内容。
      单击[保存设定]的话变更内容被保存。
      单击[取消]或者窗口外围放弃编辑内容关闭窗口。
      **注意** 可以编辑的只有 UTF-8编码文本文件。
    * 小工具资源的上传
      在本地编辑了的文件以一个文件单位上传时，单击[上传]按钮，小工具设定文件，用以上传小工具设定文件或资源文件的编辑框在模态窗口被表示。选择上载的文件，单击[上载]按钮的话，对象的文件被更新。
      单击[取消]或者窗口外围放弃编辑内容关闭窗口。
    * 小工具资源的删除
      单击[删除]图标可以删除小工具设定文件以外的小工具资源。
      单击[删除]图标的话，确认对话框被表示。
      要删除资源的时候，点击[OK]资源被删除。
      如果点击[CANCEL]的话，对话框被关闭，资源不被删除。
    * 小工具资源的追加
      对文件夹，单击[资源的追加]能追加新的资源。
      点击[资源的追加]菜单后，上传要追加的文件的编辑框在模态窗口被表示。
      点击[浏览]按钮，追加想追加的文件，按[上传]按钮后，资源被生成。
      单击[取消]或者窗口外围关闭窗口。


#### 5.2.3 小工具的删除

如果从小工具一览选择了小工具，在设定框上[删除小工具]按钮被表示。
单击[删除小工具]按钮的话，小工具被删除。


## 6 小工具设定说明

在这一节，关于本产品infoScoop OpenSource按照标准提供的内置小工具/小工具进行说明。


### 6.1 可以配置小工具的地方

有几个小工具配置地方有限制。
下面的表用来表示小工具可以配置的地方。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>菜单</th><th>命令栏</th><th>固定领域</th><th>个性化领域</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>日历</td><td>◯</td><td>×</td><td>◯</td><td>◯</td>
        </tr>
        <tr>
            <td>RSS阅读器</td><td>◯</td><td>×</td><td>◯</td><td>◯</td>
        </tr>
        <tr>
            <td>复合RSS阅读器</td><td>◯</td><td>×</td><td>×</td><td>◯</td>
        </tr>
        <tr>
            <td>迷你阅览器</td><td>◯</td><td>×</td><td>◯</td><td>◯</td>
        </tr>
        <tr>
            <td>截取迷你浏览器</td><td>◯</td><td>×</td><td>◯</td><td>◯</td>
        </tr>
        <tr>
            <td>信息</td><td>◯</td><td>×</td><td>◯</td><td>◯</td>
        </tr>
        <tr>
            <td>热门小工具</td><td>◯</td><td>×</td><td>◯</td><td>◯</td>
        </tr>
        <tr>
            <td>通知</td><td>×</td><td>×</td><td>◯</td><td>×</td>
        </tr>
        <tr>
            <td>带图像通知</td><td>×</td><td>×</td><td>◯</td><td>×</td>
        </tr>
        <tr>
            <td>热门搜索</td><td>×</td><td>◯</td><td>×</td><td>◯</td>
        </tr>
        <tr>
            <td>电光广告牌</td><td>×</td><td>◯</td><td>×</td><td>×</td>
        </tr>
        <tr>
            <td>小工具(URL指定)</td><td>◯<td>×</td><td>◯</td><td>◯</td>
        </tr>
    </tbody>
</table>

上述以外的内置小工具和小工具可以在命令栏以外的地方使用。
以下是各内置小工具/小工具的设定的说明。


### 6.2 日历

日历小工具读入被设定了的iCalendar文件，在按月份表示的日历上显示活动。
小工具设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>自动更新</td>
            <td>有效的时候自动更新</td>
        </tr>
        <tr>
            <td>iCalendar 设定</td>
            <td>
                设定在活动日历里(上)表示的iCalendar。<br>
                因为设定是JSON形式文本对于编辑需要注意。关于设定的内容请参照下面。
            </td>
        </tr>
    </tbody>
</table>

以下说明iCalendar设定方法。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <strong>iCals</strong>
            </td>
            <td>
                指定日历小工具上表示的日历。各个日历信息设定可以多数指定。
            </td>
        </tr>
        <tr>
            <td>数组</td>
            <td>包含日历设定的数组。</td>
        </tr>
        <tr>
            <td>
                <strong>MonthlyiCals<strong>
            </td>
            <td>
                指定为日历小工具被表示的日历信息。想取得只指定了的月的日历信息的情况使用。各日历信息的设定可以复数指定。
            </td>
        </tr>
        <tr>
            <td>数组</td>
            <td>包含日历设定的数组。</td>
        </tr>
        <tr>
            <td>
                <strong>日历设定</strong>
            </td>
            <td>包含日历信息。</td>
        </tr>
        <tr>
            <td>url</td>
            <td>
                指定日历信息被配置的地方。monthlyCals的子要素的场合，作为url的参数指定year和month。如果用活动日历变更了表示月的时候，所选的年，月被设定为参数。
            </td>
        </tr>
        <tr>
            <td>displayType</td>
            <td>
                指定在日历上的活动的表现方法。
                <ul>
                    <li>font： 如果活动存在，显示为由color属性所指定的日期的颜色。如果被复数的iCal要素的display属性字体指定时候，优先使用前一个被设定的定义。</li>
                    <li>block： 如果活动存在，在日期的下方显示由color属性所指定的颜色的小方块。</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>color</td>
            <td>指定表示事件的颜色。</td>
        </tr>
    </tbody>
</table>

下面是设定例。

__iCalender 设定例子__

```
{
    iCals : [
        { url : "http://weather.livedoor.com/forecast/ical/13/63.ics",
          displayType : "block",
          color : "#F99" },
        { url : "http://localhost:8080/infoscoop/holiday.xml",
          displayType : "font",
          color : "#F00"}
    ],
    monthlyiCals : [
        { url : "http://localhost:8080/infoscoop/js/widgets/calendar/ics/monthlyCalendar.jsp?year=${year}&month=${month}",
          displayType : "block",
          color : "#9F9"}
    ]
}
```

没有用户设定


### 6.3 RSS阅读器

这个设定，复合RSS阅读器内的RSS阅读器也能适用。
小工具设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>自动更新</td>
            <td>有效的时候，成为自动更新的对象。</td>
        </tr>
        <tr>
            <td>背景颜色</td>
            <td>设定背景颜色为缺省值。</td>
        </tr>
        <tr>
            <td>编辑标题</td>
            <td>指定小工具的标题可否编辑。</td>
        </tr>
        <tr>
            <td>日期表示形式</td>
            <td>
                指定RSS项的日期显示所用的格式。<br>
                关于设定可以的格式请参照<a href="#date-format">7.2 可以使用日期格式</a>。
            </td>
        </tr>
        <tr>
            <td>使用访问记录</td>
            <td>
                指定是否表示访问记录图标。<br>
                不管这个设定是否有效，访问历史记录被保存在数据库中(参照：<a href="properties-settings.md#6_1_accessLogEntry">accessLogEntry</a>)。
            </td>
        </tr>
    </tbody>
</table>

用户设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>RSS URL</td>
            <td>
                指定RSS阅读器里面表示的RSS/Atom的URL。<br>
                URL最大可以输入1024字节。<br>
                菜单管理以及初期画面管理的小工具设定对话框上，在RSS URL文本框的旁边[取得标题信息]按钮被表示。单击按钮后，从指定的网址取得RSS，自动设定标题和标题链接。
            </td>
        </tr>
        <tr>
            <td>换行</td>
            <td>
                指定RSS项的标题超出小工具的宽幅时是否换行表示。
            </td>
        </tr>
        <tr>
            <td>表示日期</td>
            <td>
                设定表示RSS项的日期和作者。
            </td>
        </tr>
        <tr>
            <td>表示项目数</td>
            <td>
                指定RSS项的表示件数。
            </td>
        </tr>
        <tr>
            <td>滚动模式</td>
            <td>
                指定滚动模式。
                <ul>
                    <li>滚动：表示滚动条。</li>
                    <li>没有滚动条：不表示滚动条。</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>详细表示模式</td>
            <td>
                指定RSS项的详细表示模式。
                <ul>
                    <li>内联：在内联(小工具内)显示详细信息。</li>
                    <li>弹出：在弹出窗口显示详细信息。</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>内容表示模式</td>
            <td>
                RSS项上所附加的链接的表示处。
                <ul>
                    <li>自动识别：根据属性displayInlineHost的设定站门内框架或新的窗口被适用。参照：<a href="#displayInlineHost">7.1 内容表示模式</a></li>
                    <li>门内框架：在站内框架表示链接目的地。</li>
                    <li>新窗口：在新窗口表示链接目的地。</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>以标题过滤</td>
            <td>
                用RSS项的标题来指定锁定条件。<br>
                只有符合指定的标题条件的RSS项被表示。<br>
                可以使用以下的记述。
                <ul>
                    <li>AND检索：「A B」（包含A和B）</li>
                    <li>OR检索： 「A OR B」（包含A或B）</li>
                    <li>NOT检索： 「-A」（不包含A）</li>
                    <li>
                        括弧优先条件： 「(A OR B) C」（包含A或B、并且包含C）<br>
                        使用例： (东京 OR 大阪) 新闻 -社会
                    </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>以作者过滤</td>
            <td>
                用RSS项的作者名来指定锁定条件。<br>
                只有以作者名指定的字符串开始的RSS项被表示。
            </td>
        </tr>
        <tr>
            <td>以类别过滤</td>
            <td>
                用RSS项的类别来指定锁定条件。<br>
                只有和ATOM的entry/category/@term属性或RSS的item/category要素指定的字符串完全一致时被表示。
            </td>
        </tr>
        <tr>
            <td>认证类型</td>
            <td>
                设定认证类型后，被设定为可以读取必须要验证的网站的RSS的的验证小工具。
                <ul>
                    <li>没有： 不进行认证设定。</li>
                    <li>basic： 取得RSS时需要基本认证的场合进行设定。</li>
                    <li>ntlm： 取得RSS时需要NTLM认证的场合进行设定。</li>
                    <li>
                        postCredential： 取得RSS时，发送小工具上设定的用户ID/密码。<br>
                        选择postCredential 的话，用来指定发送数据包含的用户ID/密码的参数名的文本框被表示。不指定参数名的时候，用户ID/密码的参数名是「is-user」/「is-passwd」。
                    </li>
                    <li>
                        postPortalCredential：取得RSS时，发送门户登录的用户ID。<br>
                        选择postPortalCredential的话，用来指定发送数据包含的用户ID的参数名的文本框被表示。不指定参数名的时候，用户ID的参数名是「is-user」。
                    </li>
                    <li>
                        sendPortalCredentialHeader：取得RSS时，发送域名登录用户ID 。<br>
                        选择sendPortalCredentailHeader的话，用来指定发送用户ID的头名的文本框被表示。不指定参数名的时候，被发送的用户ID的名是「is-user」。
                    </li>
                </ul>
                <strong>注意</strong> 通常的代理设定，不是已登记在INNA的域名(RFC4229)不被发送。需要参照指定了的头域变更代理设定。请参照<a href="proxy-settings.md#5_http_headers_transmission_settings">HTTP头域发送设定</a><br>
                Basic，ntlm或指定了postCredential的话，拖放小工具时候，认证信息登记表被表示。<br>
                参照：『小工具通讯的认证设定』
            </td>
        </tr>
    </tbody>
</table>


### 6.4 复合RSS阅读器

这个设定可以应用到复合RSS阅读器的按照时间顺序排序。
在菜单管理的复合RSS阅读器的设定是指复合RSS阅读器的子RSS阅读器的设定。
小工具的设定如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>自动更新</td>
            <td>有效的时候，成为自动更新的对象。</td>
        </tr>
        <tr>
            <td>背景颜色</td>
            <td>设定背景颜色为缺省值。</td>
        </tr>
        <tr>
            <td>编辑标题</td>
            <td>指定小工具的标题可否编辑。</td>
        </tr>
        <tr>
            <td>日期表示形式</td>
            <td>
                指定RSS项的日期显示所用的格式。<br>
                关于设定可以的格式请参照<a href="#date-format">7.2 可以使用日期格式</a>。
            </td>
        </tr>
        <tr>
            <td>使用访问记录</td>
            <td>
                指定是否表示访问记录图标。<br>
                不管这个设定是否有效，访问历史记录被保存在数据库中(参照:<a href="properties-settings.md#6_1_accessLogEntry">accessLogEntry</a>)。
            </td>
        </tr>
    </tbody>
</table>

用户设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>换行</td>
            <td>
                指定RSS项的标题超出小工具的宽幅时是否换行表示。
            </td>
        </tr>
        <tr>
            <td>表示日期</td>
            <td>
                设定表示RSS项的日期和作者。
            </td>
        </tr>
        <tr>
            <td>滚动模式</td>
            <td>
                指定滚动模式。
                <ul>
                    <li>滚动：表示滚动条。</li>
                    <li>没有滚动条：不表示滚动条。</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>详细表示模式</td>
            <td>
                指定RSS项的详细表示模式。
                <ul>
                    <li>内联：在内联(小工具内)显示详细信息。</li>
                    <li>弹出：在弹出窗口显示详细信息。</li>
                </uL
            </td>
        </tr>
        <tr>
            <td>内容表示模式</td>
            <td>
                RSS项上所附加的链接的表示处。
                <ul>
                    <li>自动识别：根据属性displayInlineHost的设定站门内框架或新的窗口被适用。参照：<a href="#displayInlineHost">7.1 内容表示模式</a></li>
                    <li>门内框架：在站内框架表示链接目的地。</li>
                    <li>新窗口：在新窗口表示链接目的地。</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>以标题过滤</td>
            <td>
                用RSS项的标题来指定锁定条件。<br>
                只有符合指定的标题条件的RSS项被表示。<br>
                可以使用以下的记述。
                <ul>
                    <li>AND检索：「A B」（包含A和B）</li>
                    <li>OR检索： 「A OR B」（包含A或B）</li>
                    <li>NOT检索： 「-A」（不包含A）</li>
                    <li>
                        括弧优先条件： 「(A OR B) C」（包含A或B、并且包含C）<br>
                        使用例： (东京 OR 大阪) 新闻 -社会
                    </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>以作者过滤(creatorFilter)</td>
            <td>
                用RSS项的作者名来指定锁定条件。<br>
                只有以作者名指定的字符串开始的RSS项被表示。<br>
                但是，这个设定只是时间顺序表示时候被使用。
            </td>
        </tr>
        <tr>
            <td>以类别过滤(categoryFilter)</td>
            <td>
                用RSS项的类别来指定锁定条件。<br>
                只有和ATOM的entry/category/@term属性或RSS的item/category要素指定的字符串完全一致时被表示。<br>
                但是，这个设定只是时间顺序表示时候被使用。
            </td>
        </tr>
    </tbody>
</table>


### 6.5 迷你浏览器

小工具设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>自动更新</td>
            <td>有效的时候，成为自动更新的对象。</td>
        </tr>
        <tr>
            <td>编辑标题</td>
            <td>指定小工具的标题可否编辑。</td>
        </tr>
    </tbody>
</table>

用户设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>网站网址URL</td>
            <td>
                指定网站网址的URL。<br>
                URL最大可以输入1024字节<br>
                在菜单管理和初期界面管理的小工具设定对话框上，如下Web网站URL文本框的旁边[获取标题信息]按钮被表示。点击[获取标题信息]按钮，从指定的网站取得标题，自动设定标题和标题链接。
            </td>
        </tr>
        <tr>
            <td>表示头连接</td>
            <td>
                页面里的链接内容的表示处。
                <ul>
                    <li>自动识别：根据属性displayInlineHost的设定站门内框架或新的窗口被适用。参照：<a href="#displayInlineHost">7.1 内容表示模式</a></li>
                    <li>门内框架：在站内框架表示链接目的地。</li>
                    <li>新窗口：在新窗口表示链接目的地。</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>高度</td>
            <td>设定迷你浏览器小工具的缺省的高度。单位px。</td>
        </tr>
    </tbody>
</table>


### 6.6 截取迷你浏览器

这个设定被适用在迷你浏览器中选择表示Web网站的一部分。
小工具设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>自动更新</td>
            <td>有效的时候，成为自动更新的对象。</td>
        </tr>
        <tr>
            <td>编辑标题</td>
            <td>指定小工具的标题可否编辑。</td>
        </tr>
    </tbody>
</table>

用户设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>网站网址URL</td>
            <td>
                指定网站网址的URL。<br>
                URL最大可以输入1024字节<br>
                在菜单管理和初期界面管理的小工具设定对话框上，如下Web网站URL文本框的旁边[获取标题信息]按钮被表示。点击[获取标题信息]按钮，从指定的网站取得标题，自动设定标题和标题链接。
            </td>
        </tr>
        <tr>
            <td>Xpath</td>
            <td>
                点击[选择切下的地方]按钮，用来选择表示处的框被显示，在[网站网址URL]指定的网站网址被读取。<br>
                框内移动鼠标的话，可选部分会表示外框，[现在选择中的XPath]文本框里外框被表示的HTML要素的路径被表示。<br>
                右击后，[切下选择要素]对话框被表示，点击后现在被选择的路径被设定到[Xpath]文本框上。
            </td>
        </tr>
        <tr>
            <td>内容表示模式</td>
            <td>
                页面里的链接内容的表示处处。
                <ul>
                    <li>门内框架：在站内框架表示链接目的地。</li>
                    <li>新窗口：在新窗口表示链接目的地。</li>
                    <li>自动识别：由URL自动判别。</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>高度</td>
            <td>
                设定截取迷你浏览器小工具的缺省高度(px)。<br>
                指定[auto], 截取页信息的高度，小工具自动变成适当的高度。
            </td>
        </tr>
        <tr>
            <td>编码</td>
            <td>
                指定Web网站的编码。<br>
                不指定的时候，网页的编码自动被检出。<br>
                在自动检出HTML必要的主数据没被记述或者和实际的编码不符合时候，会发生乱码。<br>
                不被正确表示时候，通过手动设定能够回避问题。<br>
                指定编码名为IANA字符集注册表(<a href="http://www.iana.org/assignments/character-sets/character-sets.xhtml">IANA Character Set Registry</a>)请参照<br>
                校验过的编码有「UTF-8」「Shift_JIS」「EUC-JP」。
            </td>
        </tr>
        <tr>
            <td>使用缓存</td>
            <td>
                设定为有效的时候，截取的一部分的页面将被缓存于服务器一定的时间。另外[缓存有效期间]文本框为输入可能状态。
            </td>
        </tr>
        <tr>
            <td>缓存有效期间（分钟）</td>
            <td>
                以分钟单位指定截取页面缓冲时候缓存有效期间。<br>
                缺省为360分钟(6小时)。
            </td>
        </tr>
        <tr>
            <td>认证类型</td>
            <td>
                [选择表示网站的一部分]有效的情况，如果对象的网站要求认证，需要作为认证小工具设定。
                <ul>
                    <li>没有： 不进行认证设定。</li>
                    <li>basic： 取得RSS时需要基本认证的场合进行设定。</li>
                    <li>ntlm： 取得RSS时需要NTLM认证的场合进设定。</li>
                    <li>
                        postCredential： 取得RSS时，发送小工具上设定的用户ID/密码。<br>
                        选择postCredential 的话，用来指定发送数据包含的用户ID/密码的参数名的文本框被表示。不指定参数名的时候，用户ID/密码的参数名是「is-user」/「is-passwd」。
                    </li>
                    <li>
                        postPortalCredential：取得RSS时，发送门户登录的用户ID。<br>
                        选择postPortalCredential的话，用来指定发送数据包含的用户ID的参数名的文本框被表示。不指定参数名的时候，用户ID的参数名是「is-user」。
                    </li>
                    <li>
                        sendPortalCredentialHeader：取得RSS时，发送域名送信登录用户ID 。<br>
                        选择sendPortalCredentailHeader的话，指定发送用户ID的域名的文本框被表示。不指定参数名的时候，被发送的用户ID的名是「is-user」。
                    </li>
                </ul>
                <strong>注意</strong> 通常的代理设定，不是已登记在INNA的域名(RFC4229)不被发送。需要参照指定了的头域变更代理设定。请参照<a href="proxy-settings.md#5_http_headers_transmission_settings">HTTP头域发送设定</a>
                Basic，ntlm或指定了postCredential的话，拖放小工具时候，认证信息登记表被表示。
            </td>
        </tr>
    </tbody>
</table>


### 6.7 信息

是为了给其他的用户发送异步信息的小工具。
小工具设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>用户搜索框的设定</td>
            <td>
                设定使用用户搜索服务。<br>
                在记事通信时搜索地址的时候使用。<br>
                设定方法如下。<br>
                在infoScoop OpenSource安装时指定已设定的用户搜索服务。<br>
                对照infoScoop OpenSource安装时设定的用户检索服务，修正以下的粗体斜体字的地方。
                <pre><code>
[
    {module:"<strong><i>MSD_IDS</i></strong>", name:"用户"}
]
                </code></pre>
                module指定以下的值
                <ul>
                    <li>MSD_IDS: 用户检索服务和MSD2005-S 用户表联合时指定「MSD_IDS」。</li>
                    <li>LDAP: 用户检索服务和LDAP联合时指定「LDAP」。</li>
                </ul>
                用户搜索的条件中，名字，邮件，所属这3个为固定。邮件和所属可以省略。
                如果省略邮件要追加「mailOmit:true」。
                如果省略所属要追加「belongOmit:true」。
                以下是邮件和所属都省略的检索形式的例子。
                <pre><code>
[
    {
        module:"<strong><i>MSD_IDS</i></strong>",
        name:"用户",
        mailOmit:<strong><i>true</i></strong>,
        belongOrg:<strong><i>true</i></strong>
    }
]
                </code></pre>
            </td>
        </tr>
        <tr>
            <td>通知只能管理员使用</td>
            <td>
                有效的话，对所有的用户的通知的消息的功能只有管理员可以利用。
            </td>
        </tr>
    </tbody>
</table>


### 6.8 人気ガジェット

人気が高いガジェット一覧を表示するガジェットです。

ガジェット设定项目は以下の通りです。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>自动更新</td>
            <td>有效的话，成为自动更新对象。</td>
        </tr>
        <tr>
            <td>表示条数</td>
            <td>指定一览里表示的条数。</td>
        </tr>
        <tr>
            <td>缓存有效期间（分）</td>
            <td>指定执行小工具排名的时间。</td>
        </tr>
    </tbody>
</table>


### 6.9 通知/带图像通知

通知和带图像通知是简易的RSS阅读器。
带图像通知是对RSS项的creator要素表示XML转义符了的HTML的src标记指定的作成者的图像。
小工具设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>自动更新</td>
            <td>有效的时候，成为自动更新的对象。</td>
        </tr>
        <tr>
            <td>背景颜色</td>
            <td>设定背景颜色为缺省值。</td>
        </tr>
        <tr>
            <td>日期表示形式</td>
            <td>
                指定RSS项的日期显示所用的格式。<br>
                关于可以设定的格式请参照<a href="#date-format">7.2 可以使用日期格式</a>。
            </td>
        </tr>
        <tr>
            <td>使用访问统计</td>
            <td>
                指定是否表示访问统计图标。<br>
                不管这个设定是否有效，访问历史记录被保存在数据库中(参照：<a href="properties-settings.md#6_1_accessLogEntry">6.1 accessLogEntry</a>)。
            </td>
        </tr>
    </tbody>
</table>

用户设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>RSS URL</td>
            <td>
                指定RSS feed的URL。<br>
                URL最大可以输入1024字节。<br>
                单击[获取标题信息]按钮的话，从指定了的URL的RSS feed取得标题和网站的链接，为菜单链接的[标题]和[标题链接]设定。
            </td>
        </tr>
        <tr>
            <td>认证类型</td>
            <td>
                设定认证类型的话，认证会被作为必要的网站的RSS可能读取的认证小工具设定。
                <ul>
                    <li>没有： 不进行认证设定。</li>
                    <li>basic： 取得RSS时需要基本认证的时候进行设定。</li>
                    <li>ntlm： 取得RSS时需要NTLM认证的场合进设定。</li>
                    <li>
                        postCredential： 取得RSS时，发送小工具上设定的用户ID/密码。<br>
                        选择postCredential 的话，用来指定发送数据包含的用户ID/密码的参数名的文本框被表示。不指定参数名的时候，用户ID/密码的参数名是「is-user」/「is-passwd」。
                    </li>
                    <li>
                        postPortalCredential： 取得RSS时，发送门户登录的用户ID。<br>
                        选择postPortalCredential的话，用来指定发送数据包含的用户ID的参数名的文本框被表示。不指定参数名的时候，用户ID的参数名是「is-user」。
                    </li>
                    <li>
                        sendPortalCredentialHeader：取得RSS时，发送域名登录用户ID 。<br>
                        选择sendPortalCredentailHeader的话，用来指定发送用户ID的用来的文本框被表示。不指定参数名的时候，被发送的用户ID的用来是「is-user」。
                    </li>
                </ul>
                <strong>注意</strong> 通常的代理设定，不是已登记在INNA的域名(RFC4229)不被发送。需要参照指定了的头域变更代理设定。请参照<a href="proxy-settings.md#5_http_headers_transmission_settings">5 HTTP头域发送设定</a>
                Basic，ntlm或指定了postCredential的话，拖放小工具时候，认证信息登记表被表示。
            </td>
        </tr>
    </tbody>
</table>


### 6.10 热门搜索

热门搜索是命令栏专用的小工具。


### 6.11 电子广告牌

电子广告牌是只有在再命令栏才可以利用的小工具。
小工具的设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>背景颜色</td>
            <td>设定背景颜色的默认。</td>
        </tr>
        <tr>
            <td>日期表示形式</td>
            <td>指定RSS项的日期表示用的格式。</td>
        </tr>
    </tbody>
</table>

用户设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>表示日期</td>
            <td>滚动信息里包含日期。</td>
        </tr>
        <tr>
            <td>表示标题</td>
            <td>滚动信息里包含标题。</td>
        </tr>
        <tr>
            <td>表示详细</td>
            <td>滚动信息里包含详细。</td>
        </tr>
        <tr>
            <td>表示速度</td>
            <td>设定消息滚动速度。</td>
        </tr>
        <tr>
            <td>重试间隔</td>
            <td>设定没有数据的时候进行过再取得的间隔时间。</td>
        </tr>
    </tbody>
</table>


### 6.12 警报

小工具设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>标题</td>
            <td>指定小工具的标题。</td>
        </tr>
        <tr>
            <td>高度</td>
            <td>
                指定小工具的高度。因为警报的高度是自动被调整，所以高度的设定不被反映。
            </td>
        </tr>
    </tbody>
</table>

用户设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>标题</td>
            <td>设定警报的标题。</td>
        </tr>
        <tr>
            <td>通知方法</td>
            <td>
                设定警报的方法。
                <ul>
                    <li>警报：到了设定的时间，警报自动弹出。</li>
                    <li>摇浏览器：到了设定的时间，表示infoscoop 的浏览器会晃动。</li>
                    <li>什么也不做：小工具变成只是表示完成的通知内容。</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>年月日(例:yyyy年M月d日)</td>
            <td>指定警报的日期。</td>
        </tr>
        <tr>
            <td>时</td>
            <td>指定警报的时间。</td>
        </tr>
        <tr>
            <td>分</td>
            <td>指定警报的分钟。</td>
        </tr>
    </tbody>
</table>


### 6.13 TODO列表

小工具设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>标题</td>
            <td>指定小工具的标题。</td>
        </tr>
        <tr>
            <td>编辑标题</td>
            <td>指定是否可以编辑小工具的标题。</td>
        </tr>
        <tr>
            <td>高度</td>
            <td>
                指定小工具的高度。TODO列表因为自动地高度被调整，高度的设定不被反映。
            </td>
        </tr>
    </tbody>
</table>

用户设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>字体大小</td>
            <td>
                指定TODO列表上表示的文字大小。
                <ul>
                    <li>标准: 以标准的大小文字被表示。</li>
                    <li>大：比一般大的文字被表示。</li>
                </ul>
            </td>
        </tr>
    </tbody>
</table>


### 6.14 便签

小工具设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>标题</td>
            <td>指定小工具的标题。</td>
        </tr>
        <tr>
            <td>编辑标题</td>
            <td>指定是否可以编辑小工具的标题。</td>
        </tr>
        <tr>
            <td>高度</td>
            <td>
                指定签条的高度。签条纸因为自动地高度被调整，高度的设定不被反映。
            </td>
        </tr>
    </tbody>
</table>

用户设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>字体大小</td>
            <td>以px为单位设定默认字体大小。</td>
        </tr>
        <tr>
            <td>背景颜色</td>
            <td>设定默认的背景色。</td>
        </tr>
        <tr>
            <td>文字颜色</td>
            <td>设定文字色的默认。</td>
        </tr>
    </tbody>
</table>


### 6.15 计算器

从小工具一览上选择[计算器]。
小工具设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>标题</td>
            <td>指定小工具的标题。</td>
        </tr>
    </tbody>
</table>


### 6.16 世界时钟

从小工具一览上选择[世界时钟]。
小工具设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>标题</td>
            <td>指定小工具的标题。</td>
        </tr>
        <tr>
            <td>内容点击时候的链接处</td>
            <td>
                指定点击内容时的链接目标。指定空的时候，不被做成链接。
            </td>
        </tr>
    </tbody>
</table>


### 6.17 博客的零部件

从小工具一览上选择[博客的零部件]。
小工具设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>标题</td>
            <td>指定小工具的标题。</td>
        </tr>
    </tbody>
</table>

用户设定项目如下。

<table>
    <thead>
        <tr>
            <th>设定项目</th><th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>内容表示模式</td>
            <td>
                博客的零部件内的链接带的表示处。
                <ul>
                    <li>门户内框：门户内框表示链接目标。</li>
                    <li>新窗口：在别的窗口表示链接目标。</li>
                    <li>自动判别：根据URL自动判别。</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>高度</td>
            <td>
                设定博客部件的默认的高度(px)。<br>
                指定比0大的正的整数以外的时候，根据博客的内容的高度，机件自动地变成适当的高度。
            </td>
        </tr>
    </tbody>
</table>


## 7 補足

<a name="displayInlineHost"></a>
### 7.1 内容表示模式

<a name="date-format"></a>
### 7.2 可以使用日期格式

