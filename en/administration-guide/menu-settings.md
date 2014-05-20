# Menu Settings

This section explains how to build menu structure and how to set each menu item property.

## 1 Menu

infoScoop OpenSource manages internal websites and external web sites as a hierarchical menu.  
There are the top menu at the top of the screen and the side menu that contains the tab on the left of the page.  
You can use menu as a bookmarks, RSS Reader, and function for select each gadgets.  
You can add, edit, remove, and change the order of the menu items at the dedicated administration page.  
In addition, an external service can be specified as a tree menu.

## 2 Menu Administration Page

If you click [**Menu**] from the top of the administration page, the menu administration page is opened.  
You can operate like a explorer the menu administration.

## 3 Select Menu

infoScoop OpenSource has the two hierarchical menus. One is the **Top Menu**, and another is the **Side Menu**.  
You can select the menu to editing or refer from the **side bar** of the left side of the Menu administration page.  
You can select the configuration of the top menu and the side menu. (same or different)

Specify `displaySideMenu` property whether the co nfigurations of Top Menu and Side Menu are the same or different.

For information about setting properties, refer to [Properties Settings].
If you edit the same configuration and selected the side menu, displayed a message `Refer to the same URL as top menu`. And you cannot editing the side menu.

## 4 Context Menu

This section explains the context menu of the Menu administration page.

<table>
    <thead>
        <tr>
            <th>Icon</th><th>Name</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img src="../../images/open_all.gif"/></td>
            <td>Open all</td>
            <td>Displays all the menus.</td>
        </tr>
        <tr>
            <td><img src="../../images/close_all.gif"/></td>
            <td>Close all</td>
            <td>Close all menus.</td>
        </tr>
        <tr>
            <td><img src="../../images/add_menu_tree.gif"/></td>
            <td>Do menu tree addition/order change.</td>
            <td>If you click this icon, you can change the order of the top menu. Also, you can add new menu tree.<br>Only administrator that have "Menu" authority can use this icon.</td>
        </tr>
        <tr>
            <td><img src="../../images/add_menu_tree.gif"/></td>
            <td>Add menu tree</td>
            <td>A new menu tree is added.<br>A dialog for Menu settings is displayed by clicking this.<br>This icon is only available if the tree in add mode or move mode.<br>About for each settings, refer to <a href="#menu_item_add_change">7 Adding and Changing Menu Items</a>.</td>
        </tr>
        <tr>
            <td><img src="../../images/refresh.gif"/></td>
            <td>Refresh</td>
            <td>The last state is displayed.<br>The expanded menu is closed, and the menu tree is only displayed.</td>
        </tr>
        <tr>
            <td><img src="../../images/refresh.gif"/></td>
            <td>All lock release</td>
            <td>All the root menus and the lock to change the order are released, and the last applied state is shown.<br>The expanded menu is closed and the menu tree is displayed.<br>This icon is only available to the tree in edit mode.</td>
        </tr>
        <tr>
            <td><img src="../../images/apply_changes.gif"/></td>
            <td>Apply changes</td>
            <td>All previous operations (add, edit, remove, and move) are applied by clicking this. (Data is saved.)<br>This icon is only available to the tree in edit mode.<br><b>Note:</b> Finally, if you do not click this icon, editing is destroyed.</td>
        </tr>
        <tr>
            <td><img src="../../images/preview.gif"/></td>
            <td>Preview Top page</td>
            <td>The present composition information is displayed in another window.<br>Only administrator that have "Menu" authority can use this icon.</td>
        </tr>
    </tbody>
</table>

## 5 Edit Mode and Lock

Menu Adminisration is considered that the operation of multiple users simultaneously. Also, it has the **reference mode**, the **edit mode**, and the **menu tree addition and order change mode** for each operation.  
The edit mode and the menu tree addition / order change mode has unique locking mechanism.

### 5.1 Reference Mode

This is the initial state at the menu administration page.  
The following menu items are displayed if the root menu title is right-clicked.

  * [**Lock and edit**]: Get the lock of the top menu. Also, you can edit the menu tree.
  * [**Reference**]: Display the dialog to refer to the menu.

If you click "Lock and edit", you can edit the menu tree.
`Lock and edit` is displayed only in the root menu.  
In addition, the menu is opened and closed by clicking [**+**] and [**-**] icons at the left of the menu item.

### 5.2 Edit Mode

You get the locking of the menu tree by operating `Lock and edit` for the menu tree of the refrence mode. And, you can edit the menu.  
The following menu items are displayed if the menu title is right-clicked.

  * [**Edit**]: Display the dialog to editing menu.
  * [**Delete**]: Display the dialog to deleting menu.
  * [**Add**]: Display the dialog to adding menu.

Title colors of the menu tree in a locked state is blue.  
The lock is per tree. It is also possible to lock more than one tree.

### 5.3 Menu Tree Addition and Order Change Mode

If you click context menu's `Do menu tree addition/order change.`, you can add menu tree and change order of menu tree.  
Only the information about the order of the menu tree is locked in this mode.  
A new menu tree can be added by clicking the context menu `Add menu tree` in this mode.  
Also, if you can drag the root menu, you can change the order of the menu tree.

### 5.4 Deployment Control

Get a lock first to avoid conflicting with the other users before editing, adding or moving the menu.  
A dialog indicating another user is editing is displayed if the menu being edited by another user (locked state) is locked or if `Do menu tree addition/order change` is clicked during the order of the menu tree is being changed by another user.  
If you select [**OK**] for `Editting data of this user is lost if editting is continued.` in the dialog, discard the editing data of displayed user in the dialog.  
**Note:** Administrator with the role include the administration authority menu can get the lock by force. Administrator without the role include the administration authority menu cannot operation until the lock is released.  
Release the lock by the following operations.

  * Click the "All lock release".
  * Select other administration menu.
  * Access to other URL from the administration page.
  * Close the web browser.

Also, the lock has a timeout. Releases all lock 30 minutes pass since last operation.  
**Note:** All edited conents without "**Apply changes**" are discarded when timeout.   
The timeout period can be edited by the property `menuLockTimeout`.

For information about setting properties, refer to [Properties Settings].

## 6 Moving Menu Items

You can move menu and menu tree by drag-and-drop operation.

### 6.1 Moveing Menu

This operation is enabled in edit mode.  
A menu is moved where a dotted horizontal line appears by releasing the left-click.  
In addition, if it overlays another menu, the dotted line is displayed around the menu. The menu is moved under the overlaid menu if it is dropped at anywhere a dotted line appears.

### 6.2 Moveing Menu Tree

If in the menu tree addition / order change mode, you can do this operation.  
If you click the `Do menu tree addition/order change.`, you can move the menu tree. A menu is moved where a dotted horizontal line appears by releasing the left-click.  
Additional moves of the menu tree cannot be made.

<a name="menu_item_add_change"></a>
## 7 Adding and Changing Menu Items

A dialog for menu settings is displayed if [**Add**] is selected from the right-click menu of each menu in edit mode.  
The settings are as follows.

  * Link on menu / Gadget header settings
  * Gadget settings
  * Public settings
  * Alert settings

At the menu tree addition and order change mode, if you click [**Add menu tree**] in context, a dialog for menu settings for menu tree is displayed.  
The settings are as follows.

  * Menu link settings
  * Administrator settings
  * Public settings
  * Alert settings

The following are the details about each setting.

### 7.1 Link on Menu / Gadget Header Settings

You can set the link title and the title of the menu items. If you set the gadget on the menu, the title of the added gadget header is applied.

The following are the details about Menu Link setting.

<table>
    <thead>
        <tr>
            <th nowrap>Setting items</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Title</td>
            <td>The title of the menu. Required.<br>The title can be entered up to 80 characters.</td>
        </tr>
        <tr>
            <td>Title link</td>
            <td>Link URL of the menu title.<br>The URL can be entered up to 1024 bytes.</td>
        </tr>
        <tr>
            <td>Display link settings</td>
            <td>Set the title link appears.<br>[auto detect]: Applies the frame in portal or new window according to displayInlinHost property settings. Refer to <i>displayInlineHost</i>.<br>[Frame in portal]: Displays a linked sites in the inner frame in portal.<br>[New window]: Displays a linked sites in another window.</td>
        </tr>
        <tr>
            <td>No links on menu</td>
            <td>Valid only if the gadget settings.<br>The link in menu is not displayed. The title link set at the header is applied is if a gadget with the settings is added.</td>
        </tr>
        <tr>
            <td>External service URL</td>
            <td>The URL of the external server for the menu settings.<br>You can set in the dialog if clicked [Add menu tree] in the context menu or the root of the menu tree if setted the external service menu.<br>Refer to <a href="#specify_external_service">10 Specify the External Services</a></td>
        </tr>
        <tr>
            <td>External service authentication type</td>
            <td>If you specify an external service URL, you can specify how to pass the login user ID of the portal to service.<br><br><b>none</b>: The information of the login user is not sent.<br><b>postPortalCredential</b>: Specify to post the user ID and the password of logged in user when RSS is loaded. A text box to specify the parameter name of user id that included in POST data is shown if postPortalCredential is selected. The parameter name of user id is "is-user" if the parameter name is not specified.<br><b>sendPortalCredentialHeader</b>: Specify to send the header including the user id of logged in user.A text box to specify the header name that sends user id is shown if sendPortalCredentialHeader is selected.The header name of user id is "is-user" if the header name is not specified.</td>
        </tr>
    </tbody>
</table>

### 7.2 Gadgets Settings

This section explains how to set the gadgets related to menu items.  
Gadgets can be set in the menu are as follows.

  * Calendar
  * RSS Reader
  * Multi-RSS Reader
  * MiniBrowser
  * FragmentMiniBrowser
  * Gadget (Specifing URL)
  * TODO List
  * Alarm
  * Calculator
  * Popular gadgets
  * Message
  * Blogparts
  * Sticky
  * World clock
  * Gadget (Added gadgets in the gadget administration.)

If you select a gadget in [**Type of Gadget**], settings about the selected gadget is displayed.  
You can set the initial value of /Module/UserPref on the gadget specification in the gadget settings of the menu administration.  
Also in this dialog, the datatype attribute of UserPref "hidden", you can also specify the initial value of UserPref.

**Note:** The gadget type can not be changed once it is set.

Refer to the description of each gadgets about the gadget settings.  
The settings displayed only in the menu setting dialog is explained here.

#### 7.2.1 Get Title Information

RSS reader and MiniBrowser displays the information from specified URL. However, if you select like these gadgets, [**Get title information**] button is displayed at the right of the URL text box.  
If you click [Get title information] button, settings the title and title link from the specified URL information.  
If gadgets that do not get external information like TODO List and Alarm or gadgets that do not specified in-one gadget like a Calendar, [Set to title information] button is displayed. If you click [Set to title information], the title of gadget is set in the title of the menu item.  
If you click [Set to title information] button, the type of gadgets is specified in the title.

#### 7.2.2 Enable Multiple Drops

If you select a gadget in gadget settings, [**Enable multiple drops**] button is displayed.

**Note:** [**Enable multiple drops**] check box in following gadgets is not displayed for these.

* RSS Reader
* Multi-RSS Reader
* MiniBrowser
* FragmentMiniBrowser
* A gadget which singleton attribute of ModulePrefs element is false

The following is description of [**Enable multiple drops**] setting items.

<table>
    <thead>
        <tr>
            <th nowrap>Setting items</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Enable multiple drops</td>
            <td>Specifies whether more than one can be added to the customize area from the menu.<br><b>Enabled</b>: Allows to add multiple gadgets.<br><b>Disabled</b>: Can not allows to add multiple gadgets.</td>
        </tr>
    </tbody>
</table>


#### 7.2.3 Preview

If you click [**Preview**] button after editing require items of each settings, the preview of the gadget is displayed.

#### 7.2.4 Back to Default Settings

At the bottom of the gadget settings, [**Back to default settings**] button is displayed. Resets each settings to default settings. The default value is the specified value in the gadget administration.

### 7.3 Peculiar Gadgets Settings of Administration Menu

There are noteworthy specifications by the selected type of the gadget.

#### 7.3.1 Multi-RSS Reader

Multi-RSS Reader settings are the same as RSS Reader.  
Unlike an RSS Reader, if you add it in the customize area from menu, parent menu of edited menu is Multi-RSS Reader.  
For example, if a menu tree is set as follows.

  * Parent menu: @IT site  
  |_Child menu: News (Multi-RSS Reader)

In this case, if you drop the child menu `News` in your personalize area, RSS Reader is displayed as child of `@IT site`.

#### 7.3.2 Gadget (Specifying URL)

If you specify the gadget on the web server, you select [**Gadget (Specifying URL)**].  
Setting items are shown as follows if [Gadget (specifying URL)] in [Gadget type] is selected.

<table>
    <thead>
        <tr>
            <th nowrap>Setting items</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Gadget URL</td>
            <td>Type the URL of the gadget file.<br>The URL can be entered up to <b>1022</b> bytes.<br>If you click [Get Title Information], the title and the link are gotten from the gadget file. Also, [Title] and [Title link] are set in "Link on menu".</td>
        </tr>
    </tbody>
</table>

#### 7.3.3 Blogparts

The Blogparts gadget displays the distributed blogparts.  
If you select [**Blogparts**] in the type of gadget, follows are displayed.

<table>
    <thead>
        <tr>
            <th nowrap>Setting items</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>HTML Source</td>
            <td>Setting contents of the blogparts in the blogparts gadget.</td>
        </tr>
    </tbody>
</table>

### 7.4 Public Settings

You can set show or hide according to the role information of the login user such as job title and organization.

  * Publish: Publishing the menu for all users.
  * Private (Unchecking the public settings): Publishing the menu for only authorized users.

Each subject are mapped to HTTP header value by settings.  
Refer to Installation Guide / <a href="../installation-guide/customizing-web-application-module.md#http-header">5 Define the HTTP header as role information</a> about how to set.  
Type regular expressions in the access control. Regular expressions judge the subject against its header value. If it is true, allows reference.  
If you specify more than one access control, it is judged as the sum operation of all.

### 7.5 Alert Settings

If the new menu is added, users can know it as follows.  
You can select the following items.

  * No alert
  * Displaying message
  * Additional force (If the gadget is set)

The alert setting of the menu with an external menu service is used if the menu item that the menu setting without any specified alert attribute is added.

### 7.6 Select Update Properties

The change of the property can be applied to the user page when the gadget settings of menu is changed in Administration page if a gadget belonging to the menu is already dropped in the personalized area.  
Updatable property are the title, the title link and the user settings by gadgets (UserPref). If you check `Select update properties` check boxes and you click `Apply changes`, settings are reflected in the user page.  
If you update user settings except the title and datatype=`hidden`, a notification is displayed on the user page.

## 8 Remove Menu Items

If you select [**delete**] from right-click menu of each menu, the dialog to delete menu is displayed.  
If you click a [OK] button, the menu is deleted.

<a name="set_admin"></a>
## 9 Setting Administrators to the Menu Tree

If in edit mode or addition the menu tree, you can set super user of its menu tree in the administrator settings. Administrator settings are displayed only if editing the root menu.

  * User IDs with the authority `Menu Tree` is displayed in the combo box.
  * Administrator of the menu tree can refer and edit only the menus assigned as an administrator.

<a name="specify_external_service"></a>
## 10 Specify the External Services

An external service can be used as a part of the Menu of this product.  
**Note:** The URL rewrite logic is not ran if an external service is used for the menu.  
Menu configuration service makes a REST service. Response XML file has the following schema.

*Menu configuration file schema*
    
    <!ELEMENT sites         (site-top*)> 
    <!ELEMENT site-top      (site*)> 
    <!ATTLIST site-top      id          #CDATA      #REQUIRED 
                            title       #CDATA      #REQUIRED 
                            href        #CDATA      #IMPLIED
    >
    <!ELEMENT site          (properties, site*)> 
    <!ATTLIST site          id          #CDATA      #REQUIRED 
                            title       #CDATA      #REQUIRED
                            display     #CDATA      #REQUIRED 
                            href        #CDATA      #IMPLIED 
                            type        #CDATA      #IMPLIED 
    >
    <!ELEMENT properties    (property*)> 
    <!ELEMENT property      (#PCDATA)> 
    <!ATTLIST property      name        #CDATA      #REQUIRED>

Multiple menu tree can be included in one service if the sites element is used as a root element. Also, the site-top can be a root element, and sites element can be omitted if one menu tree is defined by one service. Each setting item is explained as follows.

<table>
    <thead>
        <tr>
            <th nowrap>Setting items</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td nowrap>sites element</td>
            <td>The root element of the menu configuration file. Include multiple site-top elements in sites element to define multiple menu trees by one service.</td>
        </tr>
        <tr>
            <td align="right">site-top element</td>
            <td>The following is the description of site-top element.</td>
        </tr>
        <tr>
            <td nowrap>site-top element</td>
            <td>Type the information for a menu tree.</td>
        </tr>
        <tr>
            <td align="right">id attribute</td>
            <td>The ID used internally. You must type a unique ID that does not conflict with other menu items. The ID must be unique in all of menus.</td>
        </tr>
        <tr>
            <td align="right">title attribute</td>
            <td>Title of the menu.</td>
        </tr>
        <tr>
            <td align="right">href attribute</td>
            <td>Type the destination URL associated with the menu.</td>
        </tr>
        <tr>
            <td align="right">site element</td>
            <td>The following is the description of the site element.</td>
        </tr>
        <tr>
            <td>site element</td>
            <td>Type information for menu items.</td>
        </tr>
        <tr>
            <td align="right">id attribute</td>
            <td>The ID use internally. You must type a unique ID and the other menu items.<br>The ID must be unique in all of menus.<br>The max length of the id is 256 bytes. If the id is over the 256 bites, the<br>menu is displayed, but the gadget icons is hidden.</td>
        </tr>
        <tr>
            <td align="right">title attribute</td>
            <td>Title of the menu.</td>
        </tr>
        <tr>
            <td align="right">href attribute</td>
            <td>Type the destination URL associated with the menu.</td>
        </tr>
        <tr>
            <td align="right">type</td>
            <td>Specify the gadget type to make it enable to be dropped.<br>Specify the following type.<br>
            <ul>
                <li>RssReader</li>
                <li>MultiRssReader</li>
                <li>MiniBrowser</li>
                <li>Gadget</li>
                <li>Unspecified</li>
            </ul>
            </td>
        </tr>
        <tr>
            <td nowrap>property element</td>
            <td>Type the properties of Gadget-specific information.</td>
        </tr>
        <tr>
            <td align="right">site element</td>
            <td>You can recursively define the menu hierarchy.</td>
        </tr>
        <tr>
            <td align="right">property element</td>
            <td>Type the information (URL) of RSS in RSS Reader or Multi-RSS Reader.</td>
        </tr>
        <tr>
            <td align="right">name attribute</td>
            <td>Type the mapping key to RSS information. Now, type "url". If you select "Gadget" in type, the length of URL is a maximum of 1022 bytes. If you select other type, there is no restrictions.</td>
        </tr>
    </tbody>
</table>

The following is a sample.

*Example of the menu configuration file*
    
    <site-top id="nikkeiBP" title="Nikkei BP" href="http://nikkeibp.jp/">
     <site id="nikkeiBP_all" title="Top" href="http://nikkeibp.jp/" 
        type="MultiRssReader">
       <properties>
         <property name="url">http://nikkeibp.jp/index.rdf</property>
       </properties>
     </site>
     <site id="nikkeiBP_news" title="News" 
        href="http://nikkeibp.jp/" type="MultiRssReader">
       <properties> 
         <property name="url">http://nikkeibp.jp/jp/flash/index.rdf</property> 
       </properties> 
     <site id="nikkeiBP_management2" title="Enterprise/Management" 
        href="http://nikkeibp.jp/jp/business/" type="MultiRssReader"> 
       <properties> 
         <property name="url">http://nikkeibp.jp/jp/business/index.rdf</property> 
       </properties> 
     </site> 
     <site id="nikkeiBP_itPc" title="IT/PC" 
        href="http://nikkeibp.jp/jp/it/" type="MultiRssReader"> 
       <properties> 
         <property name="url">http://nikkeibp.jp/jp/it/index.rdf</property>
       </properties> 
     </site>
    </site> 
    </site-top>


[Properties Settings]: properties-settings.md
