# JavaScript API Limitation

## Core Gadget Specification

### osapi

  * The functions supported are only as follows.
    * osapi.http.get, osapi.http.post, osapi.http.put, osapi.http.delete, newBatch.
  * The following parameters of osapi.http.* are does not corresponding.
    * alias, oauth_request_token, oauth_request_token_secret, oauth_token_name, oauth_use_token, refreshInterval, sign_owner, sign_viewer.

### rpc

  * gadgets.rpc.getReceiverOrigin does not correspond.

### views

  * gadgets.views.bind does not correspond.
  * gadgets.views.openEmbeddedExperience does not correspond.
  * gadgets.views.View.bind does not correspond.
  * gadgets.views.View.getUrlTemplate does not correspond.
  * ViewType of the following is supported.
    * CANVAS
    * HOME
  * DEFAULT of ViewType is HOME.

### core

  * The following parameters of gadgets.io.MethodType.* are does not corresponding.
    * HEAD, PATCH
  * The following parameters of gadgets.io.RequestParameters.* are does not corresponding.
    *  ALIAS, OAUTH_REQUEST_TOKEN, OAUTH_REQUEST_TOKEN_SECRET, OAUTH_TOKEN_NAME, OAUTH_USE_TOKEN, REFRESH_INTERVAL, SIGN_OWNER, SIGN_VIEWER.
  * gadgets.io.ProxyUrlRequestParameters.REFRESH_INTERVAL does not correspond.
  * In the data reception by gadgets.io.makeRequest, only UTF-8 corresponds.

## Social Gadget Specification

### osapi

  * The functions supported are only as follows.
    * osapi.people.get, osapi.people.getViewer, osapi.people.getViewerFriends, osapi.people.getOwner, osapi.people.getOwnerFriends
  * The profile information acquired by "osapi.people.*" is un-corresponding except the following fields.
    * id, displayName, emails, organizations
    * It is necessary to set accountAccessConfig as a directory server about `emails` and `organizations`.
  * If specifying groupID by osapi.people.*, all are treated as @self. osapi.people.getOwnerFriends and osapi.people.getViewerFriends are also the same.


