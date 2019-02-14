# SwaggerClient::RecipientApi

All URIs are relative to *https://api.newsletter2go.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**add_recipient_to_group**](RecipientApi.md#add_recipient_to_group) | **POST** /lists/{lid}/groups/{gid}/recipients/{id} | add single recipient to group
[**add_recipients_to_group**](RecipientApi.md#add_recipients_to_group) | **POST** /lists/{lid}/groups/{gid}/recipients | add all Recipients to the given group
[**create_recipient**](RecipientApi.md#create_recipient) | **POST** /recipients | create new recipient(s) or updates existing ones
[**delete_recipient**](RecipientApi.md#delete_recipient) | **DELETE** /lists/{lid}/recipients/{id} | delete the recipient
[**get_recipients**](RecipientApi.md#get_recipients) | **GET** /lists/{lid}/recipients | get all Recipients of selected list
[**get_recipients_by_group**](RecipientApi.md#get_recipients_by_group) | **GET** /lists/{lid}/groups/{gid}/recipients | get all Recipients of selected group
[**import_recipients_init**](RecipientApi.md#import_recipients_init) | **POST** /lists/{lid}/recipients/import/init | Initialize the import of recipients by file
[**import_recipients_save**](RecipientApi.md#import_recipients_save) | **POST** /lists/{lid}/recipients/import/save | Start the import recipients by file
[**import_recipients_statistics**](RecipientApi.md#import_recipients_statistics) | **GET** /import/{id}/info | Get statistics about the import by file
[**remove_recipient_from_group**](RecipientApi.md#remove_recipient_from_group) | **DELETE** /lists/{lid}/groups/{gid}/recipients/{id} | remove single recipient from group
[**remove_recipients_from_group**](RecipientApi.md#remove_recipients_from_group) | **DELETE** /lists/{lid}/groups/{gid}/recipients | remove all Recipients from given group
[**remove_recipients_from_list**](RecipientApi.md#remove_recipients_from_list) | **DELETE** /lists/{lid}/recipients | remove all Recipients from selected list
[**subscribe_recipient**](RecipientApi.md#subscribe_recipient) | **POST** /forms/submit/{code} | Creates a new recipient and sends a DOI-Mail
[**update_recipient**](RecipientApi.md#update_recipient) | **PATCH** /lists/{lid}/recipients/{id} | update the recipient.
[**update_recipients**](RecipientApi.md#update_recipients) | **PATCH** /lists/{lid}/recipients | update all Recipients in selected list


# **add_recipient_to_group**
> PatchResponse add_recipient_to_group(lid, gid, id)

add single recipient to group

add Recipient to Group

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::RecipientApi.new

lid = "lid_example" # String | the id of the list

gid = "gid_example" # String | the id of the group

id = "id_example" # String | the id of the recipient


begin
  #add single recipient to group
  result = api_instance.add_recipient_to_group(lid, gid, id)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RecipientApi->add_recipient_to_group: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lid** | **String**| the id of the list | 
 **gid** | **String**| the id of the group | 
 **id** | **String**| the id of the recipient | 

### Return type

[**PatchResponse**](PatchResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **add_recipients_to_group**
> PatchResponse add_recipients_to_group(lid, gid, opts)

add all Recipients to the given group

add all Recipients to the given group. Pay attention to the filter, if you forget to submit it, all recipients of the current list are getting added to the group!

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::RecipientApi.new

lid = "lid_example" # String | the id of the list

gid = "gid_example" # String | the id of the group

opts = { 
  _filter: "_filter_example", # String | a FIQL-Filter
}

begin
  #add all Recipients to the given group
  result = api_instance.add_recipients_to_group(lid, gid, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RecipientApi->add_recipients_to_group: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lid** | **String**| the id of the list | 
 **gid** | **String**| the id of the group | 
 **_filter** | **String**| a FIQL-Filter | [optional] 

### Return type

[**PatchResponse**](PatchResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **create_recipient**
> ApiResponsePost create_recipient(recipient)

create new recipient(s) or updates existing ones

create new recipient(s).<br>If a custom attribute shall by saved for the new recipient just submit them in the json body by name.<br>If <b>multiple recipients</b> shall by saved at once, submit multiple recipient-objects as a json array.<br><b>In this case all objects must share the same attributes.</b><br/>If the e-mail-address exists already the existing recipient gets updated.

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::RecipientApi.new

recipient = SwaggerClient::RecipientPost.new # RecipientPost | the data to save


begin
  #create new recipient(s) or updates existing ones
  result = api_instance.create_recipient(recipient)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RecipientApi->create_recipient: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recipient** | [**RecipientPost**](RecipientPost.md)| the data to save | 

### Return type

[**ApiResponsePost**](ApiResponsePost.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_recipient**
> ApiResponseDelete delete_recipient(lid, id)

delete the recipient

delete one recipient

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::RecipientApi.new

lid = "lid_example" # String | the id of the list

id = "id_example" # String | the id of the recipient


begin
  #delete the recipient
  result = api_instance.delete_recipient(lid, id)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RecipientApi->delete_recipient: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lid** | **String**| the id of the list | 
 **id** | **String**| the id of the recipient | 

### Return type

[**ApiResponseDelete**](ApiResponseDelete.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_recipients**
> RecipientResponse get_recipients(lid, opts)

get all Recipients of selected list

Get Recipients. If the API shall return custom attributes also, submit them in the _fields-Parameter by name.

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::RecipientApi.new

lid = "lid_example" # String | the id of the list

opts = { 
  _filter: "_filter_example", # String | a FIQL-Filter
  _limit: 50, # Integer | a limit for list-responses
  _offset: 0, # Integer | an offset for list-responses
  _expand: true, # BOOLEAN | true if attributes should be returned or not
  _fields: ["_fields_example"] # Array<String> | list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed
}

begin
  #get all Recipients of selected list
  result = api_instance.get_recipients(lid, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RecipientApi->get_recipients: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lid** | **String**| the id of the list | 
 **_filter** | **String**| a FIQL-Filter | [optional] 
 **_limit** | **Integer**| a limit for list-responses | [optional] [default to 50]
 **_offset** | **Integer**| an offset for list-responses | [optional] [default to 0]
 **_expand** | **BOOLEAN**| true if attributes should be returned or not | [optional] 
 **_fields** | [**Array&lt;String&gt;**](String.md)| list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed | [optional] 

### Return type

[**RecipientResponse**](RecipientResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_recipients_by_group**
> RecipientResponse get_recipients_by_group(lid, gid, opts)

get all Recipients of selected group

get Recipients

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::RecipientApi.new

lid = "lid_example" # String | the id of the list

gid = "gid_example" # String | the id of the group

opts = { 
  _filter: "_filter_example", # String | a FIQL-Filter
  _limit: 50, # Integer | a limit for list-responses
  _offset: 0, # Integer | an offset for list-responses
  _expand: true, # BOOLEAN | true if attributes should be returned or not
  _fields: ["_fields_example"] # Array<String> | list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed
}

begin
  #get all Recipients of selected group
  result = api_instance.get_recipients_by_group(lid, gid, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RecipientApi->get_recipients_by_group: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lid** | **String**| the id of the list | 
 **gid** | **String**| the id of the group | 
 **_filter** | **String**| a FIQL-Filter | [optional] 
 **_limit** | **Integer**| a limit for list-responses | [optional] [default to 50]
 **_offset** | **Integer**| an offset for list-responses | [optional] [default to 0]
 **_expand** | **BOOLEAN**| true if attributes should be returned or not | [optional] 
 **_fields** | [**Array&lt;String&gt;**](String.md)| list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed | [optional] 

### Return type

[**RecipientResponse**](RecipientResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **import_recipients_init**
> InlineResponse200 import_recipients_init(lid, file)

Initialize the import of recipients by file

Initialize the import recipients by file

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::RecipientApi.new

lid = "lid_example" # String | the id of the list

file = File.new("/path/to/file.txt") # File | recipient file to upload


begin
  #Initialize the import of recipients by file
  result = api_instance.import_recipients_init(lid, file)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RecipientApi->import_recipients_init: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lid** | **String**| the id of the list | 
 **file** | **File**| recipient file to upload | 

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json



# **import_recipients_save**
> ApiResponsePost import_recipients_save(lid, data)

Start the import recipients by file

Start the import recipients by file. The returned id can be used to fetch further statistics about the import.

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::RecipientApi.new

lid = "lid_example" # String | the id of the list

data = SwaggerClient::Data.new # Data | the data to start the import


begin
  #Start the import recipients by file
  result = api_instance.import_recipients_save(lid, data)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RecipientApi->import_recipients_save: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lid** | **String**| the id of the list | 
 **data** | [**Data**](Data.md)| the data to start the import | 

### Return type

[**ApiResponsePost**](ApiResponsePost.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **import_recipients_statistics**
> ImportResponse import_recipients_statistics(id)

Get statistics about the import by file

Get statistics about the import by file.

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::RecipientApi.new

id = "id_example" # String | the id of the import job


begin
  #Get statistics about the import by file
  result = api_instance.import_recipients_statistics(id)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RecipientApi->import_recipients_statistics: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| the id of the import job | 

### Return type

[**ImportResponse**](ImportResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **remove_recipient_from_group**
> PatchResponse remove_recipient_from_group(lid, gid, id)

remove single recipient from group

remove Recipient to Group

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::RecipientApi.new

lid = "lid_example" # String | the id of the list

gid = "gid_example" # String | the id of the group

id = "id_example" # String | the id of the recipient


begin
  #remove single recipient from group
  result = api_instance.remove_recipient_from_group(lid, gid, id)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RecipientApi->remove_recipient_from_group: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lid** | **String**| the id of the list | 
 **gid** | **String**| the id of the group | 
 **id** | **String**| the id of the recipient | 

### Return type

[**PatchResponse**](PatchResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **remove_recipients_from_group**
> PatchResponse remove_recipients_from_group(lid, gid, opts)

remove all Recipients from given group

remove all Recipients from given group. Pay attention to the filter, if you forget to submit it, all recipients are getting removed from the group!

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::RecipientApi.new

lid = "lid_example" # String | the id of the list

gid = "gid_example" # String | the id of the group

opts = { 
  _filter: "_filter_example", # String | a FIQL-Filter
}

begin
  #remove all Recipients from given group
  result = api_instance.remove_recipients_from_group(lid, gid, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RecipientApi->remove_recipients_from_group: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lid** | **String**| the id of the list | 
 **gid** | **String**| the id of the group | 
 **_filter** | **String**| a FIQL-Filter | [optional] 

### Return type

[**PatchResponse**](PatchResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **remove_recipients_from_list**
> PatchResponse remove_recipients_from_list(lid, opts)

remove all Recipients from selected list

remove Recipients from selected list. Pay attention to the filter, if you forget to submit it, all recipients of the current list are getting removed!

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::RecipientApi.new

lid = "lid_example" # String | the id of the list

opts = { 
  _filter: "_filter_example", # String | a FIQL-Filter
}

begin
  #remove all Recipients from selected list
  result = api_instance.remove_recipients_from_list(lid, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RecipientApi->remove_recipients_from_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lid** | **String**| the id of the list | 
 **_filter** | **String**| a FIQL-Filter | [optional] 

### Return type

[**PatchResponse**](PatchResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **subscribe_recipient**
> RecipientSubscribeResponse subscribe_recipient(code, recipient)

Creates a new recipient and sends a DOI-Mail

Creates a new recipient and sends the corresponding DOI-Mail attached to the previously created subscribe-form. The recipient will be available as soon as the recipient has confirmed the DOI-Mail.

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::RecipientApi.new

code = "code_example" # String | the subscribe-code displayed when creating a subscribe-form

recipient = SwaggerClient::RecipientSubscribe.new # RecipientSubscribe | the recipient to subscribe


begin
  #Creates a new recipient and sends a DOI-Mail
  result = api_instance.subscribe_recipient(code, recipient)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RecipientApi->subscribe_recipient: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**| the subscribe-code displayed when creating a subscribe-form | 
 **recipient** | [**RecipientSubscribe**](RecipientSubscribe.md)| the recipient to subscribe | 

### Return type

[**RecipientSubscribeResponse**](RecipientSubscribeResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **update_recipient**
> PatchResponse update_recipient(lid, id, recipient)

update the recipient.

update one Recipient. If a value of a custom attribute shall by changed just submit it in the json body

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::RecipientApi.new

lid = "lid_example" # String | the id of the list

id = "id_example" # String | the id of the recipient

recipient = SwaggerClient::RecipientPatch.new # RecipientPatch | the data to update


begin
  #update the recipient.
  result = api_instance.update_recipient(lid, id, recipient)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RecipientApi->update_recipient: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lid** | **String**| the id of the list | 
 **id** | **String**| the id of the recipient | 
 **recipient** | [**RecipientPatch**](RecipientPatch.md)| the data to update | 

### Return type

[**PatchResponse**](PatchResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **update_recipients**
> PatchResponse update_recipients(lid, opts)

update all Recipients in selected list

Updates all recipients in the given list where the filter applies. If a value of a custom attribute shall by changed just submit it in the json body. Pay attention to the filter, if you forget to submit it, all recipients of the current list are getting updated!

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::RecipientApi.new

lid = "lid_example" # String | the id of the list

opts = { 
  _filter: "_filter_example", # String | a FIQL-Filter
}

begin
  #update all Recipients in selected list
  result = api_instance.update_recipients(lid, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling RecipientApi->update_recipients: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lid** | **String**| the id of the list | 
 **_filter** | **String**| a FIQL-Filter | [optional] 

### Return type

[**PatchResponse**](PatchResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



