# SwaggerClient::AttributeApi

All URIs are relative to *https://api.newsletter2go.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_attribute**](AttributeApi.md#create_attribute) | **POST** /attributes | creates a new attribute
[**delete_attribute**](AttributeApi.md#delete_attribute) | **DELETE** /lists/{lid}/attributes/{id} | delete the attribute
[**get_attributes**](AttributeApi.md#get_attributes) | **GET** /lists/{lid}/attributes | get all Attributes of selected list
[**update_attribute**](AttributeApi.md#update_attribute) | **PATCH** /attributes/{id} | update the attribute


# **create_attribute**
> ApiResponsePost create_attribute(attribute)

creates a new attribute

creates a new attribute.

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::AttributeApi.new

attribute = SwaggerClient::AttributePost.new # AttributePost | the data to save


begin
  #creates a new attribute
  result = api_instance.create_attribute(attribute)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling AttributeApi->create_attribute: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **attribute** | [**AttributePost**](AttributePost.md)| the data to save | 

### Return type

[**ApiResponsePost**](ApiResponsePost.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **delete_attribute**
> ApiResponseDelete delete_attribute(lid, id)

delete the attribute

delete one attribute

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::AttributeApi.new

lid = "lid_example" # String | the id of the list

id = "id_example" # String | the id of the attribute


begin
  #delete the attribute
  result = api_instance.delete_attribute(lid, id)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling AttributeApi->delete_attribute: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lid** | **String**| the id of the list | 
 **id** | **String**| the id of the attribute | 

### Return type

[**ApiResponseDelete**](ApiResponseDelete.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_attributes**
> AttributeResponse get_attributes(lid, opts)

get all Attributes of selected list

get Attributes

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::AttributeApi.new

lid = "lid_example" # String | the id of the list

opts = { 
  _filter: "_filter_example", # String | a FIQL-Filter
  _limit: 50, # Integer | a limit for list-responses
  _offset: 0, # Integer | an offset for list-responses
  _expand: true, # BOOLEAN | true if attributes should be returned or not
  _fields: ["_fields_example"] # Array<String> | list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed
}

begin
  #get all Attributes of selected list
  result = api_instance.get_attributes(lid, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling AttributeApi->get_attributes: #{e}"
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

[**AttributeResponse**](AttributeResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **update_attribute**
> PatchResponse update_attribute(id, attribute)

update the attribute

update one attribute

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::AttributeApi.new

id = "id_example" # String | the id of the attribute

attribute = SwaggerClient::AttributePatch.new # AttributePatch | the data to update


begin
  #update the attribute
  result = api_instance.update_attribute(id, attribute)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling AttributeApi->update_attribute: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| the id of the attribute | 
 **attribute** | [**AttributePatch**](AttributePatch.md)| the data to update | 

### Return type

[**PatchResponse**](PatchResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



