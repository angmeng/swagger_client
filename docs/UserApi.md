# SwaggerClient::UserApi

All URIs are relative to *https://api.newsletter2go.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_users**](UserApi.md#get_users) | **GET** /users | get all users of the company where the current user has access to
[**update_user**](UserApi.md#update_user) | **PATCH** /users/{id} | update the user


# **get_users**
> UserResponse get_users(opts)

get all users of the company where the current user has access to

get Users

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::UserApi.new

opts = { 
  _filter: "_filter_example", # String | a FIQL-Filter
  _limit: 50, # Integer | a limit for list-responses
  _offset: 0, # Integer | an offset for list-responses
  _expand: true, # BOOLEAN | true if attributes should be returned or not
  _fields: ["_fields_example"] # Array<String> | list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed
}

begin
  #get all users of the company where the current user has access to
  result = api_instance.get_users(opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling UserApi->get_users: #{e}"
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

[**UserResponse**](UserResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **update_user**
> PatchResponse update_user(id, user)

update the user

update one user

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::UserApi.new

id = "id_example" # String | the id of the user

user = SwaggerClient::UserPatch.new # UserPatch | the data to update


begin
  #update the user
  result = api_instance.update_user(id, user)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling UserApi->update_user: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| the id of the user | 
 **user** | [**UserPatch**](UserPatch.md)| the data to update | 

### Return type

[**PatchResponse**](PatchResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



