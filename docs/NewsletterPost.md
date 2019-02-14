# SwaggerClient::NewsletterPost

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | the type of newsletter | [optional] [default to &quot;default&quot;]
**name** | **String** | a name for the newsletter | [optional] 
**description** | **String** | a description for the newsletter | [optional] 
**has_open_tracking** | **BOOLEAN** | weither open_tracking is enabled or not | [optional] 
**has_click_tracking** | **BOOLEAN** | weither click_tracking is enabled or not | [optional] 
**has_conversion_tracking** | **BOOLEAN** | weither click_tracking is enabled or not | [optional] 
**json** | **String** | the json-description of the content. | [optional] 
**html** | **String** | the html content of the newsletter. Is needed when json is not submitted. Otherwise html is optional and will override the html generated out of the json. | [optional] 
**text** | **String** | the text content of the newsletter. If submitted, it will overwrite the automatically generated text-version out of json/html | [optional] 
**subject** | **String** | the subject of the newsletter | [optional] 
**preheader** | **String** | the preheader of the newsletter | [optional] 
**header_reply_email** | **String** | the reply email send in the header of the newsletter | [optional] 
**header_reply_name** | **String** | the reply name send in the header of the newsletter | [optional] 
**header_from_email** | **String** | the from email send in the header of the newsletter | [optional] 
**header_from_name** | **String** | the from name send in the header of the newsletter | [optional] 


