# Search Form Administration

This page explains about Search site administration.

## 1 About Search Form Function

The infoScoop OpenSource has two search functions.

  1. If a search is performed with the search form of a header, a search can be simultaneously performed by two or more registered search engine sites.
  2. In RSS Reader or Multi-RSS Reader, a search can be performed to the search engine site registered for each URL of RSS.

Registration of a search engine site is performed by Search form Administration.  
Search administration page is shown if **Search Form** is selected in administration page.  
**Search site settings** sets up the search engine site of 1, and **In-site search settings** sets up the search engine site of 2.

## 2 Screens

This clause explains the various control which can be operated by Search form administration.

### 2.1 Common Icons

The control common to Search site settings and In-site search settings is explained.

<table>
    <thead>
        <tr>
            <th>Icon</th>
            <th>Name</th>
            <th>Descripion</th>
        </tr>
    </thead>
    <tbody>
	<tr>
    	<td><img src="../../images/add_menu_tree.gif"/></td>
        <td>Add</td>
        <td>A new setup is added to Search site settings or In-site search settings.</td>
    </tr>
	<tr>
    	<td><img src="../../images/drag.gif"/></td>
        <td>Order</td>
        <td>The order of a display can be replaced by carrying out drag-and-drop operation of the icon.</td>
    </tr>
	<tr>
    	<td><img src="../../images/trash.gif"/></td>
        <td>Remove</td>
        <td>A setup of an applicable line is deleted by click.</td>
    </tr>
    </tbody>
</table>

### 2.2 Search Site Settings

The following items can be set up for each search engine site.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Title</td>
        <td>It is a title displayed on the tab of search results. A maximum of 128 characters can be typed.</td>
    </tr>
	<tr>
    	<td nowrap>Search adress</td>
        <td>
            It is URL which performs a search to a search engine site. If substitution character string ${KEYWORD} is written in an address, it is replaced by a keyword at the time of search execution.<br>
            e.g. Description of Search address which uses a substitution character string<br>
            (Search address) <code>http://www.beacon-it.co.jp/cgi-bin/search.cgi?key=${KEYWORD}&amp;key2=${KEYWORD}</code><br>
            (When execute a search)<br>
            <code>http://www.beacon-it.co.jp/cgi-bin/search.cgi?key=keyword&amp;key2=keyword</code><br>
            The keyword is is given to the end of the URL if a substitution character string is not described in the address<br>
            e.g. Description of Search address which does not use a substitution character string<br>
            (Search address)<br>
            <code>http://www.beacon-it.co.jp/cgi-bin/search.cgi?key=</code><br>
            (When execute a search)<br>
            <code>http://www.beacon-it.co.jp/cgi-bin/search.cgi?key=keyword</code><br>
            A maximum of 512 characters can be typed.
        </td>
    </tr>
	<tr>
    	<td>Encoding</td>
        <td>Encoding of a search engine site is specified. If not specifying, it is processed by UTF-8.<br>Refer to the <a href="http://www.iana.org/assignments/character-sets">IANA Character Set Registry</a> for encoding name to specify.<br>Verified encodings are "UTF-8", "Shift_JIS", and "EUC-JP".</td>
    </tr>
	<tr>
    	<td>Count, Method</td>
        <td>The acquisition method of the hit count contained in HTML of search results is specified.<br>
The following two methods can be specified.<br>
			<ul>
				<li>Regular expression: The hit count is acquired with a regular expression. The value which matched the first group is acquired as the number of cases.<br>e.g. ([0-9] +) results.*</li>
				<li>ID: It acquires by ID of the HTML element in which the hit count is described.<br>e.g. "resultCount"</li>
			</ul>
        </td>
    </tr>
	<tr>
    	<td>Count, Value</td>
        <td>A regular expression is specified if regular expression is specified by a method.<br>If ID is specified by a method, ID if specifies a HTML element is specified.<br><b>Note:</b> URL (regular expressions), you need to write a regular expression that can be used in Java. The values of the element ID or the regular expression can be entered up to 256 characters</td>
    </tr>
	<tr>
    	<td>Count, Use Cache</td>
        <td>Specify whether to cache the results or not.<br>"Use Cache" to enable the reuse and cache results when the number of acquisition. The performance may be improved by using cache, however, the layout is sometimes collapsed.</td>
    </tr>
    </tbody>
</table>

### 2.3 In-site Search Settings

In-site search is a unique feature of RSS reader and Multi-RSS reader. This feature searches only in the site if there is a setting of the search site corresponding to the shown RSS.  
Items can be set for In-site search are as follows.

<table>
    <thead>
	<tr>
    	<th>Setting items</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>RSS Patterns</td>
        <td>Specify a regular expression of the RSS URL pattern to be used for this search site settings.<br>If this pattern matches the URL of the RSS, a search site searches in the search site which is specified at the search address. The regular expressions are judged from the top and the first matched setting is applied.<br><b>Note:</b> The RSS pattern must be used to write regular expressions in JavaScript.RSS patterns can be up to 512 characters.</td>
    </tr>
	<tr>
    	<td>Search Address</td>
        <td>It is URL which performs a search to a search engine site. The search is executed with the keyword added at the end of the URL.<br>e.g. BeaconIT Home<br><code>http://www.beacon-it.co.jp/cgi-bin/search.cgi?key=</code><br> The n-th group that matches forward reference "$n" can be referred for the search address specified in In-site search.<br>In addition, the RSS that matches the specified pattern is not searched and
the icon for In-site search located at the header of RSS reader and Multi-RSS reader is hidden if an empty string is specified.<br>Address searches are available up to 512 characters.</td>
    </tr>
	<tr>
    	<td>Encoding</td>
        <td>Specify the encoding used in the search. If it is not specified, UTF-8 is applied.<br>Refer to the <a href="http://www.iana.org/assignments/character-sets">IANA Character Set Registry</a> for encoding name to specify.<br>Verified encodings are "UTF-8", "Shift_JIS", and "EUC-JP".</td>
    </tr>
	<tr>
    	<td>Results, Method</td>
        <td>Specify how to get the hits included in the HTML of the search results returned from the search. You can specify the following two ways.<br>
			<ul>
            	<li>Regular expression: The hit count is acquired with a regular expression.</li>
            	<li>The value which matched the first group is acquired as the number of cases. e.g. ([0-9] +) results.*</li>
            </ul>
		</td>
    </tr>
	<tr>
    	<td>Results, Value</td>
        <td>A regular expression is specified if regular expression is specified by a method.<br>If ID is specified by a method, ID if specifies a HTML element is specified.<br><b>Note:</b> URL (regular expressions), you need to write a regular expression that can be used in Java. The value of an element ID or a regular expression can be entered up to 256 characters.</td>
    </tr>
	<tr>
    	<td>Count, Use Cache</td>
        <td>It is specified whether search results cache.<br>The search result is cached when the count is loaded and reused if Use Cache is checked. When using cache, improvement in performance can be desired, but a layout may collapse.</td>
    </tr>
    </tbody>
</table>

### 2.4 Search Option Default Settings

This clause explains the items to set the default option of Search form.  
The option set up here can be re-set up from the **search option** of a portal page.

The following are the details about search option default settings.

<table>
    <thead>
	<tr>
    	<th>Setting items</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Open in new window</td>
        <td>The result of collective search is shown in a new window not in Frame in portal if this is checked.</td>
    </tr>
    </tbody>
</table>

### 2.5 Context Menu

This section explains the context menu of the Search form administration screen.

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
    	<td><img src="../../images/refresh.gif"/></td>
        <td>Refresh</td>
        <td>Old edit operation is canceled and it returns to the last preservation state.</td>
    </tr>
	<tr>
    	<td><img src="../../images/apply_changes.gif"/></td>
        <td>Apply changes</td>
        <td>Edit operation is saved by click.<br><b>Note:</b> All the changes are discarded if this icon is not clicked.</td>
    </tr>
    </tbody>
</table>


