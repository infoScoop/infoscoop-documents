# Customizing Web Application Module

The server module of infoScoop OpenSource is supplied as a web application which runs on J2EE web application server.

This page explains how to configure and re-make infoscoop.war which is contained in the downloaded archive, before deploying it on a web application server.

## 1 WAR File Re-make Utilitiy

infoScoop OpenSource supplies a utilitiy for configuring and re-making the war file. This utility can configure pre-deploy settings such as database connection settings, application log settings, and system initial settings.

The utility `remakewar.bat(.sh)` is located in `/infoscoop` directory of unziped archived file.

To run `remakewar.bat(sh)`, Apache Ant is requeried. If Apache Ant is not installed on working machine, install Apache Ant before in advance. Refer [Apache Ant Document] for how to install Apache Ant.

**Note:**  
There are following restrictions for each setting value of the utility configuration files (`build.properties` and `principalHeaderList.json`).

  * XML reserved word ( , ', ", &) can not be used in build.properties and principalHeaderList.json.To use those words in the configuration files, escape them.
  * `\` and `$` can not be used in build.properties. Escape like `$$` to use `$` in the file.
  * `\` can not be used in principalHeaderList.json.

  
In addition, follow this instruction to apply patch version of infoScoop OSS because the patch version is distributed as a WAR file.Keep each utilitiy configuration files (build.properties, principalHeaderList.json, and the files under Customization directory) safely for future patch up.

## 2 Changing Database Settings

Change the settings of repository database which saves each user's display layout etc.

1.Open `/infoScoop/build.properties` with a text editor like Notepad.  
2.Edit the following bold items according to the running environment.

```
dataSource.jndiName=jdbc/infoscoop
dataSource.schema=iscoop
```

The settings are as follows.

<table>
	<tr>
    	<td nowrap>Property Name</td>
        <td>Descriptions</td>
    </tr>
	<tr>
    	<td colspan=2>dataSource.jndiName</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>JNDI data source name</td>
    </tr>
	<tr>
    	<td>Default value</td>
        <td>jdbc/infoscoop</td>
    </tr>
	<tr>
    	<td>Details</td>
        <td>This property is not needed to be edited when the data source name is set as default, "idbc/infoscoop" on the web application server.</td>
    </tr>
	<tr>
    	<td colspan=2>dataSource.schema</td>
    </tr>
	<tr>
    	<td>Setting content</td>
        <td>The schema name of repository database.</td>
    </tr>
	<tr>
    	<td>Default value</td>
        <td>iscoop</td>
    </tr>
	<tr>
    	<td>Details</td>
        <td>
        	Specify the schema when the repository tables are created in the schema which name is defferent from the user name accessing the database.</br>
            This property is not needed to be edited as default.</br></br>
             <strong>Note:</strong> Specify nothing or the same value as the repository database name when using MySQL.
        </td>
    </tr>
</table>

3.Save `/infoscoop/build.properties`.

<a name="without_sso"></a>
## 3 Authentication Settings 1: Not Using SSO Environment

When there is no SSO environment, use the default login screen supplied by infoScoop OpenSource.  
When there is an SSO environment, go to the following section, <a href="#set_sso_filter">4 Authentication Settings 2: Using SSO Product</a>.

### 3.1 Enabling the Default Login Screen Authentication

This section explains how to enable the default login screen authentication.This setting is the default setting.

1.Open `/infoScoop/build.properties` with a text editor like Notepad.  
2.Edit the following bold items according to the running environment.  

_A part of build.properties_

    sessionCreateConfig.loginAuthentication=true

The settings are as follows.

<table>
	<tr>
    	<td nowrap>Property Name</td>
        <td>Descriptions</td>
    </tr>
	<tr>
    	<td colspan=2>sessionCreateConfig.loginAuthentication</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>Use the default login screen authentication or not.</td>
    </tr>
	<tr>
    	<td>Default value</td>
        <td>&lt;option key="ENABLE_XML_LOG"&gt;true&lt;/option&gt;</td>
    </tr>
	<tr>
    	<td>Details</td>
        <td>
        	Specify one of the follosing.</br>
            true: use the default login screen authentication.</br>
			false: not use the default login screen authentication.Specify false when using an SSO environment.
        </td>
    </tr>
</table>

3.Save `/infoscoop/build.properties`.

### 3.2 Configuring Simple User Master Authentication

infoScoop OpenSource supplies a simple user master for authentication in the repository database.  
This simple user master authentication is enabled as default.

### 3.3 Configuring Directory Server Authentication

This section explains how to configure Directory Server (ActiveDirectory or LDAP) Authentication.

1.Open `/infoScoop/build.properties` with a text editor like Notepad.  
2.Remove the following commented out. (Delete "#" at the begining of the line.)

_A part of build.properties_

    accountAccessConfig=sample/ldap.xml

The settings are as follows.

<table>
	<tr>
    	<td nowrap>Property Name</td>
        <td>Descriptions</td>
    </tr>
	<tr>
    	<td colspan=2>searchUidServiceConfig</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>User search service configuration file.</td>
    </tr>
	<tr>
    	<td>Details</td>
        <td>
        	Specify the path to the user search service configuration file.<br/>
        	A sample file for using LDAP is sample/ldap.xml.
        </td>
    </tr>
</table>

3.Save `/infoscoop/build.properties`.  
4.Open `/infoscoop/sample/ldap.xml` with a text editor like Notepad.  
5.Edit the following bold parts according to the running environment.

_Directory Server Settings_
    
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN"
                       "http://www.springframework.org/dtd/spring-beans.dtd">
    <beans>
      <bean id="LDAPAccountManager" singleton="true"
        class="org.infoscoop.account.ldap.LDAPAccountManager">
        <constructor-arg>
          <value>ldap://localhost:389</value>
        </constructor-arg><constructor-arg>
          <value>CN=Administrator,CN=Users,DC=infoscoop,DC=org</value>
        </constructor-arg><constructor-arg>
          <value>secret</value>
        </constructor-arg><constructor-arg>
          <value>CN=Users,DC=infoscoop,DC=org</value>
        </constructor-arg><constructor-arg>
           <value>OU=MyOffice,DC=infoscoop,DC=org</value>
        </constructor-arg>
        <property name="userSearchAttr">
          <map>
      <entry key="user_id"><value>sAMAccountName</value></entry>
      <entry key="user_name"><value>cn</value></entry>
            <entry key="user_email"><value>mail</value></entry>
          </map>
        </property>
        <property name="groupSearchAttr">
          <map>
      <entry key="org_name"><value>cn</value></entry>
            <entry key="org_member"><value>member</value></entry>
          </map>
        </property>
      </bean>
      <bean id="searchUserService" singleton="false"
               class="org.infoscoop.account.SearchUserService" >
        <property name="accountManager" >
          <ref bean="LDAPAccountManager"/>
        </property>
      </bean>
      <bean id="authenticationService" singleton="false"
               class="org.infoscoop.account.AuthenticationService" >
        <property name="accountManager" >
          <ref bean="LDAPAccountManager"/>
        </property>
      </bean>
    </beans>
    
The settings are as follows.

<table>
	<tr>
    	<td nowrap>Property Name</td>
        <td>Descriptions</td>
    </tr>
	<tr>
    	<td colspan=2>constructor-arg 1</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>LDAP server's URL.</td>
    </tr>
	<tr>
    	<td>Default value</td>
        <td>ldap://localhost:389</td>
    </tr>
	<tr>
    	<td colspan=2>constructor-arg 2</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>Distinguished name of the user accessing LDAP server</td>
    </tr>
	<tr>
    	<td>Default value</td>
        <td>CN=Administrator,CN=Users,DC=beaconit,DC=domain</td>
    </tr>
	<tr>
    	<td colspan=2>constructor-arg 3</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>Password of the user accessing LDAP server.</td>
    </tr>
	<tr>
    	<td>Default value</td>
        <td>Secret</td>
    </tr>
	<tr>
    	<td colspan=2>constructor-arg 4</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>Distinguished name which user search is based on.</td>
    </tr>
	<tr>
    	<td>Default value</td>
        <td>CN=Users,DC=beaconit,DC=domain</td>
    </tr>
	<tr>
    	<td colspan=2>constructor-arg 5</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>Distinguished name which organization search is executed based on.</td>
    </tr>
	<tr>
    	<td>Default value</td>
        <td>OU=MyOffice,DC=beaconit,DC=domain</td>
    </tr>
	<tr>
    	<td colspan=2>userSearchAttr property user_id</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>Attribute name of user ID.</td>
    </tr>
	<tr>
    	<td>Default value</td>
        <td>sAMAccountName (default account ID of ActiveDirectory)</td>
    </tr>
	<tr>
    	<td colspan=2>userSearchAttr property user_name</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>Attribute name of user name.User search is executed based on this property.</td>
    </tr>
	<tr>
    	<td>Default value</td>
        <td>cn (default user name attribute of ActiveDirectory)</td>
    </tr>
	<tr>
    	<td colspan=2>userSearchAttr property user_mail</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>Attribute name of user's email address.User search by Email is executed based on this property.</td>
    </tr>
	<tr>
    	<td>Default: (</td>
        <td>mail (default account mail attribute of ActiveDirectory)</td>
    </tr>
	<tr>
    	<td colspan=2>groupSearchAttr property org_name</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>Name of the group which a user belongs to.User search by organization is executed based on this property.</td>
    </tr>
	<tr>
    	<td>Default: (</td>
        <td>cn (default user name attribute of ActiveDirectory)</td>
    </tr>
	<tr>
    	<td colspan=2>groupSearchAttr property org_member</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>Attribute for referring users belonging to a group.</td>
    </tr>
	<tr>
    	<td>Default: (</td>
        <td>member (default belonging user attribute of ActiveDirectory)</td>
    </tr>
	<tr>
    	<td colspan=2>userNameAttr</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>Attribute name to use as the username for display.Set it when the attribute to show is different form the the the attribute for search.</td>
    </tr>
	<tr>
    	<td>Default: (</td>
        <td>None</td>
    </tr>
</table>

  6.Overwrite `/infoscoop/sample/ldap.xml`.

<a name="set_sso_filter"></a>
## 4 Authentication Settings 2: Using SSO Product

This section explains how to cooperate the User Authentication with the Single Sign-On(henceforth, SSO) product which was installed.  
When using the previous section <a href="#without_sso">3 Authentication Settings 1: Not Using SSO Environment</a> to set, this section is not necessary.  
Usually,SSO product offers the module for cooperation as a servlet filter.This section explains how to use the servlet filter for SSO in the infoScoop OpenSource.

1.Open /infoScoop/build.properties with a text editor like Notepad.  
2.Edit the following right side items according to the SSO product.
    
    sessionCreateConfig.loginAuthentication=false
    customizeSSOFilterClass=CustomizeSSOFilter
    sessionCreateConfig.uidHeader=UID
    sessionCreateConfig.usernameHeader=LOGINUSER_NAME

The settings are as follows.

_build.properties Settings_

<table>
	<tr>
    	<td nowrap>Property Name</td>
        <td>Descriptions</td>
    </tr>
	<tr>
    	<td colspan=2>sessionCreateConfig.loginAuthentication</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>Use the default login screen authentication or not.</td>
    </tr>
	<tr>
    	<td>Default value</td>
        <td>&lt;option key="ENABLE_XML_LOG"&gt;true&lt;/option&gt;</td>
    </tr>
	<tr>
    	<td>Details</td>
        <td>
        	Specify one of the follosing.</br>
            true: use the default login screen authentication.</br>
			false: not use the default login screen authentication.Specify false when using an SSO environment.
        </td>
    </tr>
	<tr>
    	<td colspan=2>customizeSSOFilterClass</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>Servlet filter class name that the SSO product offers.</td>
    </tr>
	<tr>
    	<td>Details</td>
        <td>
        	Make the settings according to the SSO product.</br>
            For more information, please refer to the manual of the SSO product.</br>
			In general, this setting is not necessary when using the reverse proxy type composition to cooperate.
        </td>
    </tr>
	<tr>
    	<td colspan=2>sessionCreateConfig.uidHeader</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>HTTP header name that contains the user ID information sent from the SSO product.</td>
    </tr>
	<tr>
    	<td>Details</td>
        <td>
        	Make the settings according to the SSO product.</br>
            For more information, please refer to the manual of the SSO product.
        </td>
    </tr>
	<tr>
    	<td colspan=2>sessionCreateConfig.usernameHeader</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>HTTP header name that contains the user ID information sent from the SSO product.</td>
    </tr>
	<tr>
    	<td>Details</td>
        <td>
        	Make the settings according to the SSO product.</br>
            For more information, please refer to the manual of the SSO product.
        </td>
    </tr>
</table>

  3.Save `build.properties`.  
  4.Arrange the servlet filter class provided by the SSO product.

  * When the servlet filter class is offered by the jar file format, please arrange it to `/infoscoop/Customization/WEB-INF/lib` folder.
  * When the servlet filter class is offered by the class file format, please arrange it with package to `/infoscoop/Customization/WEB-INF/classes` folder.

**Note:**  
Please ask in the user forum, when it is necessary to cooperate with SSO product by methods other than the above-mentioned explanation.

<a name="http-header"></a>
## 5 Define the HTTP header as role information

infoScoop OpenSouce has the feature to switch the Menu, the Default Layout's composition according to the user's role(affiliation information).  
This feature can be used as a role infomation that was sent by as HTTP header. Role setting is done according to the authentication mechanism and the Single Sign-On product.  
Also, when adding the module that was mapped to HTTP header information directly from the directory server which the user belongs, it can be setted as a servlet filter.

Please refer to the [Administration Guide] for more information about the feature to switch the Default Layout's composition according to the user's role(affiliation information).

  1.Open `/infoscoop/principalHeaderList.json` with a text editor like Notepad.  
  2.Edit the following examples according to the running environment.
    
    [
       {
           type: "UserGroupPrincipal",
           displayName: "User Groups",
           headerName: "ROLE_USER_GROUP"
       }
    ]
        

`principalHeaderList.json` is a file format of JSON.  
The following becomes one setup and specifies this entry as arrangement.

> {type:"OrganizationPrincipal",displayName:"Organization",headerName:"ORGANIZAT
ION"}

Sequence of each entry is specified in a comma-separated as follows: in the `[`, `]`.

> [ {Entry1},{Entry2},{Entry3}]

The following is explanation about each setting item.

_principalHeaderList.json setting_

<table>
	<tr>
    	<td nowrap>Property Name</td>
        <td>Descriptions</td>
    </tr>
	<tr>
    	<td>Type</td>
        <td>
        	Identifier of the subject of the role.Uniquely set.</br>
            UIDPrincipal is reserved by infoScoop OSS.</br>
            The character which can be used by type is only the half-width alphabet.</br>
            Please set up type specified as each entry not to overlap.
        </td>
    </tr>
	<tr>
    	<td>displayName</td>
        <td>Label to be displayed in the pull-down list to select the object of the Administration page.</td>
    </tr>
	<tr>
    	<td>headerName</td>
        <td>HTTP header name which sends the string name of the actual object.</td>
    </tr>
</table>

  3.Save `principalHeaderList.json.`  
In order to use the information of Directory server and other user master as a object, it is necessary to create a servlet filter which maps the acquired information in a HTTP header, and add it to the infoScoopOSS module.

Please do the setting of the following items just when adding a custom servlet filter.

4.Open `/infoScoop/build.properties` with a text editor like Notepad.  
5.Edit the following right side items according to the SSO product.

    customizeSetRoleHeaderFilterClass=org.infoscoop.web.CustomizeRoleFilter

The settings are as follows.

_build.properties Settings_

<table>
	<tr>
    	<td nowrap>Property Name</td>
        <td>Descriptions</td>
    </tr>
	<tr>
    	<td colspan=2>customizeSetRoleHeaderFilterClass</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>Custom-made servlet filter name for roll information mapping.</td>
    </tr>
	<tr>
    	<td>Details</td>
        <td>Specifies the class name of the servlet filter to pass to InfoScoop OSS as a HTTP header which was obtained from the user master(Directory Server).</td>
    </tr>
</table>

6.Save `build.properties`.  
7.Arrange the the servlet filter class which is created. 

  * When the servlet filter class is arranged by the jar file format, please arrange it to `/infoscoop/Customization/WEB-INF/lib` folder.
  * When the servlet filter class is arranged by the class file format, please arrange it with package to `/infoscoop/Customization/WEB-INF/classes` folder.

## 6 Setting the Application Log Output.

When using the default setting of infoScoop OpenSource, the Application Log Output is as follows.

For Windows:
    
    <the drive of AP server which infoScoop is deployed>:\var\log\infoscoop\

For Linux:
    
    /var/log/infoscoop

**Note:**  
The write permissions for the above-mentioned directory is required for the user who runs a web application server.  
Log file name is in the form of `infoscoop_log_yyyyMMdd.log` every day.  
eg） infoscoop_log_20080808.log  
If there is no problem with the default settings of the above, it is not necessary to set the Application Log Output.  
The following files are corrected to change the set of Application Log Output.

    /infoscoop/Customization/WEB-INF/conf/log4j.xml

Please refer to the `infoScoop operational manual(in preparation)` for the information about how to modify the configuration files.

## 7 Login user ID is case-insensitive

In the default setting of infoScoop OSS,the login user ID is case-sensitive.  
When the Authentication service is case-insensitive just as LDAP, do the following settings.

**Note:**  
Many directory servers including ActiveDirectory is case-insensitive at the time of authentication.

1.Open `/infoScoop/build.properties` with a text editor like Notepad.  
2.Uncomment the following line(remove the `#` at the beginning of the line), edit the right side items.

_A part of build.properties_

    sessionCreateConfig.uidIgnoreCase=false

The settings are as follows.

_build.properties Settings_

<table>
	<tr>
    	<td nowrap>Property Name</td>
        <td>Descriptions</td>
    </tr>
	<tr>
    	<td colspan=2>sessionManagerFilter.uidIgnoreCase</td>
    </tr>
	<tr>
    	<td nowrap>Setting content</td>
        <td>Login user ID is case-sensitive or not</td>
    </tr>
	<tr>
    	<td>Details</td>
        <td>
        	Specify one of the follosing.</br><br>
            true : case-insensitive</br>
			false: false : case-sensitive
        </td>
    </tr>
</table>

3.`Save build.properties`.  
Changed the setting of `sessionManagerFilter.uidIgnoreCase` from false(default) to true,when logging in as a user ID that the capital letter is different from the small letters in the information of existing user, the display which is used to select the user profile will be show.

## 8 Other Settings

`remakewar.bat(sh)` develops the infoscoop.war file to overwrites it by the contents of the Customization directory then summarizes in the WAR file again.
Customization directory is organized as follows.  

    Customization  
    |   changePassword.jsp
    |   login.jsp
    |   openid_login.jsp.sample
    |
    \---WEB-INF
        +---classes
        +---conf
        |       log4j.xml
        |
        \---lib

* **changePassword.jsp:** JSP to display the form for change password
* **login.jsp:** JSP to display login form
* **openid_login.jsp.sample:** sample JSP to display login form for OpenID
* **classes:** SSO or the class of the servlet filter for roll information acquisition.Directory for file deployment.
* **log4j.xml:** configuration files of the Application Log Output.
* **lib:** SSO or Jar file for deployment directory of the servlet filter for role information acquisition.

In the above table, customization of the file except being indicated becomes the outside of the object of protection of upgrade.  
In addition to the settings described in the previous sections,only the login page and the page for change password will be displayed when useing the standard login mechanism of infoScoop OSS. About the handling of files that are not included in the table above, please ask in the user forum.

## 9 Re-make the WAR File

After you complete the initial configuration of the system, run the batch(shell script) from the command line to re-make the WAR file.Run the following batch(shell script).

For Windows:

    \infoscoop\remakewar.bat

Linux:

    /var/infoscoop

The infoscoop.war will be re-maked in the `¥infoscoop¥dist` directory.

Following this procedure, contents of the setting will be reflected in the WAR file which was re-maked.

**Note:**  
When Apache Ant is not working normally, it is not possible to create a WAR file correctly.

## 10 Save Customization Settings

After customized the WAR file, the WAR file for deploy must be re-maked again by the `remakewar.bat(sh)` when the version and patch up.

About `Customization` and `build.properties` directory, please keep them in a safe place because you will need patch up the next version up. Since the `customization` and `build.properties` directorys needed for a next patch up or version up, please keep it carefully.


[Apache Ant Document]: http://ant.apache.org/manual/index.html
[Administration Guide]: ../administration-guide/index.md
