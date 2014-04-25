# Properties Settings

This page describes the each system properties of infoScoop OpenSource and properties administration page to set properties.

## 1 Properties Administration Page

The each system properties can be changed in properties administration page.  
Properties administration page is displayed if **Properties** is selected from the menu of infoScoop administration page.  
The functions of controls in the properties administration page are as the followings.

<table>
    <thead>
        <tr>
            <th>Icon</th>
            <th>Name</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
	<tr>
    	<td><img src="../../images/display_all_properties.gif"/></td>
        <td>Display all properties</td>
    	<td>Display the properties hidden at initial that control the inner workings of program and are not supported in current version.</td>
    </tr>
	<tr>
    	<td><img src="../../images/refresh.gif"/></td>
        <td>Refresh</td>
    	<td>Discard the changes and displays the last applied state.</td>
    </tr>
	<tr>
    	<td><img src="../../images/apply_changes.gif"/></td>
        <td>Apply changes</td>
    	<td>Apply the changes (saving data).<br><br><b>Note:</b> All the changes are discarded if this icon is not clicked.</td>
    </tr>
    </tbody>
</table>

## 2 Properties Related to the Menu

Properties related to the menu settings is as the followings.  
Refer to [Menu Settings] about `siteAggregationMenuURL` and `sideMenuURL`.

### 2.1 displayTopMenu

Set to display / not display the top menu.

    Display: Display the top menu.
    Not display: Hide the top menu.
    Default: Display

### 2.2 displaySideMenu

Set to display / not display and the same settings as top menu.

    Display: Display the side menu.
    Not display: Hide the side menu.
    Same settings as topmenu: Display the side menu as the same settings of top menu.
    Default: Display

### 2.3 menuAutoRefresh

Set to enable or disable the automatic updates of the menu. This setting can be applied to both the top and side menu.

    Enable (check): The menu is subject to automatic updates.
    Disabled (unchecked): The menu is not subject to automatic updates.
    Default: Disabled

### 2.4 menuLockTimeout

Menu is unlocked to edit automatically after the period of time without anything during the menu tree is edited in the menu administration page. Set the interval by this property.

    Specify a number in minutes.
    Default: 30

### 2.5 sideMenuTabs

Set to display / not display the side menu.  
Specifies the identifier of the tab in the list. Identifier for each tab are as the followings.

    sidemenu: Display Menu tab in side of portal.
    addContent: Display Add Contents tab.
    mySiteMap: Display My SiteMap tab.

**Note:** Changing this property is not supported. Compatibility is not guaranteed at version up.

## 3 Properties for Ajax Request

infoScoop loads the settings and data by communication system called Ajax request.

Refer to [Proxy Settings] for more detail.  
Properties for Ajax requests is as the followings.

### 3.1 ajaxRequestTimeout

Maximum wait time for Ajax request.

    Specify numeric value in milliseconds.
    Default: 15000

The contents that through the Ajax proxy of this product and take longer than 15 seconds can not be displayed by this setting.

**Note:** If this property is needed to be changed, the tuning of application server is also needed.

### 3.2 ajaxRequestRetryCount

Number of retries if the Ajax request has timed out.  
Ajax request is appended to the request queue again if the requests are not complete within the time set to ajaxRequestTimeout property.  
The operations above is repeated as many times as the number selected at ajaxRequestRetryCount.

    0 to 2 times can be specified.
    Default: 2 (times)

### 3.3 refreshInterval

Interval of automatic refresh of each gadget. Refer to User Guide / [Auto Update] for the detail of automatic updates.

    The unit is specified as a numeric value in minutes.
    Default: 10 (minutes)

### 3.4 widgetRefreshInterval

Interval of automatic updates between gadgets. Update interval of gadget in one turn of automatic update is set.  
Refer to User Guide / <a href="auto-update.md#updateDurationInTurn">The Updating Interval in One Turn</a> for the detail.

    The unit is specified as a numeric value in seconds.
    Default: 20 (seconds)

**Note:** If this property is needed to be changed, the tuning of application server is also needed.

### 3.5 subWidgetRefreshInterval

Automatic refresh interval of RSS Reader in Multi-RSS Reader gadget.

    The unit is specified as a numeric value in milliseconds.
    Default: 500 (milliseconds)

**Note:** If this property is needed to be changed, the tuning of application server is also needed.

## 4 Property for the Gadgets Dealing with the RSS

Common property of the gadget dealing with RSS such as Information and RSS Reader gadget is as the followings.

### 4.1 rssPageSize

Number of items loaded at once by automatic paging feature of the RSS Reader.

    Specify a number.
    Default: 25 (items)

### 4.2 rssMaxCount

Specifies the maximum number of RSS that can be displayed.

    Specify a number.
    Default: -1 (All items)

All items are retrieved if a negative integer is specified.

### 4.3 freshDays

The duration of new arrival icon is displayed in Information / Image information / RSS Reader / Multi-RSS Reader.

    The unit is specified as a numeric value in day.
    Default: 1 (day)

## 5 Properties for User Customization

Properties for customizing the user is as the followings.

### 5.1 maxTabs

The maximum number of tabs can be added by the user is specified.

    Specify a number.
    Default: 50

### 5.2 maxColumnNum

The maximum number of columns in personalized area is specified.

    Specify a number.
    Default: 10

**Note:** Changing this property is not supported. Compatibility is not guaranteed at version up.

### 5.3 commandQueueWait

The interval to store the user customizations is specified.

    The unit is specified as a numeric value in seconds.
    Default: 30 (seconds)

Request to store customization information is sent at intervals set in commandQueueWait even if the use does not change the page. This is because customization information is used to infoScoop original session check mechanism.  
Customized information is also saved if the browser is closed or moved to another site.

## 6 Properties for a User Operation Log

This product has a mechanism to store certain user actions to a repository database such as searching and clicking the link.  
This information is used in Ranking gadget and access statistics.

### 6.1 accessLogEntry

Specify whether to store the access log of the gadgets dealing with RSS such as Information and RSS Reader gadget.

    Enable (check): Save the data.
    Disabled (unchecked): Do not save the data.
    Default: Enabled

### 6.2 keywordEntry

Specify whether to save the search keyword ranking data.

    Enable (check): Save the data.
    Disabled (unchecked): Do not save the data.
    Default: Enabled

### 6.3 logCommandQueueWait

The interval of sending the keyword / server access logs to the server of this product is specified.

    The unit is specified as a numeric value in seconds.
    Default: 3600 (seconds)

Keyword / search access log is sent if the browser is closed or moved to another site.

### 6.4 logStoragePeriod

The retention period of access log is specified. Log retention period has expired is automatically deleted from the database.

    The unit is specified as a numeric value in day.
    Default: 365 (days)

The log is stored for an indefinite period if an integer of 0 or less is specified.

## 7 Properties for Layout

Properties for the layout is as the followings.

### 7.1 displayInlineHost

The host name that is displayed in inline frame at clicking on the links of menu and gadgets is specified. It is displayed if the link setting (Display link settings for menu, content display mode for gadget) is set to auto detect
(see: *Content Display Mode*).

    Default: Not set
    
    e.g.
    hostname: 80
    hostname: 8080
    192.168.11.23

Same host with different ports are determined as the different setting.  
Specify `*` (an asterisk character) in the first setting to display the all links in inline frame.

### 7.2 fixedPortalHeader

The position of the scroll bar is set.

    Enable (check): The header is always displayed and scroll bars are displayed in the tab.
    Disabled (unchecked): The scroll bar is displayed on the entire window.
    Default: Disabled

## 8 Properties for Log In and Session

### 8.1 loginStateKeepPeriod

Login status can be stored on the browser at the standard login page of this product. loginStateKeepPeriod specifies the duration that online status is saved.

    The unit is specified as a numeric value in day.
    Default: 7 (days)

The function that store login status is disabled if an integer of 0 or less is specified.

### 8.2 loginCredentialAuthType

The authentication type applied to register the login information typed in the standard login page of this product as the authentication information to authentication gadget mechanism automatically is specified.

    basic: Basic authentication
    ntlm: NTLM authentication
    postCredential: Post credentials
    Not selected: Credential is not registered

Authentication gadget mechanism does not work as invalid credential if the other value above is entered.  
The new authentication information is registered at the next user log in if this property is changed during operation. In this case, the old credentials is demoted to normal authentication information or automatically removed if the credentials are not set to any gadget.

**Note:** If **Intranet** check box in **Proxy** tab is enabled, this setting applied. Refer to Administration Guide / <a href="proxy-settings.md#proxy_manage_intranet">6 Intranet Settings</a> about **Intranet** check box setting.

## 9 Properties for the System Settings

The properties that is needed to be changed if the system organization is changed as the followings.

### 9.1 staticContentURL

The URL where static files of infoScoop OpenSource are stored is specified.

Copy and deploy the static files to the web server and specify that URL for improvement of performance usually. Use mod_expires setting as well because the images of img tag generated by JavaScript can not be cached especially images in CSS of IE.

Static content is combined in the directory infoscoop/staticContent which is unpacked the archive. Deploy the static content directory to suitable path of Apache and set the mod_expires module.  
The following example shows the setting of httpd.conf.

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

Cache is valid for a month, copy the staicContent to /var/www/infoscoop/staticContent and set alias as is_web in the setting above.

    Default: .(Relative path to the context path)

<a name="9_2_gadgetProxyURL"></a>
### 9.2 gadgetProxyURL

The contents displayed on the gadget of infoScoop is displayed throughout Ajax proxy of infoScoop. In other words, the problem of cross-domain scripting is occurred to display the gadget as the content of same domain of infoScoop.  
The following figure explains that the external gadget can access to infoScoop and JavaScript object of other gadget in the browser.

![Invalid Access of Gadgets]

The all gadgets displayed on this product must be executed on the other domains in order to solve cross-domain issue. However, usually it is difficult to provide such infrastructure.  
So, infoScoop has properties for executing the external gadget (access gadget by specified URL) and uploaded gadget to infoScoop in other domain.

![Run Gadgets in Other Domain]

The URL of proxy that handles this gadget is specified in gadgetProxyURL.

    Default: ./gadgetsrv

This URL is the context of infoScoop that can access from other domain specified with `./gadgetsrv`.  
For example, if the context of this product is used the domain like below:

URL for infoScoop: http://infoscoop/infoscoop/  
Proxy URL for the gadget: http://gadgetproxy/infoscoop/

Specify `http://gadgetproxy/infoscoop/gadgetsrv` for gadgetProxyURL in thiscase.

**Note:** gadget.pubsub and gadget.rpc features is not subject to the issue of cross-domain scripts.

If properties are spesified URL include wild card, each gadgets can be run inother domain.  
e.g. http://*.infoscoop.test/infoscoop/gadgetsrv

**Note:** To use this function, you need to add settings that determine a name using a wild card to DNS.

### 9.3 messagePriority

Set the information level of message console.  
Specify one of the following numbers.

    1: Debug
    2: Info
    3: Warn
    4: Error
    
    Default: 1

For example, messages of more than warn is displayed in message console if 3 is specified.  
Default is applied if the value other than 1-4 is specified.

### 9.4 searchEngineURL

The URL to get the setting file of the external search engine.  
Specify the empty value to enable search setting set in [Search Form Administration].

**Note:** Changing this property is not supported. Compatibility is not guaranteed at version up.


[Menu Settings]: menu-settings.md
[Proxy Settings]: proxy-settings.md
[Auto Update]: ../user-guide/auto-update.md
[Search Form Administration]: search-form-administration.md
[Invalid Access of Gadgets]: images/properties-manager/properties-settings-1.png
[Run Gadgets in Other Domain]: images/properties-manager/properties-settings-2.png
