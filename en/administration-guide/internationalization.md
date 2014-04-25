# Internationalization

Explains how to internationalize the components of infoScoop OpenSource.

## 1 I18N Administration

The various settings of i18n can be edited in I18N administration of administration page.  
Select **I18N** from menu.

## 2 Internationalization of Messages

### 2.1 Available Components

The following components can be internationalized.

  * Menu
  * Search form
  * Other Layout
    * Title
    * Header
    * iFrameToolbar
    * JavaScript Customize
  * Gadget
  * infoScoop OpenSource (I18N Messages used in infoScoop can not be internationalized.)

### 2.2 Applicable Rules of the Locale

I18N messages should be provided for each locale.  
A locale represents a combination of the language that user use and country.

e.g. ja (Japanese) / jp (Japan), en (English) / US (USA)

Locale is determined by comparing the string of "Accpect Language" header which is sent by browser.  
The first language in the settings is used if multiple languages is specified in the language settings of browser.  
Locale is compared in order of language and country.  
The Language of the default setting `ALL (default)`, Country `ALL (default)` is applied if the locale to be applied is not set in the `Accept-Language` header.  
Also, the order of settings does not affect anything as the available languages and countries are unique.

### 2.3 CSV Files for Internationalization Messages

I18N messages are managed by importing / exporting CSV files encoded in `Shift_JIS (MS932/Windows-31J)` format.  
CSV file format for internationalized messages basically conforms to RFC4180.  
Message contents is described in order of `Key of i18n messages (alphanumeric and underscore '_', maximum of 512 bytes), Resource messages (2048 bytes)` in the CSV file.

e.g. "TodoList_title", "TODO list"

The following case occurs an error.

  * An empty key in i18n message.
  * An empty message.
  * If the i18n messages including the key that does not exist in ALL_ALL locale is imported to the locale other than ALL_ALL locale.

**Note:** The messages which is exist in ALL_ALL locale but not in added locale will be complemented by messages in ALL_ALL locale.

## 3 Operations of I18N Message Administration

<a name='add-delete-locale'></a>
### 3.1 Add / Remove Locale

Add locale window appears if the **Add locale** is clicked.  
Locale settings are as the followings.

<table>
    <thead>
	<tr>
    	<th>Setting items</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Country</td>
        <td>Select the country.</td>
    </tr>
	<tr>
    	<td>Language</td>
        <td>Select the language.</td>
    </tr>
    </tbody>
</table>

Locale is added by clicking [**Add**] button.  
Locale is removed by clicking ![Trash icon] icon of each row.

<a name='import-export-locale'></a>
### 3.2 Import / Export Locale

I18N message import dialog is displayed by clicking **Import**.  
There are two import modes as below.

```
Replace all: Delete all the messages data in the appropriate locale and then run import.  
Fill differences: Run import message data without removing the locale message.
```

The following case occurs an error.

  * An empty key in i18n message.
  * An empty message.
  * If the i18n messages including the key that does not exist in ALL_ALL locale is imported to the locale other than ALL_ALL locale.

**Note:** The messages in default locale that are not exist in other locale is
deleted if replace all for default locale(ALL_ALL) is executed.

The list of current messages can be exported by clicking **Export**. The registered i18n messages can be checked and edited using this exported list.

## 4 Apply I18N Messages

### 4.1 Apply to Menu

Import i18n messages to an item of `Menu` type.  
Set menu title as "**%{ID of i18n}**" from **Menu** tab. Refere to [Menu Settings] for configuration of menu.

**Note:** The maximum number of characters specified in the menu title is limited to 80 characters. That is, ID can be specified in the message must be set to less than 77 characters. Also, if more than 80 characters are set for messages that are converted automatically, they are truncated when a menu is displayed.

### 4.2 Apply to Search

Import i18n messages to an item of `Search form` type.  
Set the title of search site as `%{ID of i18n}` from **Search form** tab.  
Refere to [Search Form Administration] for configuration of search form.

**Note:** The maximum number of characters specified in the search site title is limited to 128 characters. That is, ID can be specified in the message must be set to less than 125 characters. XML reserved characters such as `<`, `>`, `&`, `'`, `"` are not available for messages in search settings.

### 4.3 Apply to Other Layout

Import i18n messages to an item of `Other Layout` type.  
Select **Other Layout** from the side bar of **Layout** tab and set the title as `%{ID of i18n}`. Refere to [Other Layout] for configuration of other layout.

**Note:** XML reserved characters such as `<`, `>`, `&`, `'`, `"` are not available for messages in title, header and iFrameToolBar. Also, the messages used for JavaScript need to be written in correct format without syntax errors.

## 5 Internationalize Holidays

Holidays is used for the gadgets below.

  * Calendar - Displays a holiday.
  * RSS Reader - Holiday is used to determine whether to display new arrival icon.

Holidays are provided for each locale same as i18n messages.

## 6 Operations of Holiday Settings

### 6.1 Holiday Setting File

Holiday setting files are defined in iCalendar format. Refer to RFC2445 of `Internet Calendaring and Scheduling Core Object Specification` about iCalendar format.  
Holiday setting file for Japanese holidays is included at installation and the default of `ALL_ALL` has been set.  
In addition, the character set of uploading iCalandar file needs to be encoded in UTF-8.

### 6.2 Add / Remove Holiday Settings

To add / remove holiday locale settings, refer to <a href="#add-delete-locale">3.1 Add / Remove Locale</a> and do the same procedure.

### 6.3 Import / Export Holiday Settings

To import / export holiday setting, refer to <a href="#import-export-locale">3.2 Import / Export Locale</a> and do the same procedure.


[Menu Settings]: menu-settings.md
[Search Form Administration]: search-form-administration.md
[Other Layout]: other-layout.md
[Trash icon]: ../../images/trash.gif
