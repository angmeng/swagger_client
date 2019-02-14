# SwaggerClient::AuthorizationApi

All URIs are relative to *https://api.newsletter2go.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_token**](AuthorizationApi.md#get_token) | **POST** /oauth/v2/token | Endpoint for retrieving a token


# **get_token**
> Token get_token(grant_type, opts)

Endpoint for retrieving a token

The Newsletter2Go API uses Basic Authorization for authentication. <br/>First, you will need to find your API credentials in your Newsletter2Go account by navigating to Account > API. You need the auth key, your user name and your password to use our API. <br/>We recommend that you create a dedicated user before you get started. This way, you can better manage permissions without account your account and do not have to worry about password changes. <br/>In order to make API calls you need to pass an access token in each request.<br/>To acquire this access token, first make a POST call to our oauth end point: {{/oauth/v2/token}}<br/>Make sure to pass your crendentials and our grant_type in the body (either as formData or as JSON. In the latter case, submit Content-Type: application/json in the header)<br/>(We will use JavaScript examples here - see our example implementations for other programming languages)<br/><code>var params = {<br/>&nbsp;&nbsp;\"username\": \"your@email.com\",<br/>&nbsp;&nbsp;\"grant_type\": \"https://nl2go.com/jwt\",<br/>&nbsp;&nbsp;\"password\": \"your_password\"<br/>}</code><br/>and add an Authorization header with your auth key:<br/><code>xhr.setRequestHeader(\"Authorization\", \"Basic \" + btoa(\"xhr5n6xf_Rtguwv_jzr1d3_LTshikn4_0dtesdahNvp1:Kqf2Hs#Wwazl\");</code><br/>send the request:<br/><code>xhr.send(JSON.stringify(params));</code><br/>and the API will return the access_token (valid for 120 minutes) and a refresh_token that you can use to create a new access_token after the first one has expired.<br/><code>{<br/>&nbsp;&nbsp;\"access_token\": \"string\",<br/>&nbsp;&nbsp;\"expires_in\": 0,<br/>&nbsp;&nbsp;\"token_type\": \"string\",<br/>&nbsp;&nbsp;\"refresh_token\": \"string\"<br/>}</code><br/>Make sure to save the access_token - you will need it for every following call that you make.

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure HTTP basic authorization: Basic
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = SwaggerClient::AuthorizationApi.new

grant_type = "https://nl2go.com/jwt" # String | grant_type

opts = { 
  username: "username_example", # String | username. Required for grant_type https://nl2go.com/jwt
  password: "password_example", # String | password. Required for grant_type https://nl2go.com/jwt
  refresh_token: "refresh_token_example" # String | refresh_token. Required for grant_type https://nl2go.com/jwt_refresh
}

begin
  #Endpoint for retrieving a token
  result = api_instance.get_token(grant_type, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling AuthorizationApi->get_token: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **grant_type** | **String**| grant_type | [default to https://nl2go.com/jwt]
 **username** | **String**| username. Required for grant_type https://nl2go.com/jwt | [optional] 
 **password** | **String**| password. Required for grant_type https://nl2go.com/jwt | [optional] 
 **refresh_token** | **String**| refresh_token. Required for grant_type https://nl2go.com/jwt_refresh | [optional] 

### Return type

[**Token**](Token.md)

### Authorization

[Basic](../README.md#Basic)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json



