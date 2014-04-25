# Proxy Settings

This section explains the Ajax proxy mechanism of infoScoop OpenSource and each settings of the Ajax proxy.

## 1 Ajax Proxy Mechanism

Information such as RSS and iCalendar in gadgets gets the following order.  
(Except the function of using the inner frames.)

  1. Ajax proxy of infoScoop OpenSource server receives the contents request from the web browser.
  2. Getting the data from the contents server backend.
  3. Processing the data for displaying.
  4. Response to the web browser.

![Data Communication Path of Gadgets]

Ajax proxy acts as an HTTP client against the contents server backend instead of the web browser.  
System configuration, the following considerations apply.  
If you get information from servers on the Internet, you need access to servers on the Internet through a proxy server. (see below.)  
e.g. If the communication path is configured proxy server.

![Communication Paths if Using a Proxy Server]

In this case, you must set up communication via a proxy server in Ajax proxy.  
Also, if infoScoop Opensource is deployed different networks, you must set up communication for each servers.  
For example, problems that cannot name resolution to the contents server from the network segment that deployed infoScoop OpenSource. (see below.)

![Communication Error]

If you can resolve by IP address even if cannot name resolution, can sets to translation host names into IP address.  
This feature can uses for settings to communicate directly in the network configuration has the communication between client and server through the reverse proxy.  
Ajax proxy mechanism in infoScoop OpenSource can define the following.

1. Defining proxy servers.
2. Substitution of the request URL.
3. Defining an HTTP header to send.
4. Server cache settings.

You can set to an address pattern by regular expressions.

## 2 Administration Page

Proxy settings edit in the proxy administration page of the administration
page.  
The following items are the component of the page.  
Proxy and Substitution URL

  * Address pattern
  * Proxy
    * Enable
    * Host
    * Port
    * Authentication
  * Substitution URL
  * Header transmission
  * Intranet
  * Cache settings
  	* Enable
  	* Duration (minute)
  * Delete

### 2.1 Rule of Settings

Ajax proxy compares the URL of received request with regular expressions of configured address pattern each proxy. And, applying matched settings previously.  
If you have not matching address pattern, applying the default settings.  
You can set either do nothing or a proxy server in the default settings.  
Also, the format follows the format of regular expressions in Java. Refer to the following URL.

    http://java.sun.com/j2se/1.5.0/ja/docs/ja/api/java/util/regex/Pattern.html

Address pattern switches to edit mode by clicking the table cell.  
If you press **ENTER** key or clicking elsewhere, accepts the change.  
Address patterns can be up to 512 characters.  
If you drag and drop for **switch** icon on the left of each row, switching to the order of the settings.

### 2.2 Settings of Addition and Delete

If you click [**Add**] icon, adding a settings.
If you click ![Trash icon] icon, deleting a setting.

### 2.3 Context Menu

This section explains the administration controls on the right-top of the page.

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
    	<td><img src="images/refresh.gif"/></td>
    	<td>Refresh</td>
        <td>The last state is displayed.</td>
    </tr>
	<tr>
    	<td><img src="images/apply_changes.gif"/></td>
    	<td>Apply changes</td>
        <td>Apply the changes. (save the data)</td>
    </tr>
    </tbody>
</table>

**Note:** All the changes are discarded if this icon is not clicked.

## 3 Proxy Server Settings

This section explains how to set the proxy server.  
If you use a proxy, checks to "Enable" in the proxy field. If you check it, enables the proxy server settings form.  
`Host` and `Port` of settings forms switch to the edit mode by clicking.  
Explains the proxy server settings as follows.

  * **Enable**: Enables the editing of the proxy server settings by placing a check.
  * **Host**: Types the host name or IP address of the proxy. Required if you check into **Enable**. Type up to 128 characters in host.
  * **Port**The port number of proxy. Required if you check into **Enable**. Type the number from 0 to 65535.
  * **Authentication**: If your proxy server requires authentication, specifies the credentials. If you click **Edit** icon of the authentication column, displays a dialog of proxy authentication settings. Displays the following items.
    * User name: User name for proxy server authentication.
    * Password: Password for proxy server authentication.
    * Authentication server: If you need to authenticate against ActiveDirectory, types the server name of the domain controller.

![Proxy Server Use Case]

## 4 Substitution URL Settings

Ajax proxy has the function to substitute to another URL from the URL of incoming requests. This feature is available if arranged in infoScoop OpenSource on the back end of the reverse proxy.

<table>
    <thead>
	<tr>
    	<th>Address pattern</th>
        <th>Substitute URL</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>^http://hostA/(.*)</td>
        <td>http://172.22.115.234/$1</td>
    </tr>
    </tbody>
</table>

As above, you type the substitution URL corresponding typed URL in the address pattern.  
If you click the substitution URL cell, it changes the edit mode.  
`()` matched string in the address pattern can be used by substitution URL.  
For the above table setting, `http://hostA/rss.xml` replaces
`http://172.22.115.234/rss.xml`. And, Ajax proxy request it.

![Substitution of the Request URL]

## 5 HTTP Headers Transmission Settings

You can choose the following two options of the HTTP headers contain in the received request from the web browser to Ajax proxy.

  1. Containing in all headers.
  2. Containing in only specified HTTP headers.

You set HTTP headers transmission settings to the page that displayed clicking edit icon in the header transmission column.

### 5.1 Send All Headers

The request contains in the received all request headers in Ajax proxy for backend. If it does, selecting **Send all headers** radio button in HTTP headers transmission settings.

**Note:** you must set disable for external sites.There is a risk of leaking personal information to the Internet.

### 5.2 Select Headers to Send

By default, sending only the registered headers INNA (RFC4229).  
On the page, selecting **Select headers to send** and enabling the check boxes of the registered headers INNA.  
If you use your own header transmission such as single sign-on, adding the required headers.  
If you select the individual settings and default settings, such a figure below.  
Do not send `is-user` to the contents server of RSS feed. Because, it isn't the registered headers INNA.
You need to add your own header name manually to send `is-user` header to the backend server for RSS feed.

![Custom Headers Transmission]

**Note:** Ajax proxy adds HTTP headers automatically about Host, User-Agent and Content-Length to the server request.

### 5.3 Setting the Sending Cookie

For cookie header, you can set cookie header to transmission. And, you can set
cookie with specified name to transmission.

  * **Send all cookies**: Sending information of all cookie. 
  * **Not sending cookies**: Shut off all information in the cookie header. 
  * **Specify sending cookies**: Sending only cookies with specified name to backend.

In order to add a Cookie name, **Specify sending cookies** is chosen, and the [**Add**] button is clicked after inputting a Cookie name in the text box under the radio button.  
If you select **Specify sending cookies** and clicking **Save** without cookie name, selecting the same **Not ending cookies** at the save.  
Also, if you select **Send all headers**, **Send all cookies** is selected.

<a name="proxy_manage_intranet"></a>
## 6 Intranet Settings

This is a security setting. If you set to disable intranet, it performs the following security measures to target sites.

  * If you display a detail of RSS item, removes the dangerous code for cross-site scripting. (RSS Reader, Multi-RSS Reader)
  * Do not automatic log in by loginCredentialAuthType. (RSS Reader, FragmentMiniBrowser)

If enabled, it does not perform the above security.  
Recommend that this setting disable.

## 7 Server Cache Settings

If you have intensive environments such as Internet connection to the outside, you can set to shared server cache to maintain connection performance.  
You can set to enable cache or disable cache by each proxy settings of the specified address pattern in the server cache.  
At the address specified pattern, if the cache setting is enabled, the set period will be reused infoScoop server information is stored in the header or body of each URL that matches the address pattern.  

**Note:** The server cache is valid only for GET requests.

If you check `Enable` check box in **Cache settings**, `Duration(minute)` contains 10. If you click text box in column in `Duration(minute)`, you can edit duration.  
The maximum duration is 1440 per one day.

## 8 Required Settings

infoScoop OpenSource specify some settings such as the menu settings, the search settings, holiday settings (Do not change) by the URL.

## 9 Precaution

If you set the proxy server in `Default settings`, you need to add the internal contents server through Ajax proxy settings as directly access.  
If you do not set **Proxy** and **Substitution URL**, settings becomes directly access.


[Trash icon]: ../../images/trash.gif
[Data Communication Path of Gadgets]: images/proxy-management/proxy-settings-1.png
[Communication Paths if Using a Proxy Server]: images/proxy-management/proxy-settings-2.png
[Communication Error]: images/proxy-management/proxy-settings-3.png
[Proxy Server Use Case]: images/proxy-management/proxy-settings-4.png
[Substitution of the Request URL]: images/proxy-management/proxy-settings-5.png
[Custom Headers Transmission]: images/proxy-management/proxy-settings-6.png
