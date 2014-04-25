# Administrator Settings

This section describes how to manage for administrators.

## 1 Administrators / Administrators Role Setting

Administrators in this product means user who can access to the infoScoop administration page.  
In addition, administrators can specify the administrator role to limit the administrative functions.

### 1.1 Administrators Settings

Administrator is added in **Administrator Settings** page on
**Administrators** tab.  
Register user ID of user who has access to administration page and assign the administrator role in **Administrator** administration page.  
User ID of the administrator is supposed to be the account can log on to the product already.  
![Properties icon] **To Management Page** link is displayed on the command bar if the user registered as an administrator is logged on.

### 1.2 Add Administrators

Click ![Add icon] **Add** button and a blank line is added to add an administrator.  
Type the ID of user who is registered as an administrator at column of Administrators.

**Note:** The current logged in user can not be added.

### 1.3 Delete Administrators

Remove an administrator by clicking ![Trash icon] icon.

**Note:** The current logged in user can not be deleted.

## 2 Administrators Role Settings

Administrators role is added in **Role settings** page on **Administrators** tab.  
Roles which specifies the limits of editing to the administrators can be created on the Role settings tab.

### 2.1 Add Administrators Role

Click ![Add icon] **Add** button and Role name `New role` is added to the new line to add an administrator.  
Edit role page is displayed by clicking on permission edit icon.  
The possible privileges are listed below.

<table>
    <thead>
        <tr>
            <th>Setting items</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Menu</td>
            <td>Allows menu settings.</td>
        </tr>
        <tr>
            <td>menu tree</td>
            <td>Allows editing of the menu tree.<br>See: Administration Guide / <a href="menu-settings.md#set_admin">9 Setting Administrators to the Menu Tree</a></td>
        </tr>
        <tr>
            <td>Search form</td>
            <td>Allows search form settings.</td>
        </tr>
        <tr>
            <td>Gadget</td>
            <td>Allows gadget settings.</td>
        </tr>
        <tr>
            <td>Default Layout</td>
            <td>Allows default layout settings.</td>
        </tr>
        <tr>
            <td>Other Layout</td>
            <td>Allows other layout settings.</td>
        </tr>
        <tr>
            <td>I18N</td>
            <td>Allows i18n settings.</td>
        </tr>
        <tr>
            <td>Properties</td>
            <td>Allows properties settings.</td>
        </tr>
        <tr>
            <td>Proxy</td>
            <td>Allows proxy settings.</td>
        </tr>
        <tr>
            <td>Administrators</td>
            <td>Allows administrators settings.</td>
        </tr>
        <tr>
            <td>Forbidden URL</td>
            <td>Allows forbidden URL settings.</td>
        </tr>
        <tr>
            <td>OAuth</td>
            <td>Allows OAuth settings.</td>
        </tr>
    </tbody>
</table>

### 2.2 Remove Administrators Role

Remove an administrators role by clicking ![Trash icon] icon.

**Note:** The default "Administrator" role can not be deleted.

## 3 Change Administrators / Administrators Roles

Change the value of Administrators text bot to change Administrators / Administrators Role and click the ![Apply icon] **Apply changes** button.

**Note:**

  * All the changes are discarded if this icon is not clicked.
  * The current logged in user can not be deleted.
  * The default "Administrator" role can not be deleted.

If you click ![Refresh icon] **Refresh**, discarded the current changes. Reload the contents of the database.


[Add icon]: ../../images/add_menu_tree.gif
[Apply icon]: ../../images/apply_changes.gif
[Properties icon]: ../../images/display_all_properties.gif
[Refresh icon]: ../../images/refresh.gif
[Trash icon]: ../../images/trash.gif
