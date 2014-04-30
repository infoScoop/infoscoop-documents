# OAuth Administration

A setup and the management method about OAuth and OAuth related specification are explained.

## 1 About OAuth

OAuth is that service (consumer) for mush-up makes it attest directly with service (service providers) for mush-up, without receiving a user's id and password directly, and is the specification which enables acquisition of required data.  
infoScoop OpenSource corresponds to a consumer.

Moreover related to OAuth, infoScoop OpenSource corresponds to the Signed Request which is the specification of OpenSocial.

OAuth settings of infoScoop OpenSource are needed if a gadget uses OAuth or signed request on infoScoop OpenSource.

Refer to the contents of this page and setup each required settings to use these gadgets.

## 2 About the OAuth Setting Method And Its Management Function

In order to use an OAuth gadget on infoScoop OpenSource, there are the following two methods.

  1. The gadget corresponding to OAuth is uploaded to infoScoop OpenSource.
  2. The gadget corresponding to OAuth in an external server is used.

Registration of the information on the OAuth gadget in an external server is performed from the **OAuth** management function of an infoScoop OpenSource administration page.

The following is explanation about the details of **OAuth** administration page.

## 3 OAuth Administration Page

An OAuth administration is opened by clicking **OAuth** from the menu of the upper part of Administration page.  
On this page, OAuth and Signed Request can be configured.  
The OAuth administration consists of **Consumer Settings** and **Container's Certificate**.  
This clause explains **Consumer Settings** tab and a **Container's Certificate** tab.

### 3.1 Consumer Settings

In order to use an OAuth gadget, it is necessary to add a setting of the gadget by **Consumer Settings**.

#### 3.1.1 Context Menu

The context menu of OAuth administration page is explained below.

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
    	<td><img src="../../images/add_menu_tree.gif"/></td>
        <td>Add</td>
        <td>Add the OAuth gadget settings.</td>
    </tr>
	<tr>
    	<td><img src="../../images/apply_changes.gif"/></td>
        <td>Apply changes</td>
        <td>Edit operation is saved by click.<br><b>Note:</b> Finally, if you do not click this icon, editing is destroyed.</td>
    </tr>
	<tr>
    	<td><img src="../../images/refresh.gif"/></td>
        <td>Refresh</td>
        <td>Discard the change and displays the last applied state.</td>
    </tr>
    </tbody>
</table>

#### 3.1.2 Add item

The OAuth setting item of a gadget can be added by clicking the ![Add icon] **Add** button at the upper left of the **Consumer Settings** page.  
A modal window is shown to setup the consumer setting.

![Consumer Settings]

#### 3.1.3 Setting item in Consumer Settings

The contents of the modal window for **Consumer Settings** are explained in the following tables.

<table>
    <thead>
    <tr>
        <th colspan="2">Setting Item</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td colspan="2">Service name</td>
        <td>Enter the service name of the gadget.<br>The service name of the gadget is described in the xml file which is a main part of a gadget.<br>The value of the name attribute of `Module/ModulePrefs/OAuth/Service` is a service name.</td>
    </tr>
    <tr>
        <td colspan="2">OAuth version</td>
        <td>Select the version of OAuth.<br>
            <ul>
                <li>1.0</li>
                <li>2.0</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td rowspan="3">1.0</td>
        <td>Signature algorism</td>
        <td>According to specification of a service provider, a signature algorithm is chosen from following two.<br>
            <ul>
                <li>HMAC-SHA1</li>
                <li>RSA-SHA1</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td>Consumer key</td>
        <td>The consumer key acquired from the service provider is typed when HMAC-SHA1 is selected.</td>
    </tr>
    <tr>
        <td>Consumer secret</td>
        <td>The consumer secret acquired from the service provider is typed when HMAC-SHA1 is selected.</td>
    </tr>
    <tr>
        <td rowspan="2">2.0</td>
        <td>Client ID</td>
        <td>Enter the client Id acquired from the service provider.</td>
    </tr>
    <tr>
        <td>Client secret</td>
        <td>Enter the client secret acquired from the service provider.</td>
    </tr>
    <tr>
        <td colspan="2">Description</td>
        <td>Enter the description of the consumer setting. (optional)</td>
    </tr>
    <tr>
        <td colspan="2">Add gagdget</td>
        <td>Add a gadget that uses the consumer setting.<br>A gadget can be added by entering the URL or by selecting from the uploaded gadgets.
        </td>
    </tr>
    <tr>
        <td rowspan="2"></td>
        <td>Gadget(URL specified)</td>
        <td>Enter the URL of a gadget.<br>e.g.&nbsp;http://www.infoscoop.org/gadgets/hello.xml
        </td>
    </tr>
    <tr>
        <td>UploadedGadget</td>
        <td>Select a gadget from the uploaded gadgets.<br>A gadget can be uploaded on <b>Gadget</b> Administration page.
        </td>
	</tr>
    </tbody>
</table>

<a name="container_cert"></a>
### 3.2 Container's certificate

In order to use the OAuth gadget using **RSA-SHA1** form, and **Signed Request**, a setup with **Container's certificate** is required.

The certificate set up here is used in order to verify creation of the signature added to the request to a service provider, and the signature which the service provider received.

Therefore, it is necessary to provide a service provider with a consumer key and a public key.  
Don't open to the public in addition to a service provider.

Moreover, although the sample is set up in the state of the first stage, Be sure to change a consumer key, a secret key, and a public key. Don't change these three setting items after a setup in principle.  
Because a service provider is provided with consumer key and public key as above-mentioned, if a setup is changed after offer, there is a possibility that it may become impossible to use service.

#### 3.2.1 Context Menu

The context menu of an **OAuth** administration is explained.

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
    	<td><img src="../../images/apply_changes.gif"/></td>
        <td>Apply changes</td>
    	<td>Edit operation is saved by click.<br><b>Note:</b> Finally, if you do not click this icon, editing is destroyed.</td>
    </tr>
	<tr>
    	<td><img src="../../images/refresh.gif"/></td>
        <td>Refresh</td>
    	<td>Discard the change and displays the last applied state.</td>
    </tr>
    </tbody>
</table>

#### 3.2.2 Setting item in Container's Certificate

The contents of an input of the setting item in **Container's Certificate**
are the following tables.

<table>
    <thead>
	<tr>
    	<th nowrap>Setting items</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
	<tr>
    	<td>Consumer key</td>
        <td>The arbitrary character strings for identifying a container uniquely are specified.<br>Pass a consumer key to the service provider corresponding to Signed Request or OAuth.</td>
    </tr>
	<tr>
    	<td>Private key</td>
        <td>A RSA secret key without the passphrase of PEM form is specified.<br>Don't open a secret key to nobody.</td>
    </tr>
	<tr>
    	<td>Public key</td>
        <td>The RSA public key of PEM form is specified.<br>Public key is acquirable from the following URL.<br>http://localhost:8080/infoscoop/opensocial/certificates/public.cer<br>Pass a public key to the service provider corresponding to Signed Request or OAuth.</td>
    </tr>
    </tbody>
</table>

## 4 OAuth Callback URL

When requesting a `OAuth consumer key` and a `consumer secret` to an OAuth service provider, provide of call-back URL may be requested.

Call-back URL can specify the following

  * OAuth1.0: http://\<hostname>:\<portnum>/infoscoop/oauthcallback
  * OAuth2.0: http://\<hostname>:\<portnum>/infoscoop/oauth2callback


[Add icon]: ../../images/add_menu_tree.gif
[Consumer Settings]: images/oauth/oauth-administration.png
