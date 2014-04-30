# Signed Request

Signed Request is making a request that has a signature with RSA certificate to the destination web service. The distination web service can detect tampering by using the signature.  
To use signed request, it is necessary that the destination web service must accept signed request.  
It is recommended to use signed request to use external services.  
For more details about this specification, refer to [OAuth Consumer Request 1.0 Draft 1].

## Parameter Sent by infoScoop

The following parameters are sent by signed request to the destination web service.

**opensocial_viewer_id**  
Log-in user ID (Use this parameter for most cases)

**opensocial_owner_id**  
Log-in user ID

**opensocial_app_id**  
Module ID of the gadget

**opensocial_instance_id**  
Module Id of the gadget

**oauth_consumer_key**  
OAuth consumer key configured on Administration page

**oauth_signature_method**  
Sigunature method (RSA-SHA1 only)

**oauth_timestamp**  
UNIX time stamp value

**oauth_nonce**  
Randam strings

**oauth_version**  
OAuth version (1.0 only)

**oauth_signature**  
Signature to verify the request adequacy

Please refer to Administration Guide / <a href="../administration-guide/oauth-administration.md#container_cert">3.2 Container's certificate</a> for a setup of a RSA certificate.


[OAuth Consumer Request 1.0 Draft 1]: http://oauth.googlecode.com/svn/spec/ext/consumer_request/1.0/drafts/1/spec.html
[OAuth Administration]: ../administration-guide/oauth-administration.md
