# Gadget XML Spec

Gadget XML which can be used in infoScoop OpenSource is fundamentally based on [Gadget XML Schema] of OpenSocial.  
But about the attribute which has not been indicated, we do not guarantee operation.

**/Module**
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Description</th>
            <th>Requirement / Default</th>
        </tr>
    </thead>
    <tbody>
	<tr>
    	<td>@specificationVersion</td>
    	<td>
        	The version of the OpenSocial specification.<br>
            If this value is less than 2.0, the Gadget is rendered in browser quirks mode. With 2.0 or more, the Gadget is rendered in HTML5.
        </td>
    	<td>1.0</td>
    </tr>
    </tbody>
</table>

**/ModulePrefs**
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Description</th>
            <th>Requirement / Default</th>
        </tr>
    </thead>
    <tbody>
	<tr>
    	<td>@title</td>
    	<td>The gadget's title. It is displayed on the header of a gadget.</td>
    	<td>Required</td>
    </tr>
	<tr>
    	<td>@title_url</td>
    	<td>If @title is displayed, it becomes a link of this value.</td>
    	<td></td>
    </tr>
	<tr>
    	<td>@height</td>
    	<td>The preferred default height of the gadget, in pixels.</td>
    	<td>200</td>
    </tr>
	<tr>
    	<td>@doctype</td>
    	<td>A string that identifies the preferred rendering method. When set to <b>quirksmode</b>, the Gadget is rendered in browser quirks mode.</td>
    	<td></td>
    </tr>
    </tbody>
</table>

**/ModulePrefs/Require and /ModulePrefs/Optional**
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Description</th>
            <th>Requirement / Default</th>
        </tr>
    </thead>
    <tbody>
	<tr>
    	<td>@feature</td>
    	<td>
        	The name of the Feature.<br>
            Refer to the <a href="available-features.md">Available Features</a> for the details of the Feature.
        </td>
    	<td>Required</td>
    </tr>
	<tr>
    	<td>@views</td>
    	<td>
        	A comma-separated list of Views to load this feature for.<br>
            Refer to the <a href="available-features.md">Available Features</a> for the details of the available view type.
        </td>
    	<td></td>
    </tr>
    </tbody>
</table>

**/ModulePrefs/Require/Param and /ModulePrefs/Optional/Param**
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Description</th>
            <th>Requirement / Default</th>
        </tr>
    </thead>
    <tbody>
	<tr>
    	<td>@name</td>
    	<td>
        	The name of the parameter.<br>
            The parameter which can be used is dependent on Feature.
        </td>
    	<td>Required</td>
    </tr>
    </tbody>
</table>

**/ModulePrefs/Locale**
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Description</th>
            <th>Requirement / Default</th>
        </tr>
    </thead>
    <tbody>
   	<tr>
    	<td>@lang</td>
    	<td>The language for this locale.</td>
    	<td>ALL</td>
    </tr>
   	<tr>
    	<td>@country</td>
    	<td>The country for this locale.</td>
    	<td>ALL</td>
    </tr>
   	<tr>
    	<td>@messages</td>
    	<td>The URL of a message bundle.</td>
    	<td></td>
    </tr>
   	<tr>
    	<td>@language_direction</td>
    	<td>Specifies the direction to render the gadget in. Valid values are <b>rtl</b> (right to left) and <b>ltr</b> (left to right).</td>
    	<td></td>
    </tr>
    </tbody>
</table>

**/ModulePrefs/Locale/msg**
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Description</th>
            <th>Requirement / Default</th>
        </tr>
    </thead>
    <tbody>
   	<tr>
    	<td>@name</td>
    	<td>The name of the localized message.</td>
    	<td>Required</td>
    </tr>
   	<tr>
    	<td>text()</td>
    	<td>
        	The value of the message.<br>
            This value is acquirable by JavaScript API method
<b>gadgets.Prefs.getMsg(@name)</b> and for MSG substitutions. __MSG_{@name}__
        </td>
    	<td></td>
    </tr>
    </tbody>
</table>

**/ModulePrefs/OAuth**  
Supplies the container with OAuth service configuration for the gadget. This tag has no attributes and has child elements.

**/ModulePrefs/OAuth/Service**
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Description</th>
            <th>Requirement / Default</th>
        </tr>
    </thead>
    <tbody>
   	<tr>
    	<td>@name</td>
    	<td>The name of the service, used for referencing OAuth services at runtime. Gadget developers specify which OAuth service they wish to use by passing the service name as a parameter to <b>gadgets.io.makeRequest</b>.</td>
    	<td></td>
    </tr>
    </tbody>
</table>

**/ModulePrefs/OAuth/Service/Request**
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Description</th>
            <th>Requirement / Default</th>
        </tr>
    </thead>
    <tbody>
   	<tr>
    	<td>@url</td>
    	<td>The URL for acquiring a request token.</td>
    	<td>Required</td>
    </tr>
   	<tr>
    	<td>@method</td>
    	<td>The HTTP verb to use for making the request. (GET | POST)</td>
    	<td>POST</td>
    </tr>
    </tbody>
</table>

**/ModulePrefs/OAuth/Service/Access**
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Description</th>
            <th>Requirement / Default</th>
        </tr>
    </thead>
    <tbody>
   	<tr>
    	<td>@url</td>
    	<td>The URL for acquiring a access token.</td>
    	<td>Required</td>
    </tr>
   	<tr>
    	<td>@method</td>
    	<td>The HTTP verb to use for making the request. (GET | POST)</td>
    	<td>POST</td>
    </tr>
    </tbody>
</table>

**/ModulePrefs/OAuth/Service/Authorization**
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Description</th>
            <th>Requirement / Default</th>
        </tr>
    </thead>
    <tbody>
   	<tr>
    	<td>@url</td>
    	<td>The OAuth authorization URL.</td>
    	<td>Required</td>
    </tr>
    </tbody>
</table>

**/ModulePrefs/OAuth2**  
Supplies the container with OAuth 2.0 service configuration for the gadget. This tag has no attributes and has child elements.

**/ModulePrefs/OAuth2/Service**
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Description</th>
            <th>Requirement / Default</th>
        </tr>
    </thead>
    <tbody>
   	<tr>
    	<td>@name</td>
    	<td>The name of the service, used for referencing OAuth 2.0 services at runtime. Gadget developers specify which OAuth 2.0 service they wish to use by passing the service name as a parameter to <b>gadgets.io.makeRequest</b>.</td>
    	<td></td>
    </tr>
   	<tr>
    	<td>@scope</td>
    	<td>The value of the OAuth 2.0 scope parameter to be used by default in requests. This value is superseded when <b>gadgets.io.RequestParameters.OAUTH2_SCOPE</b> is used.</td>
    	<td></td>
    </tr>
    </tbody>
</table>

**/ModulePrefs/OAuth2/Service/Authorization**
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Description</th>
            <th>Requirement / Default</th>
        </tr>
    </thead>
    <tbody>
   	<tr>
    	<td>@url</td>
    	<td>The URL for acquiring a authorization code.</td>
    	<td>Required</td>
    </tr>
   	<tr>
    	<td>@method</td>
    	<td>The HTTP verb to use for making the request. (GET | POST)</td>
    	<td>GET</td>
    </tr>
    </tbody>
</table>

**/ModulePrefs/OAuth2/Service/Token**
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Description</th>
            <th>Requirement / Default</th>
        </tr>
    </thead>
    <tbody>
   	<tr>
    	<td>@url</td>
    	<td>The URL for acquiring a access token.</td>
    	<td>Required</td>
    </tr>
    </tbody>
</table>

**/UserPref**
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Description</th>
            <th>Requirement / Default</th>
        </tr>
    </thead>
    <tbody>
   	<tr>
    	<td>@name</td>
    	<td>
        	The name of the preference.<br>
            The character string <b>default</b> and <b>enum</b> cannot be used for the this attribute.
        </td>
    	<td>Required</td>
    </tr>
   	<tr>
    	<td>@datatype</td>
    	<td>
        	The data type for this preference. Valid values are <b>string</b>, <b>hidden</b>, <b>bool</b>, <b>list</b>, and <b>number</b>.<br>
            When @datatype is <b>list</b>, if the character string <b>%7C</b> is inputted, it will replace by <b>|</b>.
        </td>
    	<td>string</td>
    </tr>
   	<tr>
    	<td>@display_name</td>
    	<td>The name of the preference for use when rendering an editing interface for prefs.</td>
    	<td></td>
    </tr>
   	<tr>
    	<td>@default_value</td>
    	<td>A default value for this preference.</td>
    	<td></td>
    </tr>
   	<tr>
    	<td>@required</td>
    	<td>Whether or not a valid value needs to be set for this preference in order for the gadget to function correctly. Valid values are <b>true</b> and <b>false</b>.</td>
    	<td>false</td>
    </tr>
    </tbody>
</table>

**/UserPref/EnumValue**
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Description</th>
            <th>Requirement / Default</th>
        </tr>
    </thead>
    <tbody>
   	<tr>
    	<td>@value</td>
    	<td>The value for this enumeration element.</td>
    	<td>Required</td>
    </tr>
   	<tr>
    	<td>@display_value</td>
    	<td>A textual representation of @value.</td>
    	<td>value of @value</td>
    </tr>
    </tbody>
</table>

**/Content**
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Description</th>
            <th>Requirement / Default</th>
        </tr>
    </thead>
    <tbody>
   	<tr>
    	<td>@type</td>
    	<td>
        	The type of content included in the body of this element. Valid values are <b>html</b> and <b>url</b>.<br>
            When @type is <b>html</b>, the Gadget is rendered in container.<br>
            When @type is <b>url</b>, The Gadget is displayed at /Content/@href.
        </td>
    	<td>html</td>
    </tr>
   	<tr>
    	<td>@href</td>
    	<td>
        	If @type is <b>url</b>, this value is REQUIRED.<br>
            The Gadget is displayed at this url.
        </td>
    	<td></td>
    </tr>
   	<tr>
    	<td>@view</td>
    	<td>
        	Either <b>home</b> or <b>canvas</b> is specified.<br>
            Usually, <b>home</b> is displayed.<br>
            <b>canvas</b> is displayed at the time of maximization.
        </td>
    	<td>home</td>
    </tr>
   	<tr>
    	<td>text()</td>
    	<td>When @type is <b>html</b>, if no @href is specified, this html is rendered in Gadget.</td>
    	<td></td>
    </tr>
    </tbody>
</table>


[Gadget XML Schema]: http://opensocial-resources.googlecode.com/svn/spec/trunk/Core-Gadget.xml#GadgetXmlSchema
