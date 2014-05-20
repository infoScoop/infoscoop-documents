# Web应用程序模块的自定义

infoScoop OpenSource 的服务器模块作为 J2EE Web应用服务器上运行的Web应用程序被提供。
这里，下载的压缩里面包含的infoscoop.war部署到Web应用服务器上前，包含和根据环境设定的Web应用程序模块的再创建手续进行一下说明。


## 1 WAR文件再创建工具

infoScoop OpenSource 在 Web 应用服务器上部署前的准备，连接源数据库的设定，应用程序的日志设定等，系统设定的初期设定部署用的WAR文件创建用的工具。

工具remakewar.bat(sh)被包含在解冻压缩文件目录的/infoscoop里面。
remakewar.bat(sh)执行时需要Apache Ant。在作业环境中如果没有导入Apache Ant的话，事前请安装Apache Ant。关于Apache Ant安装请参照[Apache Ant的文档][Apache Ant Document]。

**注意** 实用工具的设定文件(build.properties以及principalHeaderList.json)的各个设定的指定值有以下的限制。

* build.properties文件和principalHeaderList.json，不能使用XML的保留字符(「」、「’」、「”」、「&」)。如有必要XML必须被转义。
* build.properties文件对「¥」，「$」为禁止文字。「$」用「$$」转义的话可以利用。
* principalHeaderList.json对「¥」为禁止文字。

同时，因为本产品的补丁版本用WAR文件发布，本章的方法，在补丁被上传时候也可实行。实用程序的各设定文件(build.properties，principalHeaderList.json及Customization目录内的文件)因为在补丁上传时候是必要的，所以需要预先安全保存好。


## 2 变更数据库设定

保存各用户画面表示状态等的数据存储器的设定。

1. 用记事本等的文本编辑器打开/infoScoop/build.properties。
1. 请结合利用的环境编辑以下的黑体的地方。

   <pre><code>
   dataSource.jndiName=<strong>jdbc/infoscoop</strong>
   dataSource.schema=<strong>iscoop</strong>
   </code></pre>

   设定内容如下。

   <table>
       <caption>build.properties设定项目</caption>
       <thead>
           <tr>
               <th>属性名</th><th>说明</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td colspan="2">
                   <strong>dataSource.jndiName</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>JNDI数据源名</td>
           </tr>
           <tr>
               <td>缺省值</td>
               <td>jdbc/infoscoop</td>
           </tr>
           <tr>
               <td>详细</td>
               <td>
                   这个属性如果对对Web应用服务器设定了的数据源的JNDI名为默认的「jdbc/infoscoop」，不需要变更。
               </td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>dataSource.schema</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>作业库数据库的schema名</td>
           </tr>
           <tr>
               <td>缺省值</td>
               <td>iscoop</td>
           </tr>
           <tr>
               <td>详细</td>
               <td>
                   需要如果数据库访问本产品作业库用的表的用户名和为不同的名字的schema定义了，指定为设定文件schema名。
默认的情况，不需要变更。<br>
                   <strong>注意</strong> 如果使用MySQL，schema的设定对天空设定与数据库名是不是同样。
               </td>
           </tr>
       </tbody>
   </table>

<!-- This sentence is not written by Markdown. Because it is not reflected on the GitHub. -->
<ol start="3">
    <li>/infoscoop/build.properties重写保存。</li>
</ol>

<a name="without_sso"></a>
## 3 认证设定1　不利用认证设定1 SSO环境

没有SSO环境的情况，利用infoScoop OpenSource准备的默认的登录画面。
如果有SSO环境，请到下节 <a href="#set_sso_filter">4 认证设定2 与SSO产品联合</a>。


### 3.1 有效由于默认的登录画面的认证

以下的次序有效由于默认的登录画面的认证。这个设定成为默认的设定。

1. 用记事本等的文本编辑器打开/infoscoop/build.properties。

1. 以下__粗体的__部分 结合利用的环境编辑。

   _build.properties(摘录)_

   <pre><code>
   sessionCreateConfig.loginAuthentication=<strong>true</strong>
   </code></pre>

   设定内容如下。

   <table>
       <thead>
           <tr>
               <th>属性名</th><th>说明</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td colspan="2">
                   <strong>sessionCreateConfig.loginAuthentication</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>使用不使用缺省的登录界面的认证</td>
           </tr>
           <tr>
               <td>缺省值</td>
               <td>true</td>
           </tr>
           <tr>
               <td>详细</td>
               <td>
                   选择下面的一个<br>
                   true: 使用缺省的登录界面登录。<br>
                   false: 不使用缺省的登录界面登录。使用SSO环境时候设定false。
               </td>
           </tr>
       </tbody>
   </table>

1. 覆盖/infoscoop/build.properties保存。


### 3.2 设定简易用户表的认证

为本产品的作业库数据库里面准备了认证用的简易性的用户表。
在默认的设定，简易用户表的认证有效。


### 3.3 设定目录服务器的认证

设定目录服务器(ActiveDirectory或LDAP)的用户认证，进行以下的设定。

1. 用记事本等的文本编辑器打开/infoscoop/build.properties。

1. 请取消以下行的注释(删除行的先头的「# 」)。

   build.properties(摘录)

   ```
   accountAccessConfig=sample/ldap.xml
   ```

   设定内容如下。


   <table>
       <caption>build.properties设定项目</caption>
       <thead>
           <tr>
               <th>属性名</th><th>说明</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td colspan="2">
                   <strong>searchUidServiceConfig</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>用户检索服务设定文件</td>
           </tr>
           <tr>
               <td>详细</td>
               <td>
                   设定用户检索服务设定文件的路径。<br>
                   利用LDAP时候的样本设定文件是sample/ldap.xml。
               </td>
           </tr>
       </tbody>
   </table>

1. 覆盖保存/infoScoop/build.properties。

1. 用记事本等文本编辑器打开/infoscoop/sample/ldap.xml。

1. 以下__粗体的__部分结合利用的环境编辑。

   _目录服务器设定_

   <pre><code>
   &#60;?xml version="1.0" encoding="UTF-8"?&#62;
   &#60;!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN"
           "http://www.springframework.org/dtd/spring-beans.dtd"&#62;
   &#60;beans&#62;
       &#60;bean id="LDAPAccountManager" singleton="true"
               class="org.infoscoop.account.ldap.LDAPAccountManager"&#62;
           &#60;constructor-arg&#62;
               &#60;value&#62;<strong>ldap://localhost:389</strong>&#60;/value&#62;
           &#60;/constructor-arg&#62;&#60;constructor-arg&#62;
               &#60;value&#62;<strong>CN=Administrator,CN=Users,DC=infoscoop,DC=org</strong>&#60;/value&#62;
           &#60;/constructor-arg&#62;&#60;constructor-arg&#62;
               &#60;value&#62;<strong>secret</strong>&#60;/value&#62;
           &#60;/constructor-arg&#62;&#60;constructor-arg&#62;
               &#60;value&#62;<strong>CN=Users,DC=infoscoop,DC=org</strong>&#60;/value&#62;
           &#60;/constructor-arg&#62;&#60;constructor-arg&#62;
               &#60;value&#62;<strong>OU=MyOffice,DC=infoscoop,DC=org</strong>&#60;/value&#62;
           &#60;/constructor-arg&#62;
           &#60;property name="userSearchAttr"&#62;
               &#60;map&#62;
                   &#60;entry key="user_id"&#62;&#60;value&#62;<strong>sAMAccountName</strong>&#60;/value&#62;&#60;/entry&#62;
                   &#60;entry key="user_name"&#62;&#60;value&#62;cn&#60;/value&#62;&#60;/entry&#62;
                   &#60;entry key="user_email"&#62;&#60;value&#62;mail&#60;/value&#62;&#60;/entry&#62;
               &#60;/map&#62;
           &#60;/property&#62;
           &#60;property name="groupSearchAttr"&#62;
               &#60;map&#62;
                   &#60;entry key="org_name"&#62;&#60;value&#62;cn&#60;/value&#62;&#60;/entry&#62;
                   &#60;entry key="org_member"&#62;&#60;value&#62;member&#60;/value&#62;&#60;/entry&#62;
               &#60;/map&#62;
           &#60;/property&#62;
       &#60;/bean&#62;
       &#60;bean id="searchUserService" singleton="false"
               class="org.infoscoop.account.SearchUserService"&#62;
           &#60;property name="accountManager"&#62;
               &#60;ref bean="LDAPAccountManager"/&#62;
           &#60;/property&#62;
       &#60;/bean&#62;
       &#60;bean id="authenticationService" singleton="false"
               class="org.infoscoop.account.AuthenticationService"&#62;
           &#60;property name="accountManager"&#62;
               &#60;ref bean="LDAPAccountManager"/&#62;
           &#60;/property&#62;
       &#60;/bean&#62;
   &#60;/beans&#62;
   </code></pre>

   设定内容如下。

   <table>
       <caption>目录服务器设定项目</caption>
       <thead>
           <tr>
               <th>属性名</th><th>说明</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td colspan="2">
                   <strong>constructor-arg 1</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>LDAP服务器的URL</td>
           </tr>
           <tr>
               <td>缺省值</td>
               <td>ldap://localhost:389</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>constructor-arg 2</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>LDAP服务器的访问用户的识别名</td>
           </tr>
           <tr>
               <td>缺省值</td>
               <td>CN=Administrator,CN=Users,DC=beaconit,DC=domain</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>constructor-arg 3</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>LDAP服务器的访问用户的密码</td>
           </tr>
           <tr>
               <td>缺省值</td>
               <td>Secret</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>constructor-arg 4</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>用户检索的基准的识别名</td>
           </tr>
           <tr>
               <td>缺省值</td>
               <td>CN=Users,DC=beaconit,DC=domain</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>constructor-arg 5</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>组织检索基准的识别名</td>
           </tr>
           <tr>
               <td>缺省值</td>
               <td>OU=MyOffice,DC=beaconit,DC=domain</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>userSearchAttr属性user_id</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>表示用户ID的属性名</td>
           </tr>
           <tr>
               <td>缺省值</td>
               <td>sAMAccountName(ActiveDirectory的缺省用户的ID)</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>userSearchAttr属性user_name</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>表示用户名的属性名。用户名的用户检索对象。</td>
           </tr>
           <tr>
               <td>缺省值</td>
               <td>cn(ActiveDirectory的缺省用户名属性)</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>userSearchAttr属性user_mail</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>表示用户邮件地址属性名。 Email的用户检索对象。</td>
           </tr>
           <tr>
               <td>缺省值</td>
               <td>mail(ActiveDirectory的缺省用户的邮件属性)</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>groupSearchAttr属性org_name</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>用户所属组的名称。成为根据用户名的用户检索对象。</td>
           </tr>
           <tr>
               <td>缺省值</td>
               <td>cn(ActiveDirectory的缺省组名属性)</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>groupSearchAttr属性org_member</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>参照所属组的用户属性。</td>
           </tr>
           <tr>
               <td>缺省值</td>
               <td>member(ActiveDirectory的缺省所属用户属性)</td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>userNameAttr</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>作为表示用的用户名使用的属性名。检索对象属性和表示属性不同时候设定。</td>
           </tr>
           <tr>
               <td>缺省值</td>
               <td>没有</td>
           </tr>
       </tbody>
   </table>

1. 覆盖保存/infoscoop/sample/ldap.xml。


<a name="set_sso_filter"></a>
## 4 认证设定2 与SSO产品联合

为了用户认证与导入完毕的一键登录(以下SSO)产品联合，做以下设定。
如果做了前节 <a href="#without_sso">3 认证设定1　不利用认证设定1 SSO环境</a>的话，没有必要做这节的设定。

通常、SSO製品は連携用のモジュールをサーブレットフィルタとして提供しています。以下の設定を行うことで、SSO用のサーブレットフィルタをinfoScoop OpenSourceに適用することができます。

1. 用记事本等文本编辑器打开/infoscoop/build.properties。

1. 以下__粗体的__部分 结合要联合的SSO产品环境编辑。

   <pre><code>
   sessionCreateConfig.loginAuthentication=<strong>false</strong>
   customizeSSOFilterClass=<strong>CustomizeSSOFilter</strong>
   sessionCreateConfig.uidHeader=<strong>UID</strong>
   sessionCreateConfig.usernameHeader=<strong>LOGINUSER_NAME</strong>
   </code></pre>

   设定内容如下。

   <table>
       <caption>build.properties设定项目</caption>
       <thead>
           <tr>
               <th>属性名</th><th>说明</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td colspan="2">
                   <strong>sessionCreateConfig.loginAuthentication</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>是不是使用缺省的登录用户界面认证。</td>
           </tr>
           <tr>
               <td>缺省值</td>
               <td>true</td>
           </tr>
           <tr>
               <td>详细</td>
               <td>
                   选择以下的一个。<br>
                   true: 使用缺省的登录界面认证。<br>
                   false: 不使用缺省的登录界面认证。利用SSO环境时候，设定false。
               </td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>customizeSSOFilterClass</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>SSO产品提供的Servlet过滤器的类名。</td>
           </tr>
           <tr>
               <td>详细</td>
               <td>
                   结合要联合SSO产品设定。<br>
                   关于详细，请参照利用的SSO产品的用户手册。<br>
                   一般，用反代理型的构成联合时候，没必要这个设定。
               </td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>sessionCreateConfig.uidHeader</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>从SSO产品被送信的包含用户ID信息的HTTP头名。</td>
           </tr>
           <tr>
               <td>详细</td>
               <td>
                   结合本产品和SSO产品进行设定。<br>
                   关于详细请参照利用的SSO产品的使用手册。
               </td>
           </tr>
           <tr>
               <td colspan="2">
                   <strong>sessionCreateConfig.usernameHeader</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>从SSO产品被送信的包含用户ID信息的HTTP头名。</td>
           </tr>
           <tr>
               <td>详细</td>
               <td>
                   结合本产品和SSO产品进行设定。<br>
                   关于详细请参照利用的SSO产品的使用手册。
               </td>
           </tr>
       </tbody>
   </table>

1. build.properties覆盖保存。

1. 配置SSO产品提供的Servlet过滤器类。
    * Servlet过滤器类以jar文件形式被提供时请配置到/infoscoop/Customization/WEB-INF/lib
    * Servlet过滤器类以class文件形式被提供时请和包阶层一起配置到/infoscoop/Customization/WEB-INF/classes文件夹

**注意** 需要如果用手记的说明以外的方法与SSO产品进行联合，请对用户论坛质询。

<a name="http-header"></a>
## 5 HTTP头作为所属信息定义

infoScoop OpenSouce有根据用户的角色(所属信息)切换菜单，初期转换画面的构成的功能。
这个功能可以对HTTP头传来的信息作为角色信息利用。角色设定根据联合的一键登录产品和用户认证机构进行。
同时，如果追加从目录服务器直接用户所属信息和HTTP头匹的组件时，作为Servlet过滤器实现，也可以设定。

关于遵从角色(所属信息)，切换初期转换表示画面的构成的功能的详细请参照[管理指南][Administration Guide]。

1. 用记事本等文本编辑器打开/infoscoop/principalHeaderList.json。

1. 根据利用的环境编辑以下的例子。

   ```
   [
       {
           type: "UserGroupPrincipal",
           displayName: "用户组",
           headerName: "ROLE_USER_GROUP"
       }
   ]
   ```

   principalHeaderList.json是JSON格式的文件。
   下面是一个设定，这些条目作为数组指定。

   ```
   {type:"OrganizationPrincipal",displayName:"组织",headerName:"ORGANIZATION"}

   ```

   各个条目的数组像以下一样"["，"]"中用逗号区分指定。

   ```
   [ {条目1},{条目2},{条目3}]
   ```

   下面关于各个设定项目进行说明。

   <table>
       <caption>principalHeaderList.json设定</caption>
       <thead>
           <tr>
               <th>属性名</th><th>说明</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td>type</td>
               <td>
                   角色的主体者的识别子。设定为唯一。<br>
                   「UIDPrincipal」由于本产品被预约。<br>
                   type能使用的文字只半角拉丁字母。<br>
                   为各条目指定了的type请不要重复设定。
               </td>
           </tr>
           <tr>
               <td>displayName</td>
               <td>
                   选择管理画面的主体者的下拉一览上被表示的标签。
               </td>
           </tr>
           <tr>
               <td>headerName</td>
               <td>
                   发送实际的主体者的字符串的HTTP头名。
               </td>
           </tr>
       </tbody>
   </table>

1. 覆盖保存principalHeaderList.json。
   Directory服务，为了作为其他的用户表的信息主体者利用，创建取得的信息映射到Servlet过滤器, 有必要追加本产品上。
   以下只是在追加自定义Servlet过滤器的时候设定

1. 用记事本等文本编辑器打开/infoscoop/build.properties。

1. 以下__粗体斜体的__部分 结合要联合的SSO产品环境编辑。

   <pre><code>
   customizeSetRoleHeaderFilterClass=<strong><i>org.infoscoop.web.CustomizeRoleFilter</i></strong>
   </code></pre>

   设定内容如下。

   <table>
       <caption>build.properties设定项目</caption>
       <thead>
           <tr>
               <th>属性名</th><th>说明</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td colspan="2">
                   <strong>customizeSetRoleHeaderFilterClass</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>
                   组织管理映射用的自定义Servlet过滤器名
               </td>
           </tr>
           <tr>
               <td>详细</td>
               <td>
                   从联合的用户表(Directory服务器)取得的信息作为HTTP的头指定向本产品传递的Servlet过滤器类名。
               </td>
           </tr>
       </tbody>
   </table>

1. 覆盖保存build.properties。

1. 配置创建的Servlet过滤器类。

    * Servlet过滤器类以jar文件形式被提供时请配置到/infoscoop/Customization/WEB-INF/lib。
    * Servlet过滤器类以class文件形式被提供时请和包阶层一起配置到/infoscoop/Customization/WEB-INF/classes文件夹。


# 6 设定日志输出

infoScoop OpenSource的默认设定在以下的地方输出应用程序的执行的日志。

Windows的情况：

```
<infoScoop被部署的AP服务器的硬盘>:\var\log\infoscoop\
```

Linux的情况：

```
/var/log/infoscoop
```

**注意** Web应用服务程序的执行用户要对上述的目录有写的权限。

日志是分天以「infoscoop_log_yyyyMMdd.log」的形式的文件名被输出。
__例__: infoscoop_log_20080808.log
上述的默认设定没有问题的话，没有必要设定日志的输出设定。
想变更日志的输出设定的话，修正以下的文件。

```
/infoscoop/Customization/WEB-INF/conf/log4j.xml
```

关于设定文件的修正方法，请参照『infoScoop运用手册(准备中)』


# 7 不区别登录用户ID的大字小字

本产品在默认设定情况下，区分登录用户ID的大小写。
像LDAP一样认证服务不区分用户ID大小写的情况，进行以下设定。

**注意** 以ActiveDirectory为代表，多数的目录服务在认证时不区分大小写。

1. 用记事本等文本编辑器打开/infoscoop/build.properties。

1. 去掉以下的行的注释(删除行前头的「# 」)，编辑__粗体斜体的__地方。

   build.properties(摘要)

   <pre><code>
   sessionCreateConfig.uidIgnoreCase=<strong><i>false</i></strong>
   </code></pre>

   设定内容如下。

   <table>
       <caption>build.properties设定项目</caption>
       <thead>
           <tr>
               <th>属性名</th><th>说明</th>
           </tr>
       </thead>
       <tbody>
           <tr>
               <td colspan="2">
                   <strong>sessionManagerFilter.uidIgnoreCase</strong>
               </td>
           </tr>
           <tr>
               <td>设定内容</td>
               <td>
                   是不是区分登录用户ID的大小写。
               </td>
           </tr>
           <tr>
               <td>详细</td>
               <td>
                   选择以下的其中一个。<br>
                   true: 不区分大小写。<br>
                   false: 区分大小写。
               </td>
           </tr>
       </tbody>
   </table>

1. 覆盖保存build.properties。

__变更sessionManagerFilter.uidIgnoreCase的设定从false(默认)到true时候__，如果现有的用户信息以大字小字不相同的用户ID有登录复数的user profile(用户画面设定信息)情况，选择user profile的画面被表示。

# 8 其他的设定

remakewar.bat(sh)是展开infoscoop.war文件，Customization目录下的内容覆盖后，再次做成WAR文件。
Customization目录像下面一样被构成。

    Customization  
    |   changePassword.jsp
    |   login.jsp
    |   openid_login.jsp.sample
    |
    \---WEB-INF
        +---classes
        +---conf
        |       log4j.xml
        |
        \---lib

* **changePassword.jsp:** 表示密码变更表用的JSP
* **login.jsp:** 表示登录表用的JSP
* **openid_login.jsp.sample:** OpenID表示登录表用的JSP
* **classes:** SSO或者取得所属信息用的Serverlet过滤器的类。配置文件用的目录。
* **log4j.xml:** 日志输出设定用的文件
* **lib:** SSO或者取得所属信息用的Serverlet顾虑器的jar文件配置用的目录。

上述表记载以外的文件的自定义属于版本升级的保护对象外。
到上节说明的设定以外，使用本产品的标准登录机构只是被表示登录页和密码变更页。关于不包含上述表的文件的使用，请在用户论坛询问。


## 9 再创建WAR文件

系统初期设定完成后，从命令行上执行再次创建WAR文件的的批处理（shell脚本）。执行以下的批处理(shell脚本)。

```
Windows的情况：
\infoscoop\remakewar.bat
Linux的情况：
/var/infoscoop
```

\infoscoop\dist目录下面，设定被反映了的infoscoop.war被再创建。
根据这个方法被再创建的WAR文件里，之前的设定内容被反映到文件。

**注意** 因为有Apache Ant不正常运行情况，不能正确创建WAR文件请注意。


## 10 自定义设定的保存

WAR文件的自定义时候，版本和补丁时，再次使用remakewar.bat(sh)来再次创建部署用的WAR文件。
关于build.properties和Customization目录，为了下次补丁和版本升级用到，请严格保管。


[Apache Ant Document]: http://ant.apache.org/manual/index.html "Apache Ant的文档"
[Administration Guide]: ../administration-guide/index.md "管理指南"
