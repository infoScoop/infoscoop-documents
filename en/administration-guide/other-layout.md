# Other Layout

This section explains how to customize the common elements in the user screen, such as titles or headers.

## 1 Customizing Elements

To customize common elements, select **Layout** in Administration page, and select **Other Layout** in the side bar.  
The following elements can be customized by using this feature.

  * Title
  * Content footer
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

### 3.1 Title (title)

Specify a title. It is shown at the upper left of the browser after logging in to this product.  
If a login page is used, the title is also shown in the login page.


### 3.2 Custom Theme (customTheme)
Specify a cutome theme. It is setting portal page color and style.

When clicked **Setting Example** link on administration page, opened a setting sample window. Copy the string of the displayed set sample , and paste it to set the edit form. String can be customized with a value which will be described below.
<table>
    <thead>
        <tr>
            <th>Name</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><strong>tabbar</strong></td>
            <td>Specify a tab bar style.</td>
        </tr>
        <tr>
            <td>&nbsp;fontColor</td>
            <td>Specify a font color of tab by HTML color code.</td>
        </tr>
        <tr>
            <td>&nbsp;backgroundColor</td>
            <td>Specify a background color of tab by HTML color code.</td>
        </tr>
        <tr>
            <td>&nbsp;backgroundGradiationTop</td>
            <td>Specify a upper background gradation of tab by HTML color code.</td>
        </tr>
        <tr>
            <td>&nbsp;backgroundGradiationBottom</td>
            <td>Specify a bottom background gradation of tab by HTML color code.</td>
        </tr>
        <tr>
            <td>&nbsp;borderBottom</td>
            <td>Specify a bottom line color of tab bar by HTML color code.</td>
        </tr>
        <tr>
            <td>&nbsp;iconClass</td>
            <td>
                Specify a icon style of tab bar. The icon style are two types.
                <ul>
                    <li>white</li>
                    <li>gray</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>&nbsp;activetab</td>
            <td>Specify a selected tab style.</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;type</td>
            <td>
                Specify a selected tab style.
                <ul>
                    <li>fill: Displayed the tab in the rectangle. activetab/backgroundColor setting is backgroud color of tab.</li>
                    <li>border: Displayed line of the specified color in activetab/backgroundColor the bottom of the tab.</li>
                </ul>
                If the activetab/backgroundColor is not specified, it does not apply.
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;fontColor</td>
            <td>Specify a font color of selected tab by HTML color code.</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;backgroundColor</td>
            <td>Specify a background color of selected tab by HTML color code. If the activetab/type is not specified, it does not apply.</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;fontWeight</td>
            <td>
                Specify a font weight of selected tab. The font weight is two types.
                <ul>
                    <li>normal</li>
                    <li>bold</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><strong>commandbar</strong></td>
            <td>Specify a command bar style.</td>
        </tr>
        <tr>
            <td>&nbsp;searchFormButton</td>
            <td>Specify a button style of search form.</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;backgroundColor</td>
            <td>Specify a buckground color of button by HTML color code.</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;backgroundGradationTop</td>
            <td>Specify a upper background gradation of button by HTML color code.</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;backgroundGradationBottom</td>
            <td>Specify a bottom background gradation of button by HTML color code.</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;borderColor</td>
            <td>Specify a bottom line color of button by HTML color code.</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;iconClass</td>
            <td>
                Specify a icon style of tab bar. The icon style are two types.
                <ul>
                    <li>white</li>
                    <li>gray</li>
                </ul>
            </td>
        </tr>
    </tbody>
</table>

About backgroundColor and backgroundGradationTop, backgroundGradationBottom

* When specified both backgroundColor and gradation setting(backgroundGradationTop and backgroundGradationBottom), gradation setting has priority.
* When does not specifing both backgroundGradationTop and backgroundGradationBottom, a color gradation does not appling.

Following setting example:
```
{
    "tabbar":{
        "fontColor":"#ffffff",
        "backgroundColor":"#0085be",
        "backgroundGradationTop":"#008bc7",
        "backgroundGradationBottom":"#0081b8",
        "borderBottom":"#0072a7",
        "iconClass":"white",
        "activetab": {
            "type":"fill",
            "fontColor":"#ffffff",
            "backgroundColor":"#0097d8",
            "fontWeight": "normal"
        }
    },
    "commandbar":{
        "searchFormButton":{
            "backgroundColor":"#bacf02",
            "backgroundGradationTop":"#c3d900",
            "backgroundGradationBottom":"#bbcf06",
            "borderColor":"#bacf02",
            "iconClass":"white"
        }
    }
}
```


### 3.3 Content footer (contentFooter)

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

### 3.4 JavaScript (javascript)

Write JavaScript directly.  
The written JavaScript functions can be used in header, commandBar, and content footer.

**Note:** Incorrect JavaScript might prevent infoScoop from starting. In addition, the operation of customized JavaScript is not guaranteed, so customizing JavaScript is not supported.

### 3.5 Style Sheet (css)

Write custom style sheet directly.

**Note:** Incorrect style sheet might prevent infoScoop from starting. In addition, the operation of customized style sheet is not guaranteed, so customizing JavaScript is not supported. A feature to customize style sheets will be added in the future updates.


