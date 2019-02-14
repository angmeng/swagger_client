# SwaggerClient::ImportGet

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**count_inserted** | **Integer** | the number of inserted recipients | [optional] 
**count_updated** | **Integer** | the number of updated recipients | [optional] 
**count_failed** | **Integer** | the number of failed recipients | [optional] 
**duplicate_recipients** | [**Array&lt;RecipientSimple&gt;**](RecipientSimple.md) | the recipients duplicated in the file | [optional] 
**invalid_recipients** | [**Array&lt;RecipientSimple&gt;**](RecipientSimple.md) | the recipients invalid in the file (like recipients with an invalid email-address | [optional] 


