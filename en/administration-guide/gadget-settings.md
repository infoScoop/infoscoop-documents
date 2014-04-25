# Gadget Settings

This section explains how to manage gadgets.

## 1 What Is Gadget?

A gadget is a window like panel placed in a page of infoScoop OpenSource, and it is a basic unit that makes up users' page.

## 2 Gadget vs. Widget

A unit placed in a screen of infoScoop is called gadget or widget.  
Gadget and widget are used interchangeably in infoScoop, but they are defined as follows.

### 2.1 About Gadget

Strictly, a gadget is a part that made with old version of Google Gadget API specification or a part made with OpenSocial API specification.

**Note:** Latest infoScoop only supports Gadget Core API of OpenSocial API.

To use a gadget, register it in the repository database of infoScoop OpenSource, or call it directly from inside or outside of company's web server.

**Note:** If a gadget from outside of company's network is used, pay attention to unauthorized access from it to the other gadgets and infoScoop because the gadget is operated as a content within the same domain server that infoScoop is deployed.

To solve this problem, the gadgets not registered in infoScoop must be operated in a different domain. For details, refer to <a href="properties-settings.md#9_2_gadgetProxyURL">9.2 gadgetProxyURL</a>.

### 2.2 About Widget

A widget is a part that can be used only in infoScoop.  
The frequently used common parts such as RSS reader and Schedule are optimized for the infoScoop server.  
Widgets are referred to as "Built-in Gadgets" in Administration page.

## 3 Gadget Placement and Corresponding Administration Page

Gadget placement of users' page and the corresponding Administration pages are as follows.

<table>
    <thead>
	<tr>
    	<th>Place</th>
        <th>Corresponding Administration Page</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Top Menu</td>
        <td><b>Menu</b> Administration Page</td>
    </tr>
	<tr>
    	<td>Side Menu</td>
        <td><b>Menu</b> Administration page</td>
    </tr>
	<tr>
    	<td>Command Bar</td>
        <td><b>Layout</b> - <b>Default Screen</b> administration page - <b>commandbar</b> tab</td>
    </tr>
	<tr>
    	<td>Fixed Area</td>
        <td><b>Layout</b> - <b>Default Screen</b> Administration page - <b>tab (tub number)</b> tab - Fixed Area settings</td>
    </tr>
	<tr>
    	<td>Personalized Area</td>
        <td><b>Layout</b> - <b>Default Screen</b> Administration page - <b>tab (tab number)</b> tab - Personalized Area settings</td>
    </tr>
    </tbody>
</table>

## 4 Default Values of User Settings and Application

Each gadget has user's setting values (UserPref). (According to the gadget specification, module settings are written in XML, and user's settings are written in /Module/UserpPref element.)  
A gadget is initially placed from Menus or Default Screen settings, and the default values applied to UserPrefs are from the values configured in Administration page.  
The default values of user's setting are configured in as follows.

  * Gadget settings (Administration page)
  * Menu settings (Administration page)
  * User settings (setting panel of dropped gadget)

If a gadget is added from Menu, the order of priority to apply the default value of user's setting is as follows.

  1. The value configured in Gadget settings (Administration page)
  2. The value configured in Menu settings (Administration page)
  3. The value configured in User settings (setting panel of dropped gadget)

Shortly, the values configured in Menu settings are updated by default values at first, and the UserPrefs configured in Gadget settings and Menu settings are all copied if a gadget is added to the screen at second. Finally, UserPrefs except for URL cannot be edited in Administration page.  
The default value of a UserPref with "hidden" datatype cannot be edited in Gadget Administration page. (A user's setting that the datatype attribute of UserPref element is "hidden" is defined as an item that users cannot edit.)  
The default value of a UserPref with "hidden" datatype can be edited in gadget settings page in Menu or Default Screen Administration page.


## 5 Gadget Administration Page

To show Gadget setting page, select **Gadget** in Administration page.  
Common settings of each gadget and the default values of properties that users can edit, are configured in Gadget setting page.  
In addition, gadgets are added and initially configured in this page as well.  
The list of Built-in Gadgets is initially hidden. Click the header to show or hide the list.

### 5.1 Gadget Settings

The selected gadget is highlighted and the item edited is shown on the right side if a gadget is selected from Gadget list.

#### 5.1.1 Editing Gadget Settings

Common properties of the selected gadget are shown in **Gadget settings**.  
If it is a gadget, the attribute value of Module/ModulePrefs is to be edited.  
However, `title`, `title_url`, `directory_title`, `height`, and `singleton` are the only attributes that can be edited.

#### 5.1.2 Editing User Settings (Default Values)

The default values of gadget user's settings are configured in **User settings (default value)**.  
If it is a gadget, the attribute value of Module/ModulePrefs@default_value is to be edited.

### 5.2 Adding and Modifying a Gadget

To add (upload) a gadget to infoScoop server, specify a gadget configuration XML file or a compiled ZIP file including a gadget configuration file, release bundles, css files etc.  
The gadget configuration file must be placed directly under the unzipped root directory if it is a ZIP file.  
The name of ZIP file without extension must be used for the gadget configuration file name with XML extension.  
For example, here is a ZIP file which contains the unzipped directory as follows.

C:\Hello  
|_Hello.xml  
|_ALL_ALL.xml  
|_ja_ALL.xml

If Hello.zip is unzipped, Hello.xml is considered as a gadget configuration file.  
Each uploaded files can be accessed with relative paths from their assigned URLs. The URL that a gadget file is placed is defined as `__IS_GADGET_BASE_URL__`.

In the above case, ALL_ALL.xml is written in the gadget configuration file as follows.

    <Locale messages="__IS_GADGET_BASE_URL__/ALL_ALL.xml"/>

#### 5.2.1 Adding a Gadget

To add a gadget, click **Add Gadget** in the upper right of Gadget Administration page.  
A dialog for uploading a gadget is shown.  
Click **Browse** button and select a gadget to upload.  
Select a file and click **Upload** button. The gadget is uploaded to infoScoop server and added to **Gadget List**.

#### 5.2.2 Updating a Gadget

**Update Gadget** button is shown in the setting form if a gadget is selected from Gadget list.  
Gadget upload form, gadget configuration xml, and a list of resources used by the gadget are shown if **Update Gadget** button is clicked.

- Gadget Upload Form  
All the contents are overwritten and saved if a gadget configuration file or a
ZIP type gadget is uploaded from the gadget upload form.
- Gadget Resources  
The operations in this item are as follows.
  - Download in Bundle  
The contents of a gadget saved currently in the infoScoop server can be downloaded as a ZIP file by clicking **Download in bundle** button.
  - Edit a Gadget Resource  
An editing form is shown in a modal window and the contents of each file can be edited directly if the **Edit** icon of gadget configuration file or resource bundle files is clicked.  
The edited contents are saved if **Save Settings** is clicked.  
The window is closed and the edited contents are discarded if **Cancel** or outside of the window is clicked.  
**Note:** Only a text file encoded in UTF-8 can be edited.
 - Upload a Gadget Resource  
A form for uploading a locally edited file separately is shown in a modal window if **Upload** is clicked.  
The file is updated if a file is selected and uploaded by clicking **Upload** button.  
The window is closed if **Cancel** or outside of the window is clicked.
 - Delete a Gadget Resource  
Gadget files except for gadget configuration file can be deleted by **Delete** icon.  
A confirm dialog is shown if **Delete** icon is clicked.  
The resource is deleted if **OK** is clicked.  
The resource is not deleted and the dialog is closed if **Cancel** is clicked.
 - Add a Gadget Resource  
A new resource can be added to the folder by clicking **Add Resource**.  
A form to upload a file is shown in a modal window by clicking **Add Resource** menu.  
A resource is created if a file is selected by clicking **Browse** button and **Upload** button.  
The window is closed if **Cancel** or outside of the window is clicked.

#### 5.2.3 Deleting a Gadget

**Delete Gadget** button is shown in the setting form if a gadget is selected from Gadget list.  
The gadget is deleted if **Delete Gadget** button is clicked.

## 6 Descriptions of Each Gadget

This section explains about the gadgets that infoScoop provies.

### 6.1 Gadget Placement

Some gadgets can be placed only in specific areas.  
The following table shows where the gadgets can be placed.

<table>
    <thead>
	<tr>
    	<th>Setting items</th>
        <th>Menu</th>
        <th>Command bar</th>
    	<th>Fixed area</th>
        <th>Personalized area</th>
	</tr>
    </thead>
    <tbody>
	<tr>
    	<td>Calendar</td>
        <td>Yes</td>
        <td>No</td>
    	<td>Yes</td>
        <td>Yes</td>
	</tr>
	<tr>
    	<td>RSS Reader</td>
        <td>Yes</td>
        <td>No</td>
    	<td>Yes</td>
        <td>Yes</td>
	</tr>
	<tr>
    	<td>Multi-RSS Reader</td>
        <td>Yes</td>
        <td>No</td>
    	<td>No</td>
        <td>Yes</td>
	</tr>
	<tr>
    	<td>MiniBrowser</td>
        <td>Yes</td>
        <td>No</td>
    	<td>Yes</td>
        <td>Yes</td>
	</tr>
	<tr>
    	<td>FragmentMiniBrowser</td>
        <td>Yes</td>
        <td>No</td>
    	<td>Yes</td>
        <td>Yes</td>
	</tr>
	<tr>
    	<td>Message</td>
        <td>Yes</td>
        <td>No</td>
    	<td>Yes</td>
        <td>Yes</td>
	</tr>
	<tr>
    	<td>Popular Gadgets</td>
        <td>Yes</td>
        <td>No</td>
    	<td>Yes</td>
        <td>Yes</td>
	</tr>
	<tr>
    	<td>Information</td>
        <td>No</td>
        <td>No</td>
    	<td>Yes</td>
        <td>No</td>
	</tr>
	<tr>
    	<td>Image Information</td>
        <td>No</td>
        <td>No</td>
    	<td>Yes</td>
        <td>No</td>
	</tr>
	<tr>
    	<td>Ranking</td>
        <td>No</td>
        <td>Yes</td>
    	<td>No</td>
        <td>Yes</td>
	</tr>
	<tr>
    	<td>Ticker</td>
        <td>No</td>
        <td>Yes</td>
    	<td>No</td>
        <td>No</td>
	</tr>
	<tr>
    	<td>Gadget (Specifying URL)</td>
        <td>Yes</td>
        <td>No</td>
    	<td>Yes</td>
        <td>Yes</td>
	</tr>
    </tbody>
</table>

Added gadgets and the gadgets other than above can be placed in any place except for Command bar.  
The settings of each gadget and built-in gadget are explained below.

### 6.2 Calendar

Calendar loads the specified iCalendar file and shows the events in month view calendar.  
The gadget setting items are as follows.

<table>
    <thead>
	<tr>
    	<th>Setting items</th>
        <th>Descriptions</t>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Auto update</td>
        <td>Enable this to update automatically.</td>
    </tr>
	<tr>
    	<td>iCalendar configuration settings</td>
        <td>Configure iCalendar to show in Event calendar.<br>Edit the text carefully because it is in JSON format. For settings, refer to the following.</td>
    </tr>
    </tbody>
</table>

iCalendar settings are described as follows.

<table>
    <thead>
	<tr>
    	<th>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>iCals</td>
        <td>Specify calendar information to show in Event calendar. Multiple settings of each calendar can be specified.</td>
    </tr>
	<tr>
    	<td align="right">Array</td>
        <td>It contains an array of calendar settings.</td>
    </tr>
	<tr>
    	<td>MonthlyiCals</td>
        <td>Specify calendar information to show in Event calendar. Use this only to get the information of the month specified. Multiple settings of each calendar can be specified.</td>
    </tr>
	<tr>
    	<td align="right">Array</td>
        <td>It contains an array of calendar settings.</td>
    </tr>
	<tr>
    	<td>Calendar settings</td>
        <td>It contains calendar information.</td>
    </tr>
	<tr>
    	<td align="right">URL</td>
        <td>Specify the location of calendar information. Specify year and month as parameters of URL if it is a child element of monthlyCals. The year and the month configured for those parameters are set to the parameters if the
displaying month is changed in Calendar.</td>
    </tr>
	<tr>
    	<td align="right">DisplayType</td>
        <td>Specify how to show events on calendar.<br>
        	<ul>
            	<li>font: the date is colored in the color specified by the color attribute if there is an event. The color specified in the font is used if font is set to several display attributes of iCal element.</li>
                <li>block: a small block is shown with the color specified in color attribute if there is an event.</li>
            </ul>
  		</td>
    </tr>
	<tr>
    	<td align="right">Color</td>
        <td>Specify a color to show events.</td>
    </tr>
    </tbody>
</table>

A setting example is as follows.

*iCalendar setting example*
    
    {  
      iCals : [  
        {url : "http://weather.livedoor.com/forecast/ical/13/63.ics",  
         displayType : "block",  
         color : "#F99"},  
        {url : "http://localhost:8080/infoscoop/holiday.xml",  
         displayType : "font",  
         color : "#F00"}  
      ],  
      monthlyiCals : [  
        {url : "http://localhost:8080/infoscoop/js/widgets/calendar/ics/  
            monthlyCalendar.jsp?year=${year}&month=${month}",  
         displayType : "block",  
         color : "#9F9"}  
      ]  
    }

There is No user setting for iCalendar.

### 6.3 RSS Reader

Those settings are applied to RSS readers within Multi-RSS reader as well.  
The gadget setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Auto update</td>
        <td>Enable this to update automatically.<br>Background color<br>Specify the default color of background.</td>
    </tr>
	<tr>
    	<td>Title edit</td>
        <td>Specify whether the title of gadget can be edited or not.</td>
    </tr>
	<tr>
    	<td>Date format</td>
        <td>Specify a format to show the date of RSS items.<br>Refer to <a href="#date-format">Date format can be used</a> for details.
</td>
    </tr>
	<tr>
    	<td>Use Access Stat</td>
        <td>Specify whether an access stat icon is shown or not.<br>Specify whether an access stat icon is shown or not.<br>Access stat data is saved in the database regardless of this setting.Refer to <a href="properties-settings#6_1_accessLogEntry">accessLogEntry</a> for details.</td>
    </tr>
    </tbody>
</table>

User setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>RSS URL</td>
        <td>Specify RSS or Atom URL to show in RSS reader.<br>The URL can be entered up to 1024 bytes.<br>Get <b>Title information</b> button is shown next to RSS URL text box in the gadget setting dialog of Menu Administration page or Default Screen Administration page. RSS is loaded from the specified URL, and <b>Title</b> and <b>Title Link</b> is automatically set if <b>Get Title information</b> button is clicked.</td>
    </tr>
	<tr>
    	<td>Line break</td>
        <td>Specify whether line feed is inserted or not if the title of RSS item does not fit the gadget's width.</td>
    </tr>
	<tr>
    	<td>Show date time</td>
        <td>Specify whether date and creator of RSS item are shown or not.</td>
    </tr>
	<tr>
    	<td>Number of articles</td>
        <td>Specify the number of RSS items to show.</td>
    </tr>
	<tr>
    	<td>Scroll mode</td>
        <td>Specify scroll mode.<br>
        	<ul>
            	<li>Scroll: The scroll bar is shown.</li>
                <li>None: The scroll bar is not shown.</li>
            </ul>
		</td>
    </tr>
	<tr>
    	<td>Detail display mode</td>
        <td>Specify Detail display mode of RSS items.<br>
        	<ul>
            	<li>Inline: The detail is shown in inline (inside the gadget.)</li>
            	<li>Popup: The detail is shown in a popup window.</li>
            </ul>
		</td>
    </tr>
	<tr>
    	<td>Contents display mode</td>
        <td>Specify the target of RSS item link.<br>
        	<ul>
            	<li><b>Auto detect</b>: <b>Frame in portal</b> or <b>New window</b> is applied according to displayInlinHost property settings. Refer to <a href="#displayInlineHost">Property displayInlineHost</a> for details.</li>
            	<li><b>Frame in portal</b>: Linked sites are displayed in the inner frame in portal.</li>
            	<li><b>New window</b>: Linked sites are displayed in another window.</li>
            </ul>
		</td>
    </tr>
	<tr>
    	<td>Filter by title</td>
        <td>Specify criteria to filter RSS items by title.<br>The RSS items that match with the criteria are only shown.<br>The format can be used as follows:<br>
        	<ul>
            	<li>AND search: "A B" (including A and B)</li>
            	<li>OR search: "A OR B" (including A or B)</li>
            	<li>NOT search: "-A" (not including A)</li>
            	<li>Priority by brackets: "(A OR B) C" (including A or B at first, and including C)<br>e.g. (Tokyo OR Osaka) News -Lifestyles</li>
            </ul>
		</td>
    </tr>
	<tr>
    	<td>Filter by creator</td>
        <td>Specify criteria to filter RSS item by creator.<br>The RSS items that the creator starts with the criteria are only shown.</td>
    </tr>
	<tr>
    	<td>Filter by category</td>
        <td>Specify criteria to filter RSS items by category.<br>The RSS items which the attribute entry/category/@term of ATOM or the element item/category of RSS matches completely with the criteria are only shown.</td>
    </tr>
	<tr>
    	<td>Authentication type</td>
        <td>The gadget becomes an authentication gadget that can load the RSS of an authentication site if Authentication type is set.<br>
        	<ul>
            	<li><b>none</b>: No authentication settings.</li>
            	<li><b>basic</b>: Specify if Basic authentication is needed to load RSS.</li>
            	<li><b>ntlm</b>: Specify if NTLM authentication is needed to load RSS.</li>
            	<li><b>postCredential</b>: Specify for posting the user ID and the password which are set in gadget when RSS is loaded.<br>A text box for specifying the parameter name of user id and password which are included in POST data is shown if postCredential is selected. The parameter name of user id becomes "is-user" and the parameter name of password becomes "is-passwd" if both parameter names are not specified.</li>
            	<li><b>postPortalCredential</b>: Specify for posting the user ID and the password of logged in user when RSS is loaded. A text box for specifying the parameter name of user id which is included in POST data is shown if postPortalCredential is selected. The parameter name of user id is "is-user" if the parameter name is not specified.</li>
            	<li><b>sendPortalCredentialHeader</b>: Specify for sending the header including the user id of the user logged in.<br>A text box for specifying the header name that sends user id is shown if sendPortalCredentialHeader is selected. The header name of user id is "is-user" if the header name is not specified.</li>
            	<li><b>signed</b>: Specify for making a signed request to the destination web service.Signed request is making a request that has a signature with RSA certificate to the destination web service. The request during calling the service can be detected tampering at the destination web service by using signature.<br>Refer to <a href="oauth-administration">OAuth administration</a> for setting certificate.

The destination web service needs to support the signed request to use signed
request.</li>
            </ul>
			<b>Note:</b> Headers other than INNA registered header (RFCA4229) are not sent with normal proxy settings. Modification of proxy settings is also required to match with the header name specified. Refer to <a href="proxy-settings">Send HTTP Header settings</a> for details.<br><br>An authentication information register form is shown if a gadget is dropped
with "basic", "ntlm", or "postCredential" specified.</td>
    </tr>
    </tbody>
</table>

### 6.4 Multi-RSS Reader

These settings are applied if Multi-RSS reader is displayed by time.  
The settings of Multi-RSS reader is the settings of the child RSS reader of Multi-RSS reader.  
The gadget setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Auto update</td>
        <td>Enable this to update automatically.</td>
    </tr>
	<tr>
    	<td>Background color</td>
        <td>Specify the default color of background.</td>
    </tr>
	<tr>
    	<td>Title edit</td>
        <td>Specify whether the title of gadget can be edited or not.</td>
    </tr>
    <tr>
    	<td>Date format</td>
        <td>Specify a format to show the date of RSS items.<br>Refer to <a href="#date-format">Date format can be used</a> for details.</td>
    </tr>
   	<tr>
    	<td>Use Access Stat</td>
        <td>Specify whether an access stat icon is shown or not.<br>Access stat data is saved in the database regardless of this setting. Refer to <a href="properties-settings#6_1_accessLogEntry">accessLogEntry</a> for details.</td>
    </tr>
    </tbody>
</table>

The user setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Line break</td>
        <td>Specify whether inserting line breaks or not if the title of RSS item does not fit to the width of the gadget.</td>
    </tr>
	<tr>
    	<td>Show date time</td>
        <td>Specify whether date and creator of RSS item are shown or not.</td>
    </tr>
	<tr>
    	<td>Scroll mode</td>
        <td>Specify scroll mode.<br>
        	<ul>
            	<li><b>Scroll</b>: The scroll bar is shown.</li>
            	<li><b>None</b>: The scroll bar is not shown.</li>
            </ul>
    	</td>
    </tr>
	<tr>
    	<td>Detail display mode</td>
        <td>Specify Detail display mode of RSS items.<br>
        	<ul>
            	<li><b>Inline</b>: The detail is shown inside an inline (inside the gadget.)</li>
            	<li><b>Popup</b>: The detail is shown inside a popup window.</li>
            </ul>
        </td>
    </tr>
	<tr>
    	<td>Contents display mode</td>
        <td>Specify the target of RSS item link.<br>
        	<ul>
            	<li><b>Auto detect</b>: Frame in portal or New window is applied according to displayInlinHost property settings. Refer to <a href="#displayInlineHost">Property displayInlineHost</a> for details.</li>
            	<li><b>Frame in portal</b>: Linked sites are displayed in the inner frame in portal.</li>
            	<li><b>New window</b>: Linked sites are displayed in another window.</li>
            </ul>
		</td>
    </tr>
	<tr>
    	<td>Filter by title</td>
        <td>Specify criteria to filter RSS items by title.<br>The RSS items that match with the criteria are only shown.<br>However, this setting is only used if Display by time is applied.<br>The format can be used as follows:<br>
        	<ul>
            	<li>AND search: "A B" (including A and B)</li>
            	<li>OR search: "A OR B" (including A or B)</li>
            	<li>NOT search: "-A" (not including A)</li>
            	<li>Priority by brackets: "(A OR B) C" (including A or B at first, and including C)<br>e.g. (Tokyo OR Osaka) News -Lifestyles</li>
            </ul>
    	</td>
    </tr>
	<tr>
    	<td>Filter by creator (creatorFilter)</td>
        <td>Specify criteria to filter RSS item by creator.<br>The RSS items that the creator starts with the criteria are only shown.<br>However, this setting is only used if Display by time is applied.<br></td>
    </tr>
	<tr>
    	<td>Filter by category (categoryFilter)</td>
        <td>Specify criteria to filter RSS items by category.<br>The RSS items which the attribute entry/category/@term of ATOM or the element item/category of RSS S matches completely with the criteria are only shown.<br>However, this setting is only used if Display by time is applied.</td>
    </tr>
    </tbody>
</table>

### 6.5 MiniBrowser

The gadget setting items are as follows.

<table>
    <thead>
	<tr>
    	<th>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Auto update</td>
        <td>Enable this to update automatically.</td>
    </tr>
	<tr>
    	<td>Title edit</td>
        <td>Specify whether the title of gadget can be edited or not.</td>
    </tr>
    </tbody>
</table>

The user setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>WebSite URL</td>
        <td>Specify the URL of a web site.<br>The URL can be entered up to 1024 bytes.<br><b>Get Title information</b> button is shown next to Website URL textbox in the gadget setting dialog of Menu settings page and Default Screen settings page. <b>Title</b> and <b>Title Link</b> is automatically set from the specified web site if <b>Get Title information</b> button is clicked.</td>
    </tr>
	<tr>
    	<td>Header link display</td>
        <td>Specify the target of the links within the web page.<br>
        	<ul>
            	<li><b>Auto detect</b>: Frame in portal or New window is applied according to displayInlinHost property settings. Refer to <a href="#displayInlineHost">Property displayInlineHost</a></li>
            	<li><b>Frame in portal</b>: Linked sites are displayed in the inner frame in portal.</li>
            	<li><b>New window</b>: Linked sites are displayed in another window.</li>
            </ul>
		</td>
    </tr>
	<tr>
    	<td>Height</td>
        <td>Specify the default height of MiniBrowser gadget by pixel.</td>
    </tr>
    </tbody>
</table>

### 6.6 FragmentMiniBrowser

These settings are applied to the Mini-Browser that shows the selected part of the web site.  
The gadget setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Auto update</td>
        <td>Enable this to update automatically.</td>
    </tr>
	<tr>
    	<td>Title edit</td>
        <td>Specify whether the title of gadget can be edited or not.</td>
    </tr>
    </tbody>
</table>

The user setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>WebSite URL</td>
        <td>Specify the URL of a web site.<br>The URL can be entered up to 1024 bytes.<br><b>Get Title information</b> button is shown next to Website URL textbox in the gadget setting dialog of Menu settings page and Default Screen settings page. <b>Title</b> and <b>Title Link</b> is automatically set from the specified web site if <b>Get Title information</b> button is clicked.</td>
    </tr>
	<tr>
    	<td>XPath</td>
        <td>A frame to select the part to be displayed is shown and the specified web site is loaded in it if <b>Select fragment area</b> button is clicked.<br>Borders are shown at the part that can be selected if the mouse is moved inside the frame, and the path of HTML element with the selected border is shown in the XPath text box.<br>A dialog to select the element is shown by right-click, and the path currently selected is set to <b>XPath</b> text box if the dialog is clicked.</td>
    </tr>
	<tr>
    	<td>Contents display mode</td>
        <td>Specify the target of the links within the web page.<br>
        	<ul>
            	<li><b>Frame in portal</b>: Linked sites are displayed in the inner frame in portal.</li>
            	<li><b>New window</b>: Linked sites are displayed in another window.</li>
            	<li><b>Auto detect</b>: Frame in portal or New window is applied according to displayInlinHost property settings.</li>
            </ul>
		</td>
    </tr>
	<tr>
    	<td>Height</td>
        <td>Specify the default height of MiniBrowser gadget by pixel.<br>The gadget height is automatically set according the height of the fragment page information if "auto" is specified.</td>
    </tr>
	<tr>
    	<td>Character Set</td>
        <td>Specify character set of web site.<br>Character set of the page is automatically detected if it is not specified.<br>Garbage characters might be shown if necessary meta data does not exist in HTML or specified character set does not match with the meta data information.<br>Specify the character set manually to show the page contents properly.<br>Refer to IANA Character Set Registry <a href="http://www.iana.org/assignments/character-sets">http://www.iana.org/assignments/character-sets</a> for specfying character set names.<br>Verified character sets are "UTF-8", "Shift_JIS", and "EUC-JP".</td>
    </tr>
	<tr>
    	<td>Use Cache</td>
        <td>Enable to cache the selected page at a given time on the server. In addition, <b>Cache life time (minute)</b> text box is enabled.</td>
    </tr>
	<tr>
    	<td>Cache life time</td>
        <td>Specify the valid time to cache the selected page by minute.<br>The default time is 360 minutes (6 hours.)</td>
    </tr>
	<tr>
    	<td>Authentication type</td>
        <td>The gadget must to be set as an authentication gadget if the web site shown in the gadget requires authentication.<br>
        	<ul>
            	<li><b>none</b>: No authentication settings.</li>
            	<li><b>basic</b>: Specify if Basic authentication is needed to load RSS.</li>
            	<li><b>ntlm</b>: Specify if NTLM authentication is needed to load RSS.</li>
            	<li><b>postCredential</b>: Specify for posting the user ID and the password which are set in a gadget when RSS is loaded.<br>A text box to specify the parameter name of user id and password which are included in POST data is shown if postCredential is selected. The parameter names of user id and password are "is-user" and "is-passwd" if parameter name is not specified.</li>
            	<li><b>postPortalCredential</b>: Specify for posting the user ID and the password of logged in user when RSS is loaded. A text box for specifying the parameter name of user id which is included in POST data is shown if postPortalCredential is selected. The parameter name of user id is "is-user" if the parameter name is not specified.</li>
            	<li><b>sendPortalCredentialHeader</b>: Specify for sending the header including the user id of the user logged in.<br>A text box for specifying the header name that sends user id is shown if sendPortalCredentialHeader is selected. The header name of user id is "is-user" if the header name is not specified.</li>
            	<li><b>signed</b>: Specify for making a signed request to the destination web service. Signed request is making a request that has a signature with RSA certificate to the destination web service. The request during calling the service can be detected tampering at the destination web service by using signature.<br>Refer to <a href="oauth-administration">OAuth
Administration</a> for setting cetificate.<br>The destination web service needs to support the signed request to use signed request.</li>
            </ul>
<b>Note:</b> Headers other than INNA registered header (RFCA4229) are not sent with normal proxy settings. Modification of proxy settings is also required to match with the header name specified. Refer to <a href="proxy-settings">Send HTTP Header
settings</a> for details.<br><br>An authentication information register form is shown if a gadget is dropped with "basic", "ntlm", or "postCredential" specified.</td>
    </tr>
	<tr>
    	<td>Additional CSS</td>
        <td>Specify CSS to be applied to the selected page.<br>Basically, add CSS to fix the collapsed layout of the selected page.</td>
    </tr>
    </tbody>
</table>

### 6.7 Message

This is a gadget to send an asynchronous messages to other users.  
The gadget setting items are as follows.

<table>
    <thead>
	<tr>
    	<th>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>User search form settings</td>
        <td>Configure to use a user search service.<br>This is used to search for a destination to send an article.<br>The setting procedure is as follows.<br>Specify the user search service that was set during installing infoScoop
OpenSource.<br>Edit the following <b>Bold</b> part of text according to the user search service that was set during installing infoScoop OpenSource.<br>
<pre>
    [
      {module:"<b>MSD_IDS</b>", name:"User"}
    ]
</pre>
Specify module as follows.<br>
        	<ul>
            	<li>MSD_IDS: Specify "MSD_IDS" if the user search service is integrated with the user master of MSD2005-S.</li>
            	<li>LDAP: Specify "LDAP" if the user search service is integrated with LDAP.</li>
            </ul>
There are three conditions for user search: name, mail, and belonging. Mail and belonging can be omitted to search.<br>Write "mailOmit:true" to omit mail.<br>Write "belongOmit:true" to omit belonging.<br>The following example shows how to omit both mail and belonging from user search conditions.
<pre>
    [
     {
        module:"<b>MSD_IDS</b>",
        name:"User",
        <b>mailOmit:true</b>,
        <b>belongOrg:true</b>
      }
    ]
</pre>
</td>
    </tr>
	<tr>
    	<td>Information message is available for only administrator</td>
        <td>If this is enabled, the feature to send a notification message to all the users can be used by the administrator only.</td>
    </tr>
    </tbody>
</table>

### 6.8 Popular Gadget

This is a gadget to show the list of popular gadgets.  
The gadget setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Auto update</td>
        <td>Enable this to update automatically.</td>
    </tr>
	<tr>
    	<td>Display Num</td>
        <td>Specify the number of items to show.</td>
    </tr>
	<tr>
    	<td>Cache Life Time (Minute)</td>
        <td>Specify the time to recount popular gadgets.</td>
    </tr>
    </tbody>
</table>

### 6.9 Information and Image Information

Information and Image Information are simplified RSS reader.  
Image Information shows a creator image that is specified at XML escaped src tag in creator element of RSS item.

```
<dc:creator>&lt;img src="http://<hostname>/image/213.gif"&gt; </dc:creator>
```

The gadget setting items are as follows.

<table>
    <thead>
    <tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Auto update</td>
        <td>Enable this to update automatically.</td>
    </tr>
	<tr>
    	<td>Background color</td>
        <td>Specify the default color of background.</td>
    </tr>
	<tr>
    	<td>Date format</td>
        <td>Specify a format to show the date of RSS items.<br>Refer to <a href="#date-format">Date format can be used</a> for details.</td>
    </tr>
	<tr>
    	<td>Use Access Stat</td>
        <td>Specify whether an access stat icon is shown or not.<br>Access stat data is saved in the database regardless of this setting. Refer to <a href="properties-settings#6_1_accessLogEntry">accessLogEntry</a> for details.</td>
    </tr>
    </tbody>
</table>

User setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>RSS URL</td>
        <td>Specify the URL of RSS feed.<br>The URL can be entered up to 1024 bytes.<br>The title and the link are loaded from the RSS of specified URL and set <b>Title</b> and <b>Title link</b> at Menu link settings by clicking <b>Get title
information</b> button.</td>
    </tr>
	<tr>
    	<td>Authentication type</td>
        <td>The gadget becomes an authentication gadget that can load the RSS of an authentication site if Authentication type is set.<br>
        	<ul>
            	<li><b>none</b>: No authentication settings.</li>
            	<li><b>basic</b>: Specify if Basic authentication is needed to load RSS.</li>
            	<li><b>ntlm</b>: Specify if NTLM authentication is needed to load RSS.</li>
            	<li><b>postCredential</b>: Specify for posting the user ID and the password which are set in a gadget when RSS is loaded.<br>A text box to specify the parameter name of user id and password which included in POST data is shown if postCredential is selected. The parameter name of user id becomes "is-user" and the parameter name of password becomes "is-passwd" if both parameter names are not specified.</li>
            	<li><b>postPortalCredential</b>: Specify for posting the user ID and the password of logged in user when RSS is loaded. A text box for specifying the parameter name of user id which is included in POST data is shown if postPortalCredential is selected. The parameter name of user id is "is-user" if the parameter name is not specified.</li>
            	<li><b>sendPortalCredentialHeader</b>: Specify for sending the header including the user id of the user logged in.<br>A text box for specifying the header name that sends user id is shown if sendPortalCredentialHeader is selected. The header name of user id is "is-user" if the header name is not specified.</li>
            </ul>
<b>Note:</b> Headers other than INNA registered header (RFCA4229) are not sent with normal proxy settings. Modification of proxy settings is also required to match with the header name specified. Refer to <a href="../proxy-settings">Send HTTP Header settings</a> for details.<br><br>An authentication information register form is shown if a gadget is dropped with "basic", "ntlm", or "postCredential" specified.</td>
    </tr>
    </tbody>
</table>

### 6.10 Ranking

Ranking is a gadget only available in Command bar.

### 6.11 Ticker

Ticker is a gadget only available in Command bar.  
The gadget setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Background color</td>
        <td>Specify the default color of background.</td>
    </tr>
	<tr>
    	<td>Date format</td>
        <td>Specify a format to show the date of RSS items.</td>
    </tr>
    </tbody>
</table>

User setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Show date/time</td>
        <td>Enable to show date in the flowing message.</td>
    </tr>
	<tr>
    	<td>Display title</td>
        <td>Enable to include title in the flowing message.</td>
    </tr>
	<tr>
    	<td>Display detail</td>
        <td>Enable to include the detail in the flowing message.</td>
    </tr>
	<tr>
    	<td>Speed</td>
        <td>Specify the speed of the flowing message.</td>
    </tr>
	<tr>
    	<td>Retry interval</td>
        <td>Specify minutes to reload data if there is no data.</td>
    </tr>
    </tbody>
</table>

### 6.12 Alarm

The gadget setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Title</td>
        <td>Specify the title of the gadget.</td>
    </tr>
	<tr>
    	<td>Height</td>
        <td>Specify the height of the gadget.<br>Alarm automatically adjusts its height, so the value of the height is not applied.</td>
    </tr>
    </tbody>
</table>

User setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Title</td>
        <td>Specify the title of the alarm.</td>
    </tr>
	<tr>
    	<td>Information type</td>
        <td>Specify how to notify the alarm.<br>
        	<ul>
            	<li><b>Alert</b>: An alert popup is shown at the set time.</li>
            	<li><b>Swing</b>: The window that infoscoop shown is shaken at a set time.</li>
            	<li><b>None</b>: The gadget only shows the completion of the alarm.</li>
            </ul>
		</td>
    </tr>
	<tr>
    	<td>Date</td>
        <td>Specify the date of the alarm. (e.g. yyyy/M/d)</td>
    </tr>
	<tr>
    	<td>Hours</td>
        <td>Specify the time (hour) of the alarm.</td>
    </tr>
	<tr>
    	<td>Minutes</td>
        <td>Specify the time (minute) of the alarm.</td>
    </tr>
    </tbody>
</table>

### 6.13 TODO List

The gadget setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Title</td>
        <td>Specify the title of the gadget.</td>
    </tr>
	<tr>
    	<td>Title edit</td>
        <td>Specify if the title of gadget can be edited or not.</td>
    </tr>
	<tr>
    	<td>Height</td>
        <td>Specify the height of the gadget.<br>To-Do List automatically adjusts its height, so the value of the height is not applied.</td>
    </tr>
    </tbody>
</table>

User setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Font Size</td>
        <td>Specify the size of font shown in To-Do List.<br>
        	<ul>
            	<li><b>Normal</b>: The characters are shown in normal size.</li>
            	<li><b>Large</b>: The characters are shown larger than normal.</li>
            </ul>
		</td>
    </tr>
    </tbody>
</table>

### 6.14 Sticky

The gadget setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Title</td>
        <td>Specify the title of the gadget.</td>
    </tr>
	<tr>
    	<td>Title edit</td>
        <td>Specify if the title of gadget can be edited or not.</td>
    </tr>
	<tr>
    	<td>Height</td>
        <td>Specify the height of the gadget.<br>Sticky automatically adjusts its height, so the value of the height is not applied.</td>
    </tr>
    </tbody>
</table>

User setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Font Size</td>
        <td>Specify the default size of font by pixel.</td>
    </tr>
	<tr>
    	<td>Background color</td>
        <td>Specify the default color of background.</td>
    </tr>
	<tr>
    	<td>Text Color</td>
        <td>Specify the default color of the font.</td>
    </tr>
    </tbody>
</table>

### 6.15 Calculator

Select **Calculator** from Gadget List.  
The gadget setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Title</td>
        <td>Specify the title of the gadget.</td>
    </tr>
    </tbody>
</table>

### 6.16 World Clock

Select **World Clock** from Gadget List.  
The gadget setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Title</td>
        <td>Specify the title of the gadget.</td>
    </tr>
	<tr>
    	<td>Linked Websites of contents click</td>
        <td>Specify the URL of the content. No link is attached if not specified.</td>
    </tr>
    </tbody>
</table>

### 6.17 Blogparts

Select **BlogParts** from Gadget list.  
The gadget setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Title</td>
        <td>Specify the title of the gadget.</td>
    </tr>
    </tbody>
</table>

The user setting items are as follows.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Descriptions</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Content display mode</td>
        <td>Specify the target of the links within the BlogParts.<br>
        	<ul>
            	<li><b>Frame in portal</b>: Linked sites are displayed in the inner frame in portal.</li>
            	<li><b>New window</b>: Linked sites are displayed in another window.</li>
            	<li><b>Auto detect</b>: Frame in portal or New window is applied according to displayInlinHost property settings.</li>
            </ul>
		</td>
    </tr>
	<tr>
    	<td>Height</td>
        <td>Specify the default height of Blog Parts by pixel.<br>The gadget automatically adjusts its height according to the content if the number other than the positive number is specified.</td>
    </tr>
    </tbody>
</table>

## 7 Supplements

### <a name="displayInlineHost"> 7.1 Property displayInlineHost

This is the property to configure the operation when `Auto detect` is specified in content display mode.  
In content display mode, `Frame in portal` is applied if the URL of the link includes one of the host names from "displayInlineHost" property, otherwise `New window` is applied.  
For example, specify `aaa` and `bbb` to displayInlineHost to show the website whose host name is `aaa` or `bbb` in Frame in portal even if overall setting is `New window`.  
In this case, the web page like `http://aaa/hoge.html` is shown in Frame in portal, and the web page like `http://ccc/foo.html` is shown in a new window.

### <a name="date-format"> 7.2 Date Format can be used

The date format that can be used for each gadgets is the date format of SimpleDateFormat class of Java SE 6.  
The following pattern letters are defined (all other characters from 'A' to 'Z' and from 'a' to 'z' are reserved).

<table>
    <thead>
	<tr>
    	<th>Letter</th>
        <th>Date or time component</th>
    	<th>Presentation</th>
        <th>Examples</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>G</td>
        <td>Era designator</td>
    	<td>Text</td>
        <td>AD</td>
    </tr>
	<tr>
    	<td>y</td>
        <td>Year</td>
    	<td>Year</td>
        <td>2011; 11</td>
    </tr>
	<tr>
    	<td>M</td>
        <td>Month in year</td>
    	<td>Month</td>
        <td>September<br>Sep<br>09</td>
    </tr>
	<tr>
    	<td>w</td>
        <td>Week in year</td>
    	<td>Number</td>
        <td>27</td>
    </tr>
    <tr>
        <td>W</td>
        <td>Week in month</td>
        <td>Number</td>
        <td>2</td>
    </tr>
    <tr>
        <td>D</td>
        <td>Day in year</td>
        <td>Number</td>
        <td>189</td>
    </tr>
        <tr>
        <td>d</td>
        <td>Day in month</td>
        <td>Number</td>
        <td>10</td>
    </tr>
    <tr>
        <td>F</td>
        <td>Day of week in month</td>
        <td>Number</td>
        <td>2</td>
    </tr>
    <tr>
        <td>E</td>
        <td>Day in week</td>
        <td>Text</td>
        <td>Tuesday<br>Tue</td>
    </tr>
    <tr>
        <td>a</td>
        <td>Am/pm marker</td>
        <td>Text</td>
        <td>PM</td>
    </tr>
    <tr>
        <td>H</td>
        <td>Hour in day (0-23)</td>
        <td>Number</td>
        <td>0</td>
    </tr>
    <tr>
        <td>k</td>
        <td>Hour in day (1-24)</td>
        <td>Number</td>
        <td>24</td>
    </tr>
    <tr>
        <td>K</td>
        <td>Hour in am/pm (0-11)</td>
        <td>Number</td>
        <td>0</td>
    </tr>
    <tr>
        <td>h</td>
        <td>Hour in am/pm (1-12)</td>
        <td>Number</td>
        <td>12</td>
    </tr>
    <tr>
        <td>m</td>
        <td>Minute in hour</td>
        <td>Number</td>
        <td>30</td>
    </tr>
    <tr>
        <td>s</td>
        <td>Second in minute</td>
        <td>Number</td>
        <td>55</td>
    </tr>
    <tr>
        <td>S</td>
        <td>Millisecond</td>
        <td>Number</td>
        <td>978</td>
    </tr>
    <tr>
        <td>z</td>
        <td>Time zone</td>
        <td>General time zone</td>
        <td>Pacific Standard Time<br>PST<br>GMT-08:00</td>
    </tr>
    <tr>
        <td>Z</td>
        <td>Time zone</td>
        <td>RFC 822 time zone</td>
        <td>-800</td>
    </tr>
    </tbody>
</table>

Enclose a single-byte character string with single quotes (') to show it as it is.  
Double-byte character string is shown as it is.

<table>
    <thead>
	<tr>
        <th>Date and time patterns</th>
        <th>Results</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>"yyyy.MM.dd G 'at' HH:mm:ss z"</td>
        <td>2011.07.04 AD at 12:08:56 PDT</td>
    </tr>
    <tr>
        <td>"EEE, MMM d, ''yy"</td>
        <td>Mon, Jul 4, '11</td>
    </tr>
    <tr>
        <td>"h:mm a"</td>
        <td>12:08 PM</td>
    </tr>
    <tr>
        <td>"hh 'o''clock' a, zzzz"</td>
        <td>12 o'clock PM, Pacific Daylight Time</td>
    </tr>
    <tr>
        <td>"K:mm a, z"</td>
        <td>0:08 PM, PDT</td>
    </tr>
    <tr>
        <td>"yyyyy.MMMMM.dd GGG hh:mm aaa"</td>
        <td>02011.July.04 AD 12:08 PM</td>
    </tr>
    <tr>
        <td>"EEE, d MMM yyyy HH:mm:ss Z"</td>
        <td>Mon, 4 Jul 2011 12:08:56 -0700</td>
    </tr>
    <tr>
        <td>yyyy/MM/dd</td>
        <td>2011/07/04</td>
	</tr>
    </tbody>
</table>


