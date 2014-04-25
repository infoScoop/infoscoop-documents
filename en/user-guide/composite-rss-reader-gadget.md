# Composite RSS Reader Gadget

Composite RSS Reader Gadget is the Gadget to display RSS Reader Gadgets collectively.

This page explains the controls and the operations of the Composite RSS Reader Gadget.
Because there are functions duplicated with RSS Reader Gadget, some descriptions are omitted in this page. Refer to [RSS Reader Gadget] page.

![Composite RSS Reader Gadget]

<table>
    <thead>
        <tr>
            <th>No</th><th>Name</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>(1)</td>	
            <td>Title</td>
            <td>
                <p>
                    The title of the Gadget.<br>
                    The concerned site is displayed by clicking the link that is set.
                </p>
            </td>
        </tr>
        <tr>
            <td>(2)</td>
            <td>Icons</td>
            <td>
                <p>
                    These icons are used to execute Composite RSS Reader Gadget functions.<br>
                    Refer to the following table for the icon description.
                </p>
            </td>
        </tr>
        <tr>
            <td>(3)</td>
            <td>Category title</td>
            <td>
                <p>
                    The title of each category that is displayed in the Composite RSS Reader Gadget is displayed.<br>
                    The content of the setting site is displayed by clicking the link that is set.
                </p>
            </td>
        </tr>
        <tr>
            <td>(4)</td>
            <td>Category icon</td>
            <td>
                <p>
                    There are icons for the title bar of the Gadget and the title bar of each category in Composite RSS Reader Gadget.<br>
                    It is possible to operate all Gadgets on the Composite RSS Reader Gadget by using the icons on the top title bar. However, it is only possible to operate categories by using icons on the title bar of categories.
                </p>
            </td>
        </tr>
    </tbody>
</table>


## Description of Header Icon

<table>
    <thead>
        <tr>
            <th>Icon</th><th>Name</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img src="../../images/refresh.gif" alt="Refresh icon"></td>
            <td>Refresh</td>
            <td>
                <p>
                    Reload a RSS.<br>
                    <strong>Note:</strong> Normally, RSS Reader Gadgets are automatically updated according to the setting time of server.<br>
                    The new arrival icon rotates to inform that the RSS item has been updated since the last display.
                </p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/minimize.gif" alt="Minimize icon"></td>
            <td>Minimize/Display number of new arrival items</td>
            <td>
                <p>
                    When minimizing a Gadget, the icon turns into Restore icon.<br>
                    <img src="images/widget/composite-rss-reader-gadget-2.png" alt="Minimize of RSS Gadget">
                    When minimizing, the sun shaped icon is displayed and the number of new arrival items is displayed.
                </p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/restore.gif" alt="Restore icon"></td>
            <td>Restore</td>
            <td>
                <p>Restore the minimized Gadget.</p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/maximize.gif" alt="Maximize icon"></td>
            <td>Maximize</td>
            <td>
                <p>Maximize a Gadget. Refer to the following part for the description of the maximized RSS Reader Gadget.</p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/show_hidden_icons.gif" alt="Gadget Menu icon"></td>
            <td>Show Menu</td>
            <td>
                <p>Open the menu of Gadget.</p>
            </td>
        </tr>
    </tbody>
</table>


## Description of the Menu

Menu of Gadget is opened if Show Menu(![Gadget Menu icon])icon is clicked.

![Gadget menu]

<table>
    <thead>
        <tr>
            <th>Icon</th><th>Name</th><th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img src="../../images/edit.gif" alt="Edit icon"></td>
            <td>Edit</td>
            <td>
                <p>
                    The following gadget settings is displayed by clicking this icon.<br>
                    <img src="images/widget/composite-rss-reader-gadget-4.jpg" alt="Setting of gadget"><br>
                    <ul>
                        <li>Gadget title: Type title of Gadget.</li>
                        <li>Start a new line: select whether to start a new line to display titles or to hide the part that cannot be displayed in one line.</li>
                        <li>Display date: switch display or hide the date updated.</li>
                        <li>Change the number of the results to be displayed: the number of the results to be displayed can be select in pull-down list.</li>
                        <li>Scroll mode:
                            <ul>
                                <li>Scroll: make the scroll function valid.</li>
                                <li>None: make the scroll function invalid.</li>
                            </ul>
                        </li>
                        <li>Detail display mode: set the display methods for details.
                            <ui>
                                <li>Inline: display details under the selected item in RSS Reader Gadget.</li>
                                <li>Popup: display details in the popup window for displaying details.</li>
                            </ul>
                        </li>
                        <li>Content display mode: set a target when clicking a link of RSS item.
                            <ul>
                                <li>Frame in portal: display the linked web site in a frame in portal.</li>
                                <li>New window: display the linked web site in a new window.</li>
                                <li>Auto detect: let the system to apply either of the above automatically.</li>
                            </ul>
                        </li>
                        <li><img src="../../images/rss.gif" alt="RSS icon">icon: display the source of RSS. Use it if getting URL of RSS.</li>
                    </ul>
                    <strong>CANCEL:</strong> Close the gadget settings without saving the setting.
                    <strong>OK:</strong> Save the setting and then close the gadget settings.
                </p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/up_arrow.gif" alt="Decrease icon"></td>
            <td>Decrease the number of displayed items</td>
            <td>
                <p>Decrease displayed RSS item by one.</p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/down_arrow.gif" alt="Increase icon"></td>
            <td>Increase the number of displayed items</td>
            <td>
                <p>Increase displayed RSS item by one.</p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/display_sort.gif" alt="According to time order icon"></td>
            <td>Display according to time order</td>
            <td>
                <p>
                    Integrate all category and switch to the items in time order. <br>
                    However, the time order is not sorted correctly if the item is not in valid format.
                </p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/display_sort.gif" alt="According to category icon"></td>
            <td>Display according to category</td>
            <td>
                <p>Switch display according to categories.</p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/search.gif" alt="Search icon"></td>
            <td>Search</td>
            <td>
                <p>
                    Display a search box to search in the site.<br>
                    Click any place except for the search box to close search box.<br>
                    Searching in the site function can be used if it is valid in the system setting.
                </p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/clock.gif" alt="Display/Hide icon"></td>
            <td>Display/Hide the detail date</td>
            <td>
                <p>Switch display or hide the date updated.</p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/newline.gif" alt="Line breaks icon"></td>
            <td>Line breaks</td>
            <td>
                <p>Displaying the title of RSS item with a new line or Hiding the part that cannot be displayed in a line is able to be selected.</p>
            </td>
        </tr>
        <tr>
            <td><img src="../../images/trash.gif" alt="Delete icon"></td>
            <td>Delete</td>
            <td>
                <p>Delete Gadget from personalized area.</p>
            </td>
        </tr>
    </tbody>
</table>


## Maximizing Composite RSS Reader Gadget

If you click "Maximize" icon in a Widget header, the maximized Composite RSS Reader Gadget is displayed.

![Maximizing Composite RSS Reader Gadget]

Depending on the setting, RSS item is displayed according to the registered categories or displayed all collectively. Other operations are same as "Maximize RSS Reader Gadget". Refer to User Guide / <a href="rss-reader-gadget.md#maximize">Maximizing RSS Reader Gadget</a> for the operations of maximizing Gadget.


## Switching of the Display According to Category and the Integration(According to Time Order) Display

All categories are integrated and displayed in the time order by clicking the icon when Composite RSS is displaying according to category.

RSS icon is displayed according to categories if icon is clicked at the integration display mode.

![Display According to Category]

The displayed icon is the icon that switches to show the time order ![Display According] when the category is displayed.

![Display According to Time Order]

The displayed icon is the icon that switches to show category [Display According] when the category is displayed.


## Merging RSS Reader Gadget

The merge confirmation dialog is displayed if the menu or the Gadget is dragged, and dropped in RSS Reader Gadget or Composite RSS Reader Gadget.

![Merge confirm dialog]

The Gadget returns to the its condition before dragging if **Do not merge(Back)** is clicked.
The menu or the Gadget is added or generated in Composite RSS Reader Gadget if **Merge** is clicked.

![After merged]


[RSS Reader Gadget]: rss-reader-gadget.md
[Composite RSS Reader Gadget]: images/widget/composite-rss-reader-gadget-1.png
[Gadget menu]: images/widget/composite-rss-reader-gadget-3.png
[Maximizing Composite RSS Reader Gadget]: images/widget/composite-rss-reader-gadget-5.png
[Display According to Category]: images/widget/composite-rss-reader-gadget-6.png
[Display According to Time Order]: images/widget/composite-rss-reader-gadget-7.png
[Merge confirm dialog]: images/widget/composite-rss-reader-gadget-8.png
[After merged]: images/widget/composite-rss-reader-gadget-9.png
[Display According]: ../../images/display_sort.gif
[Gadget Menu icon]: ../../images/show_hidden_icons.gif
