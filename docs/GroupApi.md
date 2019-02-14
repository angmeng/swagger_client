# SwaggerClient::GroupApi

All URIs are relative to *https://api.newsletter2go.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**add_recipient_to_group**](GroupApi.md#add_recipient_to_group) | **POST** /lists/{lid}/groups/{gid}/recipients/{id} | add single recipient to group
[**add_recipients_to_group**](GroupApi.md#add_recipients_to_group) | **POST** /lists/{lid}/groups/{gid}/recipients | add all Recipients to the given group
[**create_group**](GroupApi.md#create_group) | **POST** /groups | creates a new group
[**delete_group**](GroupApi.md#delete_group) | **DELETE** /groups/{id} | delete the Group
[**get_groups**](GroupApi.md#get_groups) | **GET** /lists/{lid}/groups | get all Group of selected list
[**get_recipients_by_group**](GroupApi.md#get_recipients_by_group) | **GET** /lists/{lid}/groups/{gid}/recipients | get all Recipients of selected group
[**remove_recipient_from_group**](GroupApi.md#remove_recipient_from_group) | **DELETE** /lists/{lid}/groups/{gid}/recipients/{id} | remove single recipient from group
[**remove_recipients_from_group**](GroupApi.md#remove_recipients_from_group) | **DELETE** /lists/{lid}/groups/{gid}/recipients | remove all Recipients from given group
[**update_group**](GroupApi.md#update_group) | **PATCH** /groups/{id} | update the Group


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

api_instance = SwaggerClient::GroupApi.new

lid = "lid_example" # String | the id of the list

gid = "gid_example" # String | the id of the group

id = "id_example" # String | the id of the recipient


begin
  #add single recipient to group
  result = api_instance.add_recipient_to_group(lid, gid, id)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling GroupApi->add_recipient_to_group: #{e}"
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

api_instance = SwaggerClient::GroupApi.new

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
  puts "Exception when calling GroupApi->add_recipients_to_group: #{e}"
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



# **create_group**
> ApiResponsePost create_group(group)

creates a new group

creates a new group.

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::GroupApi.new

group = SwaggerClient::GroupPost.new # GroupPost | the data to save


begin
  #creates a new group
  result = api_instance.create_group(group)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling GroupApi->create_group: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **group** | [**GroupPost**](GroupPost.md)| the data to save | 

### Return type

[**ApiResponsePost**](ApiResponsePost.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_group**
> ApiResponseDelete delete_group(id)

delete the Group

delete one Group

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::GroupApi.new

id = "id_example" # String | the id of the Group


begin
  #delete the Group
  result = api_instance.delete_group(id)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling GroupApi->delete_group: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| the id of the Group | 

### Return type

[**ApiResponseDelete**](ApiResponseDelete.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_groups**
> GroupResponse get_groups(lid, opts)

get all Group of selected list

get Groups

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::GroupApi.new

lid = "lid_example" # String | the id of the list

opts = { 
  _filter: "_filter_example", # String | a FIQL-Filter
  _limit: 50, # Integer | a limit for list-responses
  _offset: 0, # Integer | an offset for list-responses
  _expand: true, # BOOLEAN | true if attributes should be returned or not
  _fields: ["_fields_example"] # Array<String> | list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed
}

begin
  #get all Group of selected list
  result = api_instance.get_groups(lid, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling GroupApi->get_groups: #{e}"
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

[**GroupResponse**](GroupResponse.md)

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

api_instance = SwaggerClient::GroupApi.new

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
  puts "Exception when calling GroupApi->get_recipients_by_group: #{e}"
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

api_instance = SwaggerClient::GroupApi.new

lid = "lid_example" # String | the id of the list

gid = "gid_example" # String | the id of the group

id = "id_example" # String | the id of the recipient


begin
  #remove single recipient from group
  result = api_instance.remove_recipient_from_group(lid, gid, id)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling GroupApi->remove_recipient_from_group: #{e}"
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

api_instance = SwaggerClient::GroupApi.new

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
  puts "Exception when calling GroupApi->remove_recipients_from_group: #{e}"
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



# **update_group**
> PatchResponse update_group(id, group)

update the Group

update one Group

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::GroupApi.new

id = "id_example" # String | the id of the Group

group = SwaggerClient::GroupPatch.new # GroupPatch | the data to update


begin
  #update the Group
  result = api_instance.update_group(id, group)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling GroupApi->update_group: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| the id of the Group | 
 **group** | [**GroupPatch**](GroupPatch.md)| the data to update | 

### Return type

[**PatchResponse**](PatchResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



