# Other Layout

This section explains how to customize the common elements in the user screen, such as titles or headers.

## 1 Customizing Elements

To customize common elements, select **Layout** in Administration page, and select **Other Layout** in the side bar.  
The following elements can be customized by using this feature.

  * Title
  * Header
  * iframe Toolbar  
A toolbar shown only if an application within the same domain as infoScoop's is shown in Frame in portal.
  * Custom JavaScript  
Specify customized JavaScript to add extra features.
  * Custom Style Sheets  
Specify a style sheet to customize the design of this product.

**Note:** Custom JavaScript and Custom Style Sheets are not recommended to use
because they may cause this product stop working properly.

## 2 Screens

This section explains how to configure Other Layout in Administration page.  
To show **Other Layout** administration page, go to **Layout** and then **Other Layout**.  
Click to select the following elements shown in the list next to the side bar.

  * title
  * header
  * contentFooter
  * javascript
  * css

Edit the content shown next to the list.

Details about the controls shown at the upper right of **Other Layout**
administration page is in the table below.

<table>
    <thead>
        <tr>
            <th>Icon</th><th>Name</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img src="../../images/refresh.gif"/></td>
            <td>Refresh</td>
            <td>Discard the change and displays the last applied state.</td>
        </tr>
        <tr>
            <td><img src="../../images/apply_changes.gif"/></td>
            <td>Apply changes</td>
            <td>Apply the changes. (Save the data.)<br><b>Note:</b> All the changes are discarded if this icon is not clicked.</td>
        </tr>
    </tbody>
</table>

## 3 Configuration Examples

This section explains the elements that can be configured in Other Layout administration page.

### 3.1 Title

Specify a title. It is shown at the upper left of the browser after logging in to this product.  
If a login page is used, the title is also shown in the login page.

### 3.2 Header

Write HTML to customize the header.  
As default, the HTML is commented out, and header is not displyed on Portal screen.  
Write as follows to display orange strings in the header.  
e.g. Test Header

    <div style="color:orange;">Test Header</div>

#### 3.2.1 Displaying User ID

Write the following format to display user ID in the header.

    ${session.getAttribute("Uid")}

The format to display a user ID might be changed in the future updates. In that case, it is indicated in the release note.

**Note:** Displaying a user ID is supported for updates, but other formats are not guaranteed due to the compatibility for updates.

### 3.3 contentFooter

Write a part of XML for the style of content footer.  
The format is as follows.

    <icon><![CDATA[ Write HTML here. ]]></icon>

In addition, an icon can be displayed at the icon element.

    <icon type="Write icon type name here."/>

The icon types can be used are as follows.

<table>
    <thead>
        <tr>
            <th>Icon Type</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>mail</td>
            <td>Displaying an e-mail send button.</td>
        </tr>
        <tr>
            <td>message</td>
            <td>Displaying a button to send a message about this article.</td>
        </tr>
    </tbody>
</table>

Multiple icons can be specified.  
For example, footers are displayed in a maximized RSS reader and at the bottom of Frame in portal if specified as follows.

    <icon type="mail"></icon>
    <icon type="message"></icon>

Frame in portal is displayed only if the page to be displayed in it is on the same domain as infoScoop.  
In addition, the URL of the open page is displayed with specified icons.  
In a maximized RSS reader, the content footer is displayed only in Summery mode.  
Footer is not displayed if no icon is specified.

### 3.4 javascript

Write JavaScript directly.  
The written JavaScript functions can be used in header, commandBar, and iframeToolBar.

**Note:** Incorrect JavaScript might prevent infoScoop from starting. In addition, the operation of customized JavaScript is not guaranteed, so customizing JavaScript is not supported.

### 3.5 Style Sheet

Write custom style sheet directly.

**Note:** Incorrect style sheet might prevent infoScoop from starting. In addition, the operation of customized style sheet is not guaranteed, so customizing JavaScript is not supported. A feature to customize style sheets will be added in the future updates.


