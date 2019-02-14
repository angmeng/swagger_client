# SwaggerClient::ListApi

All URIs are relative to *https://api.newsletter2go.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_list**](ListApi.md#create_list) | **POST** /lists | creates a new list
[**delete_list**](ListApi.md#delete_list) | **DELETE** /lists/{id} | delete the List
[**get_lists**](ListApi.md#get_lists) | **GET** /lists | get all lists
[**get_recipients**](ListApi.md#get_recipients) | **GET** /lists/{lid}/recipients | get all Recipients of selected list
[**remove_recipients_from_list**](ListApi.md#remove_recipients_from_list) | **DELETE** /lists/{lid}/recipients | remove all Recipients from selected list
[**update_list**](ListApi.md#update_list) | **PATCH** /lists/{id} | update the List
[**update_recipients**](ListApi.md#update_recipients) | **PATCH** /lists/{lid}/recipients | update all Recipients in selected list


# **create_list**
> ApiResponsePost create_list(list)

creates a new list

creates a new List

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::ListApi.new

list = SwaggerClient::ListPost.new # ListPost | the data to save


begin
  #creates a new list
  result = api_instance.create_list(list)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ListApi->create_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **list** | [**ListPost**](ListPost.md)| the data to save | 

### Return type

[**ApiResponsePost**](ApiResponsePost.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_list**
> ApiResponseDelete delete_list(id)

delete the List

delete one List

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::ListApi.new

id = "id_example" # String | the id of the list


begin
  #delete the List
  result = api_instance.delete_list(id)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ListApi->delete_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| the id of the list | 

### Return type

[**ApiResponseDelete**](ApiResponseDelete.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_lists**
> ListResponse get_lists(opts)

get all lists

get Lists

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::ListApi.new

opts = { 
  _filter: "_filter_example", # String | a FIQL-Filter
  _limit: 50, # Integer | a limit for list-responses
  _offset: 0, # Integer | an offset for list-responses
  _expand: true, # BOOLEAN | true if attributes should be returned or not
  _fields: ["_fields_example"] # Array<String> | list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed
}

begin
  #get all lists
  result = api_instance.get_lists(opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ListApi->get_lists: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **_filter** | **String**| a FIQL-Filter | [optional] 
 **_limit** | **Integer**| a limit for list-responses | [optional] [default to 50]
 **_offset** | **Integer**| an offset for list-responses | [optional] [default to 0]
 **_expand** | **BOOLEAN**| true if attributes should be returned or not | [optional] 
 **_fields** | [**Array&lt;String&gt;**](String.md)| list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed | [optional] 

### Return type

[**ListResponse**](ListResponse.md)

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

api_instance = SwaggerClient::ListApi.new

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
  puts "Exception when calling ListApi->get_recipients: #{e}"
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

api_instance = SwaggerClient::ListApi.new

lid = "lid_example" # String | the id of the list

opts = { 
  _filter: "_filter_example", # String | a FIQL-Filter
}

begin
  #remove all Recipients from selected list
  result = api_instance.remove_recipients_from_list(lid, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ListApi->remove_recipients_from_list: #{e}"
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



# **update_list**
> PatchResponse update_list(id, list)

update the List

update one List

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::ListApi.new

id = "id_example" # String | the id of the list

list = SwaggerClient::ListPost.new # ListPost | the data to update


begin
  #update the List
  result = api_instance.update_list(id, list)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ListApi->update_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| the id of the list | 
 **list** | [**ListPost**](ListPost.md)| the data to update | 

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

api_instance = SwaggerClient::ListApi.new

lid = "lid_example" # String | the id of the list

opts = { 
  _filter: "_filter_example", # String | a FIQL-Filter
}

begin
  #update all Recipients in selected list
  result = api_instance.update_recipients(lid, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ListApi->update_recipients: #{e}"
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



