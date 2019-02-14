# SwaggerClient::CompanyApi

All URIs are relative to *https://api.newsletter2go.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_company**](CompanyApi.md#get_company) | **GET** /companies | get the details of a company
[**update_company**](CompanyApi.md#update_company) | **PATCH** /companies/{id} | update the Company


# **get_company**
> CompanyResponse get_company

get the details of a company

get the details of a company

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::CompanyApi.new

begin
  #get the details of a company
  result = api_instance.get_company
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling CompanyApi->get_company: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**CompanyResponse**](CompanyResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **update_company**
> PatchResponse update_company(id, company)

update the Company

update the Company

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::CompanyApi.new

id = "id_example" # String | the id of the Company

company = SwaggerClient::CompanyPatch.new # CompanyPatch | the data to update


begin
  #update the Company
  result = api_instance.update_company(id, company)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling CompanyApi->update_company: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| the id of the Company | 
 **company** | [**CompanyPatch**](CompanyPatch.md)| the data to update | 

### Return type

[**PatchResponse**](PatchResponse.md)

### Authorization

[OAuth](../README.md#OAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



