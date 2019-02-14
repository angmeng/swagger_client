# SwaggerClient::NewsletterApi

All URIs are relative to *https://api.newsletter2go.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_newsletter**](NewsletterApi.md#create_newsletter) | **POST** /lists/{lid}/newsletters | creates a new newsletter
[**get_newsletter**](NewsletterApi.md#get_newsletter) | **GET** /newsletters/{id} | get one newsletter
[**get_newsletters**](NewsletterApi.md#get_newsletters) | **GET** /lists/{lid}/newsletters | get all newsletters of the given list
[**get_reports**](NewsletterApi.md#get_reports) | **GET** /lists/{lid}/newsletters/{nid}/aggregations | get reports for the newsletter aggregated by days
[**send_newsletter**](NewsletterApi.md#send_newsletter) | **POST** /newsletters/{id}/send | Sends the newsletter to a list or group
[**update_newsletter**](NewsletterApi.md#update_newsletter) | **PATCH** /newsletters/{id} | update the Newsletter


# **create_newsletter**
> ApiResponsePost create_newsletter(lid, newsletter)

creates a new newsletter

creates a new Newsletter

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::NewsletterApi.new

lid = "lid_example" # String | the id of the list

newsletter = SwaggerClient::NewsletterPost.new # NewsletterPost | the data to save


begin
  #creates a new newsletter
  result = api_instance.create_newsletter(lid, newsletter)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling NewsletterApi->create_newsletter: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lid** | **String**| the id of the list | 
 **newsletter** | [**NewsletterPost**](NewsletterPost.md)| the data to save | 

### Return type

[**ApiResponsePost**](ApiResponsePost.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_newsletter**
> NewsletterResponse get_newsletter(id, opts)

get one newsletter

get Newsletter

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::NewsletterApi.new

id = "id_example" # String | the id of the newsletter

opts = { 
  _filter: "_filter_example", # String | a FIQL-Filter
  _fields: ["_fields_example"] # Array<String> | list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed
}

begin
  #get one newsletter
  result = api_instance.get_newsletter(id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling NewsletterApi->get_newsletter: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| the id of the newsletter | 
 **_filter** | **String**| a FIQL-Filter | [optional] 
 **_fields** | [**Array&lt;String&gt;**](String.md)| list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed | [optional] 

### Return type

[**NewsletterResponse**](NewsletterResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_newsletters**
> NewsletterResponse get_newsletters(lid, opts)

get all newsletters of the given list

get Newsletters

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::NewsletterApi.new

lid = "lid_example" # String | the id of the list

opts = { 
  _filter: "_filter_example", # String | a FIQL-Filter
  _limit: 50, # Integer | a limit for list-responses
  _offset: 0, # Integer | an offset for list-responses
  _expand: true, # BOOLEAN | true if attributes should be returned or not
  _fields: ["_fields_example"] # Array<String> | list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed
}

begin
  #get all newsletters of the given list
  result = api_instance.get_newsletters(lid, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling NewsletterApi->get_newsletters: #{e}"
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

[**NewsletterResponse**](NewsletterResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_reports**
> ReportResponse get_reports(opts)

get reports for the newsletter aggregated by days

get reports for the newsletter aggregated by days

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::NewsletterApi.new

opts = { 
  _filter: "_filter_example", # String | a FIQL-Filter
  _limit: 50, # Integer | a limit for list-responses
  _offset: 0, # Integer | an offset for list-responses
  _expand: true, # BOOLEAN | true if attributes should be returned or not
  _fields: ["_fields_example"] # Array<String> | list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed
}

begin
  #get reports for the newsletter aggregated by days
  result = api_instance.get_reports(opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling NewsletterApi->get_reports: #{e}"
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

[**ReportResponse**](ReportResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **send_newsletter**
> send_newsletter(id, newsletter)

Sends the newsletter to a list or group



### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::NewsletterApi.new

id = "id_example" # String | the id of the list

newsletter = SwaggerClient::NewsletterSend.new # NewsletterSend | the data to save


begin
  #Sends the newsletter to a list or group
  api_instance.send_newsletter(id, newsletter)
rescue SwaggerClient::ApiError => e
  puts "Exception when calling NewsletterApi->send_newsletter: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| the id of the list | 
 **newsletter** | [**NewsletterSend**](NewsletterSend.md)| the data to save | 

### Return type

nil (empty response body)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **update_newsletter**
> PatchResponse update_newsletter(id, newsletter)

update the Newsletter

update one Newsletter

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::NewsletterApi.new

id = "id_example" # String | the id of the newsletter

newsletter = SwaggerClient::NewsletterPost.new # NewsletterPost | the data to update


begin
  #update the Newsletter
  result = api_instance.update_newsletter(id, newsletter)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling NewsletterApi->update_newsletter: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| the id of the newsletter | 
 **newsletter** | [**NewsletterPost**](NewsletterPost.md)| the data to update | 

### Return type

[**PatchResponse**](PatchResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



