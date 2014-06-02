This document may contain untranslated or unedited parts.  
[Your cooperation](../../README.md) would be greatly appreciated!  


# Default Layout Settings

This section describes how to set page configuration that is displayed when a user logged in first.

## 1 Default Layout Settings

In infoScoop OpenSource, a user can customize the state of a gadget, and arrangement freely. Each user's customization information is automatically saved in a database.

If you view the screen again infoScoop OpenSource users to construct a screen for user customization based on information that is stored in the database.  
Because there is no customization information of a user if a user displays infoScoop OpenSource first, it is necessary to prepare common default configuration.  
Here, the setting method of the page layout at the time of a user displaying infoScoop OpenSource first is explained.  
The default layout can also change an default layout according to a user's role information.  
infoScoop OpenSource receives a user's role information from a HTTP header.

In Default Layout, the following is the point of a setup.

  1. Command bar
  2. Header
  3. Each tab - Fixed area
  4. Each tab - Personalized area

## 2 Default Layout Administration

The operation method about the setting method of `Default Layout` is explained.  
If **Layout** is chosen and **Default Layout** is chosen, the page for setting up an default layout will be displayed.  
The object of the setup is displayed with the tab. **commandbar** is a setup
of commnad bar. "**tab0**" "**tab1**"-"**tabn**" is a tab set in an order from the left.  
A role list is displayed in each tab.  
An default layout setup is set up to a role information.  
Only `defaultRole` is used if all the users use the same Default Layout.  
A click of the edit icon of the role to set up is display an edit display.  
All the tabs set up from a administration page turn into a fixed tab.  
The default layout editting pages for Command Bar, Header, Tab are each different.

- Command Bar  
The edit display of Command Bar consists of the following items.

  * Role name
  * Subject
  * Regular expression
  * Fixed area settings: A list of the component which can be arranged on a Command Bar is displayed.

- Tabs  
The edit display of tabs consists of the following items.  
Unlike a command bar, an edit display is opened in another window.

  * Role name
  * Subject
  * Regular expression
  * Tab name
  * Display Area
  * Fixed area settings: The gadget of layout fixation is set up.
  * Personalized area: Initial display of gadget setting : A list of the gadget arranged at the time of an initial display is displayed.

Edit of Fixed area and Personalized area placed at the time of an initial display is possible in the edit display of a tab.

## 3 Context menu

Explain the context menu of the Default Layout administration page.

<table>
    <thead>
        <tr>
            <th>Icon</th><th>Name</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img src="../../images/database_refresh.gif"/></td>
            <td>Initialization of customized information</td>
            <td>All the customization information of the user who specified is eliminated compulsorily.<br><br>See: <a href="#initialize_customize">9 Initializing of Customized Information</a></td>
        </tr>
        <tr>
            <td><img src="../../images/apply_changes.gif"/></td>
            <td>Apply changes</td>
            <td>Edit operation is saved by click.<br><b>Note:</b> Finally, if you do not click this icon, editing is destroyed.</td>
        </tr>
        <tr>
            <td><img src="../../images/preview.gif"/></td>
            <td>Preview Top page</td>
            <td>The present composition information is displayed in another window.<br>Only administrator that have "Menu" authority can use this icon.</td>
        </tr>
    </tbody>
</table>

## 4 Addition, Edit, And Deletion of a Role

The composition of an initial display page can be changed according to a user's role information.  
An default layout sets up to each role.  
If it is not necessary to change an default layout using a role and you use the same default layout by all the users, open the edit display of `defaultRole`. For details, refer to <a href="#command_bar">5 The Constitution of Command Bar</a>.

The followings are the composition of a role list, and explanation about theoperation method.

  * Role list:   An default layout is set up for each roll.   
Only defaultRole is prepared in the state of the first stage.  
If preparing a single initial page for the user of infoScoop, it sets to `defaultRole`.

    * **Role name**: The display label for the role.
    * **Subject**: Select the type of role.
    * **Regular Expression**: A role judging is performed by the regular expression.   
The respectively suitable value for Role name, Subject, and Regular expression is entered.  Edit becomes possible by Role name and Regular expression clicking a label.

  * Operation icons
    * Add icon: A new setup is added to a roll list.
    * Edit icon: The default layout edit display of the selected role is displayed.
    * Delete icon: The selected role is deleted. "defaultRole" cannot be deleted.
    * Switch order icon: Display order is replaced by drag-and-drop operation.

The judgment of a regular expression to a user's role information is performed sequentially from a top.  
The following is explanation about a role setup.

<table>
    <thead>
        <tr>
            <th>Setting items</th><th>Description</th>
        </th>
    </thead>
    <tbody>
        <tr>
            <td>Role name</td>
            <td>Specifies the name of role.<br>A role name is a free label and there is no systematic meaning.Specify a corresponding organization name etc.</td>
        </tr>
        <tr>
            <td>Subject</td>
            <td>The type of a roll is chosen.<br>A subject is mapped by the value of a HTTP header by setup. How to set, refer to Installation Guide / <a href="../installation-guide/customizing-web-application-module.md#http-header">5 Define the HTTP header as role information</a>.</td>
        </tr>
        <tr>
            <td>Regular expression</td>
            <td>The pattern of the authority to use this setup is specified with a regular expression.<br>If the authority at the time of login matches this pattern, the layout of that tab is applied as an initial page.<br>The judgment of a regular expression is judged in an order from a top for each subject, and a setup which matched first is applied.<br><br><b>Note:</b> URL (regular expressions), you need to write a regular expression that can be used in JavaScript.</td>
        </tr>
    </tbody>
</table>

A click of a ![Add icon] **Add** button is add a new role to a list.  
A setting item is the same as a role list page.  
If it clicks a **Back to list**, it is return to a role list.

### 4.1 Do not use default

A default roll `defaultRole` can be repealed and only the user who matched the role can be made to display a tab.  
This setting is available except Commandbar, Header, and tab0 (home tab).  
`defaultRole` can be repealed by validating the **Do not use default** check box currently displayed on the right-hand side of the `Add` button.

<a name="command_bar"></a>
## 5 The Constitution of Command Bar

The setting method of Command Bar fixed area is explained.  
Fixed area settings are as follows.

  * Ticker
  * Ranking
  * Change font size
  * Trash Bin
  * Global settings
  * Credential List
  * Administration Page
  * Logout
  * Search form

An order of the component list of fixed area corresponds in order of the display of the command bar displayed on a portal page.  
Each component has the following options.

  * **Order**: A display order can be replaced if drag-and-drop operation of the ![Drag icon] **Order** icon displayed on the left-hand side of each item is carried out.
  * **Display/Not display** : Click Display, Display outside, or Not display to decide where to display each component.
    * **Display**: The component is displayed in User Menu. Ticker and Search form can not be displayed in User Menu.
    * **Display outside**: The component is displayed on Command bar. Only its icon is displayed on Command bar except for Ticker, Search form, and added links and html.
    * **Not display**: The component is not displayed either in User Menu or on Command bar. When all the components are set Not display, Command bar is not displayed.
  * **Edit**: An edit icon is displayed only with Ticker, Ranking, added link or added html. Those components need to be set up.
    * Ticker: Electrical scoreboard like gadget. Click to edit RSS feed URL to be displayed on Ticker.
    * Ranking: Click to edit the URL list (XML format) to be displayed in Ranking. Refer to the following table for the setting items.
    * Link and HTML: Refer to <a href="#5_2_add_link_html">5.2 Add a Link, Add a HTML</a>.
  * **Delete**: A delete icon is displayed only with added link and added HTML. Clikc to delete added link and HTML.

<table>
    <thead>
        <tr>
            <th colspan="2">Setting items</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="2">urls element<br></td>
            <td>It contains url element.</td>
        </tr>
        <tr>
            <td colspan="2">url element</td>
            <td>Set the rankings information.</td>
        </tr>
        <tr>
            <td></td>
            <td>title attribute</td>
            <td>Ranking title.<br>The title of the Ranking gadget.</td>
        </tr>
        <tr>
            <td></td>
            <td>url attribute</td>
            <td>URL of RSS which feeds ranking information is set up.</td>
        </tr>
    </tbody>
</table>

### 5.1 About Search Keyword Ranking URL

As for a Ranking setup, URL of keyword ranking generation service is specified.
    
    http://localhost:8080/infoscoop/kwdsrv

By specifying a URL parameter, the ranking generated is customizable.  
The right side of an equation of service URL is edited.

Keyword Ranking generate URL

```
    <urls>
      <url title='Search Keyword Ranking'
           url='http://localhost:8080/infoscoop/kwdsrv?baseDate=TODAY&period=30&rankingNum=20/>
    </urls>
```

A setup of each parameter is explained below.

<table>
    <thead>
        <tr>
            <th>Parameter name</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan=2>baseDate</td>
        </tr>
        <tr>
            <td>Setting content</td>
            <td>The time which starts the sum of "Search Keyword Ranking" is specified.<br>Search Keyword Ranking data of a period specified by "period" on the basis of "baseDate" is created.</td>
        </tr>
        <tr>
            <td>Details</td>
            <td>TODAY : 0:00 of an execution day becomes sum starting time. If TODAY is set up, a sum is performed only once in one day. Ranking data is cached by the server. Normally use this setting.<br><br>
            yyyyMMddHH: The time specified by date format "yyyyMMddHH" becomes the start of a sum.</td>
        </tr>
        <tr>
            <td colspan=2>period</td>
        </tr>
        <tr>
            <td>Setting content</td>
            <td>The period (days) of Search Keyword Ranking is specified.<br>Search Keyword Ranking data is created till the period specified from the time of a date of record.<br>The maximum value is 60.</td>
        </tr>
        <tr>
            <td colspan=2>rankingNum</td>
        </tr>
        <tr>
            <td>Setting content</td>
            <td>The number of displays of ranking data is specified.<br>If the data after generation is less than the number of displays, all the data is generated.<br>The maximum value is 30.</td>
        </tr>
    </tbody>
</table>

<a name="5_2_add_link_html"></a>
### 5.2 Add a Link, Add a HTML

- Add a link  
If it clicks a ![Add icon] **Add a link**, a dialog is displayed and
a link can be added to a command bar.  
The settings are as follows.

<table>
    <thead>
        <tr>
            <th>Setting items</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Displaying name</td>
            <td>The display name of a link</td>
        </tr>
        <tr>
            <td>Link URL</td>
            <td>URL of a link</td>
        </tr>
        <tr>
            <td>Link display on</td>
            <td>The target of a link is specified.<br>
                <ul>
                    <li>New window : the link is displayed on a new window.</li>
                    <li>Frame in portal : Displays a linked sites in the inner frame in portal.</li>
                </ul>
            </td>
        </tr>
    </tbody>
</table>

A click of a **Add** button is add a new link to a list. The added link cannot perform the change of **Display / Not display**.

- Add a HTML  
If it clicks a ![Add icon] **Add a HTML**, a dialog is displayed and a HTML can be added to a command bar.  
The settings are as follows.

<table>
    <thead>
        <tr>
            <th>Setting items</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Displaying name</td>
            <td>It is a name displayed on a list.</td>
        </tr>
        <tr>
            <td>HTML</td>
            <td>HTML displayed on a command bar is described.</td>
        </tr>
    </tbody>
</table>

## 6 Adding and Deleting Tab

Multiple fixed tabs can be configured.

<a name="tab_add"></a>
### 6.1 Adding Tab

Click ![Add icon] **Add Tab** button to add a tab.

<a name="tab_delete"></a>
### 6.2 Deleting Tab

Click **[X]** icon on each tab to delete the tab.  
A configuration dialog is shown, and then click **OK**.

<a name="tab_layout"></a>
## 7 Tab Configuration

There are tab name, fixed area, and initial settings of personalized area for each tab settings.  
The detail about each settings is as follows.

**Note:** Click [Apply changes] in the parent window to save the edited content even the tab settings window is opened in a different window.

### 7.1 Tab Name

Specify the tab name.  
The tab name can be specified up to 80 characters.

### 7.2 Fixed Area

A box to set a gadget to the fixed area is shown under **Select layout** button and **Edit HTML** button.

- Layout settings  
There are two ways to set the layout of fixed area, one is selecting from templates or writing HTML directly.  
Click **Select layout** button to select a layout from templates. A layout select screen is shown.  
The layout with the mouse over is highlighted. Click the highlighted layout to apply it.  
**Note:** The current settings are overwritten and all the gadget settings previously saved are discarded if the layout is changed.  
Click **Edit HTML** button to edit HTML directly.

- Gadget settings  
**Edit** (**New** for initial settings) is shown if the box is moused over.  
Click the box with **Edit **or **New** is shown to open a dialog to set gadget.  
The gadget can be set is as follows.

  - RSS reader
  - Information
  - Information with images
  - Mini Browser
  - Fragment Mini Browser
  - Calendar
  - Message
  - Popular Gadgets
  - Gadget (gadget shown in Gadget list)
  - Gadget(Specifing URL)

If you select a gadget in **Type of Gadget**, displays settings about the selected gadget.  
If you click **Preview** button after editing require items of each settings, displays the preview of the gadget.

#### 7.2.1 Gadget Header Settings

The following describes the common settings to set the default layout you can select gadgets.

<table>
    <thead>
        <tr>
            <th>Setting items</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Title</td>
            <td>Specify the title of the gadget. This item is required.<br>The title can be specified up to 80 characters.</td>
        </tr>
        <tr>
            <td>Title link</td>
            <td>Specify the link URL for the gadget title.<br>The URL can be entered up to 1024 bytes.</td>
        </tr>
    </tbody>
</table>

#### 7.2.2 Gadget Settings (common)

This section describes the common settings of all the gadgets.

<table>
    <thead>
        <tr>
            <th>Setting items</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Not displaying header</td>
            <td>Enable to hide the header of the gadget.<br>This is available only in Fixed area.</td>
        </tr>
    </tbody>
</table>

#### 7.2.3 Get Title Information

RSS reader and MiniBrowser displays the information from specified URL. But, if you select like these gadgets, displays **Get title information** button at the right of the URL text box.  
If you click **Get title information** button, settings the title and title link from the specified URL information.  
If gadgets that do not get external information like TODO list and alerm or gadgets that do not specified in-one gadget like a calendar, displays **Set to
title information** button. If you click **Set to title information**, sets the title of the gadget in the title of the menu item.  
If you click **Set to title information** button, specified the type of gadgets.

#### 7.2.4 Preview

If you click **Preview** button after editing require items of each settings, displays the preview of the gadget.

#### 7.2.5 Back to Default Settings

At the bottom of the gadget settings, displayed **Back to default settings** button. Resets each settings to default settings. The default value is the specified value in the gadget administration.

#### 7.2.6 Gadget (specifying URL)

The URL can be set directly to the menu if the gadget is placed on an HTTP server.  
Setting items are shown as follows if **Gadget (specifying URL)** in **Gadget type** is selected.

<table>
    <thead>
        <tr>
            <th>Setting items</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Gadget URL</td>
            <td>Types the URL of the gadget file.<br>The URL can type up to 1022 bytes.<br>If you click <b>Get Title Information</b>, getting the title and the link from the gadget file. And, set in <b>Title</b> and <b>Title link</b> in "Link on menu".</td>
        </tr>
    </tbody>
</table>

### 7.3 Personalized Area: Initial Display of Gadget Setting

The gadgets initially shown to the first login users can be set at Personalized area: Initial display of gadget setting.  
The gadget settings placed in the personalized area is placed to the portal page by drag-and-drop operation from menu or side menu.

![Gadget placement by drag-and-drop operation]

The gadgets are placed as above, the personalized area for first login user is shown below.

![The personailzed area of first login]

#### 7.3.1 Deleting Gadget

Click **[X]** at the header of each gadget to delete the gadget.

#### 7.3.2 Number of Column

Initial number of colomn can be set at [Column] combo box in Personalized area.

#### 7.3.3 Content Shown in Top Menu and Side Menu

The content of Top Menu and Side Menu in tab setting page is shown according to the following rules.

  * All the menu items are shown regardless of the publish setting.
    * The gadget is shown as unavailable if it is viewed by a user without its view privilege.
  * The menu tree that is set External Service URL is not shown. (It cannot be placed initially.)

#### 7.3.4 Rules for the Gadget that Cannot be Dropped more than one

The gadget that cannot be dropped more than one is checked only in the tab. Check-in tabs across the area of personalization settings for setting the default layout is not done, it is possible to configure multiple sites in another tab even if the gadgets that are more set in the menu can not be dropped.  
However, the gadget in the front tab is deleted when a user logs in at the first time if the gadget is dropped more than one.  
For example, the RSS reader in tab 2 is active, but the RSS reader in tab 2 is not placed if a RSS reader is dropped to tab 1 and tab 2 from the same Menu settings.

#### 7.3.5 If the Gadget is Deleted from Menu Settings

The gadget in Personalized area is shown as unavailable if the gadget is deleted from the corresponding Menu or the gadget itself is deleted. The unavailable gadget can be deleted.

#### 7.3.6 Display Area Settings

The area shown in the tab can be specified by **Display area** combo box.  
Both fixed area and personalized area are shown if **Both display fixed area and personalized area** is set.  
Only fixed area is shown if **Do not use the personalized area** is set.  
The gadget height is adjusted to the window height except for the header if **Display the height of a fixed area to the height of the browser** is set.

## 8 Applying User Screen

The rules by which change of an initial screen setup is applied to a user page differ depending on whether the time of initial login and a user are already login settled.

### 8.1 First Login

The page is configured according to Default Layout settings if a user log in to infoScoop OpenSource at the first time.

### 8.2 Logged in User

The default layout settings changes is reflected if the user reloads the browser.  
The configuration is applied by each locations according to the rules as follows.

#### 8.2.1 Changing Command Bar Configuration

The command bar of user's page is reload and overwritten if a user reloads the browser after changing the configuration of tabs according to <a href="#command_bar">5 The Constitution of Command Bar</a>.

**8.2.2 Adding Tab**

The added fixed tab is shown between the fixed tabs and the dynamic tabs (the tabs user added) after a user is reload the browser if a fixed tab is added according to the steps of <a href="#tab_add">6.1 Adding Tab</a>.

e.g. The tab configuration of user page is as follows.
    
    [Fixed tab 1] [Dynamic tab 1] [Dynamic tab 2]

The tab configuration is automatically changed as follows after the browser is reloaded if the fixed tab [Fixed tab2] is added.
    
    [Fixed tab 1] [Fixed tab 2] [Dynamic tab 1] [Dynamic tab 2]

#### 8.2.3 Deleting Tab

The fixed tab is not deleted, but it is changed a dynamic tab (a tab user added) without the fixed area if a fixed tab is deleted according to the steps of <a href="#tab_delete">6.2 Deleting Tab</a>. In addition, the tab changed to a dynamic tab is moved to the right edge.  
e.g. The tab configuration of user page is as follows.

    
    [Fixed tab 1] [Fixed tab 2] [Dynamic tab 1] [Dynamic tab 2]

The tab configuration is automatically changed as follows after the browser is reloaded if the fixed tab **Fixed tab2** is deleted.
    
    [Fixed tab 1] [Dynamic tab 1] [Dynamic tab 2] [The fixed tab 2 changed to a dynamic tab]

#### 8.2.3 Changing Tab Configuration

The tab configuration is applied according to the following rules if a user reloads the browser after the tab configuration is changed according to the
steps of <a href="#tab_layout">7 Tab Configuration</a>.

  * In case the fixed area layout is changed:  
All the fixed area of the user screen is overwritten by the administrator settings. The user settings of the updated gadget is turned back to the defaults.
  * In case the gadget settings of the fixed area is changed:  
Only the gadget that the setting is changed is overwritten by the administrator settings. The user settings of the updated gadget is turned back to the defaults.
  * In case the gadget settings of the personalized area is changed:  
The gadget location information of the personalized area is only active at the first log in, and it is not applied if infoScoop OpenSource is reloaded.

<a name="initialize_customize"></a>
## 9 Initializing of Customized Information

Initialization of the customized information for the user specified customization information (gadget was installed by the user, the tab has been added, the whole set) by removing the page to configure the settings by setting the default layout.

*The gadget deleted by initializing of customized information is moved to Trash Bin.

To perform the initialization of the customized information, the default layout of the control panel the **Initialization of customized information**, click on the button.  
The dialog of initializing customized information is shown.  
Type the user name whose customized information is to be initialized, and click **OK** button. The customized information of the specified user is initialized.  
The browser is forced to be reloaded if the portal screen is being opened by the specified user.


[Add icon]: ../../images/add_menu_tree.gif
[Drag icon]: ../../images/drag.gif
[Gadget placement by drag-and-drop operation]: images/default-screen/default-layout-settings-1.png
[The personailzed area of first login]: images/default-screen/default-layout-settings-2.png
