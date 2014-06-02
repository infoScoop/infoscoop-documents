# About infoScoop Administration

Provides an overview of how to manage settings of infoScoop OpenSource.

## 1 Administration Items

Administration items in infoScoop OpenSource include the following.

**Portal Settings**

  * Settings of items that appear on the top menu and side menu.
  * Settings of the site to search form.
  * Settings of Portal Header
  * Settings of Command Bar.
  * Settings of Tab and initial screen layout.
  * Common Layout
    * Portal Title
    * Inner frame content footer
    * Custom JavaScript
    * Custom Style Sheets

**System Settings**

  * Internationalization
  * Properties
  * Proxy
  * Administrators
  * Forbidden URL
  * OAuth
  * External application

These items are set up on the **administration page**.

The explanation of a administration menu is as follows.

  * HOME: The top of the administration page. Functional description and link for each administration. Statistics, and contains version information.
  * Menu: Set the menu items.
  * Search form: Registration of the search engine site used by a search service and a site search settings are performed.
  * Gadget: Default settings of each gadget, addition of a gadget, etc. are performed.
  * Layout: The common setting of a pages and a user pages composition are set up.
    * Default Layout: An arrangement settings of the gadget displayed when logged in to application for the first time is performed. Default Layout can be set as an organization unit.
    * Other Layout: A customizable component, which are the title of a portal site, a content footer in inner frame, etc., is set up.
  * I18N: Each settings corresponds to internationalization. Administration of the message to be used can be carried out on this screen.
  * Properties: Set up system properties.
  * Proxy: A proxy server can be set to the request performed from a server.
  * Administrators: The user ID which can access a administration page is managed.
  * Forbidden URL: The website which cannot be displayed with a MiniBrowser gadget is managed.
  * OAuth: A settings about OAuth related specification is performed.
  * External Apps: The settings about OAuth2 authentication of external applications that access infoScoop through the API.


## 2 Login and Start Administration Page

Connect with the following URL after logging in to application.

    http://[server name]:[port]/infoscoop/manager/

Type a suitable value according to the environment to be used about a **server name** and **port number**. If you are unsure, contact your system administrator.  
When the display of the **to Management page** link is checked by command bar settings, and an administrator logs in to application, **to Management page** link is displayed. A management screen can be displayed from this link.

## 3 Management page structure

Management page has two pane composition of the domain which displays the tab for displaying each management function, and the contents of the management function.  
The figure below is a screen after starting the managemeent page.

  1. If it clicks a title, it change at a Home.
  2. It is a menu to each management function.
  3. Displaying a message console by clicking an icon. If an error occurs, the contents of an error can be checked by a message console.
  4. The control for every management function is arranged.
  5. The main edit forms for every management function are displayed.

![Management page structure]

## 4 Home

In Home, simple explanation of each controlling function, statistical information, and version information can be referred to. Home can be displayed by click a Home tab or a administration page title portion.

### 4.1 Statistics Information

The details of Statistics Information are as follows.

<table>
    <thead>
        <tr>
            <th>Item</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Number of active users</td>
            <td>Displays the number of users currently logged on.</td>
        </tr>
        <tr>
            <td>Number of users accessed today</td>
            <td>Displays the number of users logged on to the current date.</td>
        </tr>
        <tr>
            <td>Total number of users</td>
            <td>Displays the number of users who have logged at least once so far.</td>
        </tr>
    </tbody>
</table>

### 4.2 Version Information

Version Information can be referred to on a Home.
The details of Version Information are as follows.

<table>
    <thead>
        <tr>
            <th>Item</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Product Name</td>
            <td>Displays a product name.</td>
        </tr>
        <tr>
            <td>Version</td>
            <td>Current version information.</td>
        </tr>
    </tbody>
</table>


[Management page structure]: images/about-infoscoop-administration.png
