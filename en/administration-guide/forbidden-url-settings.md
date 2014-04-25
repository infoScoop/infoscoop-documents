# Forbidden URL Settings

This section explains how to set up Forbidden URLs.

## 1 Inner Frame to Display Limit

You can access the Forbidden URL administration page from the **Forbidden URL** tab of infoScoop OpenSource administration page.

You can register the website that limited to the display of the inner frame within a portal, such as MiniBrowser gadgets from the Forbidden URL administration page.  
Specify a regular expression matched to URLs at web sites.  
If display in MiniBrowser gadgets has URL which matches a regular expression register in forbidden URLs, display a message `The website of the input URL is forbidden by administrator`., and the contents are not displayed.

If the website is displayed in a frame, a case include the processing to display the website in the top of the web browser window to disable the frame.
If you place in the user panel as a MiniBrowser gadgets from `Add Contents` to websites include its processing, you cannot use the product. Because displayed the edited URL in web browser window to disable the frame when displayed the MiniBrowser gadgets.  
If registered URL (regular expression) with a problem in Forbidden URLs, You can prevent the screen take control of the product.

Check the Forbidden URL, the following operations are performed in addition to the MiniBrowser gadgets.

  * If you display a link to the frame in portal is displayed in each gadgets.
  * Maximize of a gadget that displays the RSS, "full view" mode (view the full article details the inner frame of the display panel on the right) if viewing the article if it is selected.

## 2 Decision Rules of Forbidden URL

If edited URL in MiniBrowser gadgets and a link of the article of each gadgets matches registered regular expression in Forbidden URLs, the product determines the URL as a Forbidden URL.  
If you add `^http://www.beacon-it.co.jp/news.*` in Forbidden URLs, URL, such as `http://www.beacon-it.co.jp/news/summary.html` and `http://www.beacon-it.co.jp/newspaper.html` which matches the regular expression is the Forbidden URL.

**Note:** URL (regular expressions), you need to write a regular expression that can be used in JavaScript. Because regular expressions are determined by the JavaScript in the web browser, start the regular expression `^` and end the regular expression `$` is not specified, the search becomes ambiguous.

## 3 Configuring Forbidden URL

If you click ![Add icon] **Add**, added a blank row in the Forbidden URL administration.  
Type the regular expression of the Forbidden URL in the URL (regular expression) column.  
Edit the Forbidden URL, URL (regular expression) to modify the text box.  
Remove the Forbidden URL, clicked ![Trash icon] icon.  
To save changes to the server, clicked ![Apply icon] **Apply changes** of the right corner of the window.

**Note:** If you do not click on this icon finally, editing is destroyed. In addition, reflected edit if user refreshes infoScoop.

If you click ![Refresh icon] **Refresh**, discarded the current changes. Reload the contents of the database.


[Add icon]: ../../images/add_menu_tree.gif
[Apply icon]: ../../images/apply_changes.gif
[Refresh icon]: ../../images/refresh.gif
[Trash icon]: ../../images/trash.gif
