# swagger_client

SwaggerClient - the Ruby gem for the Newsletter2Go-API (https://api.newsletter2go.com)

<h5>JSON first</h5><br/>Our REST API exchanges data in the JSON data format. Every parameter you pass (with a few exceptions e.g. when you upload files) should therefore be formatted in JSON and our API will always return results in JSON as well.<br/><br/><h5>Very RESTful</h5><br/>Our API follows a very RESTful approach.<br/>Most importantly, we implemented the following four request methods for CRUD operations:<br/><br/>POST - Create a new record<br/>GET - Retrieve / read records without changing anything<br/>PATCH - Update an existing record<br/>DELETE - Delete one or more records<br/><br/><h5>HTTP Status codes</h5><br/>We also follow the most common HTTP status codes when outputting the API response:<br/><br/><b>2xx - Successful calls</b><br/>200 - Success<br/>201 - Created<br/><br/><b>4xx - Error codes</b><br/>400 - API error - inspect the body for detailed information about what went wrong. The most common error is \"code\":1062, which means, that a unique constraint was hit. For example if the name of the group is already in use.<br/>401 - Not authenticated - invalid access_token. Check if the access_token has expired or is incorrect.<br/>403 - Access denied<br/>404 - Call not available or no records found<br/><br/><b>5xx - API error - please contact support</b><br/><br/><h5>Response format</h5><br/>The API always returns data in the following format<br/><br/><code>{<br/>&nbsp;&nbsp;\"info\": {<br/>&nbsp;&nbsp;&nbsp;&nbsp;\"count\": 0<br/>&nbsp;&nbsp;},<br/>&nbsp;&nbsp;\"value\": [<br/>&nbsp;&nbsp;&nbsp;{<br/>&nbsp;&nbsp;&nbsp;&nbsp;\"key\": \"value\"<br/>&nbsp;&nbsp;&nbsp;}<br/>&nbsp;&nbsp;]<br/>}</code><br/><br/><h5>Recurring GET parameters</h5><br/><ul><li>_filter - a complex filter for filtering the result set based on <a target=\"blank\" href=\"https://tools.ietf.org/html/draft-nottingham-atompub-fiql-00\">FIQL</a>.</li><li>_limit - the maximum number records returned.</li><li>_offset - pagination for the result-set</li><li>_expand - submit true to get all default fields of the resource</li><li>_fields - submit a comma-separated list of case-sensetive field-names to get the values of these fields in the response. You can use this the get values of custom attribute of recipients for example.</li></ul><br/><br/><h5>Filter language</h5><br/>The filter language for filtering results is based on <a target=\"blank\" href=\"https://tools.ietf.org/html/draft-nottingham-atompub-fiql-00\">FIQL</a>.<br/>With the only restriction, that plain values must be surrounded by \". For example first_name==\"Max\"<br/>The following operators are supported<ul><li>Equals - <b>==</b></li><li>Not equals - <b>=ne=</b></li><li>Greater than - <b>=gt=</b></li><li>Greater than equals - <b>=ge=</b></li><li>Lower than - <b>=lt=</b></li><li>Lower than equals - <b>=le=</b></li><li>Like - <b>=like=</b> (in combination with % you are able to search for <i>starts with</i>, <i>ends with</i>, <i>contains</i>. For example first_name=like=\"%Max%\")</li><li>Not like - <b>=nlike=</b></li><li>Logical and - <b>;</b></li><li>Logical or - <b>,</b></li></ul><br/><br/><h5>How to make Calls?</h5><br/>After you authenticated and received a valid access_token, you have to pass it in every consecutive call. Use the Authorization header for that purpose as follows:<br/><code>xhr.setRequestHeader(\"Authorization\", \"Bearer \" + your_access_token);</code><br/><br/>Every call takes additional parameters that can be used to modify the request. These parameters should be passed as JSON<br/><code>var params = {<br/>&nbsp;&nbsp;\"key\"= \"value\"<br/>}<br/>xhr.send(JSON.stringify(params));</code><br/><br/><h5>Sending transactional emails</h5><br/>It is very important to understand the following concept in order for you to take full advantage of our powerful personalization features and our detailed reports when sending transactional emails.<br/><br/>First, you will have to create a new mailing. We recommend that you create that mailing through our UI in order to take full advantage of our powerful newsletter builder. This way, we will automatically create cross-client optimized and responsive HTML. Yet another advantage lies in the possibility for other users (e.g. the marketing team) to change the layout or the content of the mailing without having to contact the developer (you).<br/><br/>Of course, it is also possible to create a mailing through the API. When doing so, you can also take advantage of our cross-client optimized responsive HTML by passing us JSON or YAML according to the Newsletter2Go Markup Language.<br/>No matter how you create the mailing, try to create *one* reusable template. You can customize individual emails by inserting placeholders for personalized fields such as name, products or other information that will be filled through an API call when sending.<br/><br/>By only creating one template, you can take advantage of our full reporting since all emails will be treated part of a \"campaign\". When you change that template, we will create a new version of the mailing in the background and you will be able to see the difference in performance in the reports. This is particularily useful when you are trying to test and optimize different versions of transactional emails such as a sign up email.<br/><br/>After creating a mailing, you will have access to its ID. Use that ID to actually send the email in the next step.<br/><br/>When sending an email, you have to pass the newsletter ID and information about the recipient. Either pass the recipient ID or pass all the recipient's data (including the e-mail-address) as JSON.<br/><br/>If you only pass the recipient ID, we will use his or her data from your list to personalize the mailing. If you pass full recipient data as JSON, we will try to merge the data with existing data from your list.<br/><br/>You can also pass additional data such as product data which is not saved in your list. Just make sure that the placeholders in the source of the mailing correspond to the parameters that you are passing.<br/>This way you can also create for-loops which can be useful if you pass different amounts of data for each recipient (e.g. a purchase confirmation where you want to list all the products that were just bought).

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 1.0.0
- Package version: 1.0.0
- Build date: 2016-06-08T07:00:17.910Z
- Build package: class io.swagger.codegen.languages.RubyClientCodegen

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build swagger_client.gemspec
```

Then either install the gem locally:

```shell
gem install ./swagger_client-1.0.0.gem
```
(for development, run `gem install --dev ./swagger_client-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'swagger_client', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/YOUR_GIT_USERNAME/YOUR_GIT_REPO, then add the following in the Gemfile:

    gem 'swagger_client', :git => 'https://github.com/YOUR_GIT_USERNAME/YOUR_GIT_REPO.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
require 'swagger_client'

# Setup authorization
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

## Documentation for API Endpoints

All URIs are relative to *https://api.newsletter2go.com*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*SwaggerClient::AttributeApi* | [**create_attribute**](docs/AttributeApi.md#create_attribute) | **POST** /attributes | creates a new attribute
*SwaggerClient::AttributeApi* | [**delete_attribute**](docs/AttributeApi.md#delete_attribute) | **DELETE** /lists/{lid}/attributes/{id} | delete the attribute
*SwaggerClient::AttributeApi* | [**get_attributes**](docs/AttributeApi.md#get_attributes) | **GET** /lists/{lid}/attributes | get all Attributes of selected list
*SwaggerClient::AttributeApi* | [**update_attribute**](docs/AttributeApi.md#update_attribute) | **PATCH** /attributes/{id} | update the attribute
*SwaggerClient::AuthorizationApi* | [**get_token**](docs/AuthorizationApi.md#get_token) | **POST** /oauth/v2/token | Endpoint for retrieving a token
*SwaggerClient::CompanyApi* | [**get_company**](docs/CompanyApi.md#get_company) | **GET** /companies | get the details of a company
*SwaggerClient::CompanyApi* | [**update_company**](docs/CompanyApi.md#update_company) | **PATCH** /companies/{id} | update the Company
*SwaggerClient::GroupApi* | [**add_recipient_to_group**](docs/GroupApi.md#add_recipient_to_group) | **POST** /lists/{lid}/groups/{gid}/recipients/{id} | add single recipient to group
*SwaggerClient::GroupApi* | [**add_recipients_to_group**](docs/GroupApi.md#add_recipients_to_group) | **POST** /lists/{lid}/groups/{gid}/recipients | add all Recipients to the given group
*SwaggerClient::GroupApi* | [**create_group**](docs/GroupApi.md#create_group) | **POST** /groups | creates a new group
*SwaggerClient::GroupApi* | [**delete_group**](docs/GroupApi.md#delete_group) | **DELETE** /groups/{id} | delete the Group
*SwaggerClient::GroupApi* | [**get_groups**](docs/GroupApi.md#get_groups) | **GET** /lists/{lid}/groups | get all Group of selected list
*SwaggerClient::GroupApi* | [**get_recipients_by_group**](docs/GroupApi.md#get_recipients_by_group) | **GET** /lists/{lid}/groups/{gid}/recipients | get all Recipients of selected group
*SwaggerClient::GroupApi* | [**remove_recipient_from_group**](docs/GroupApi.md#remove_recipient_from_group) | **DELETE** /lists/{lid}/groups/{gid}/recipients/{id} | remove single recipient from group
*SwaggerClient::GroupApi* | [**remove_recipients_from_group**](docs/GroupApi.md#remove_recipients_from_group) | **DELETE** /lists/{lid}/groups/{gid}/recipients | remove all Recipients from given group
*SwaggerClient::GroupApi* | [**update_group**](docs/GroupApi.md#update_group) | **PATCH** /groups/{id} | update the Group
*SwaggerClient::ListApi* | [**create_list**](docs/ListApi.md#create_list) | **POST** /lists | creates a new list
*SwaggerClient::ListApi* | [**delete_list**](docs/ListApi.md#delete_list) | **DELETE** /lists/{id} | delete the List
*SwaggerClient::ListApi* | [**get_lists**](docs/ListApi.md#get_lists) | **GET** /lists | get all lists
*SwaggerClient::ListApi* | [**get_recipients**](docs/ListApi.md#get_recipients) | **GET** /lists/{lid}/recipients | get all Recipients of selected list
*SwaggerClient::ListApi* | [**remove_recipients_from_list**](docs/ListApi.md#remove_recipients_from_list) | **DELETE** /lists/{lid}/recipients | remove all Recipients from selected list
*SwaggerClient::ListApi* | [**update_list**](docs/ListApi.md#update_list) | **PATCH** /lists/{id} | update the List
*SwaggerClient::ListApi* | [**update_recipients**](docs/ListApi.md#update_recipients) | **PATCH** /lists/{lid}/recipients | update all Recipients in selected list
*SwaggerClient::NewsletterApi* | [**create_newsletter**](docs/NewsletterApi.md#create_newsletter) | **POST** /lists/{lid}/newsletters | creates a new newsletter
*SwaggerClient::NewsletterApi* | [**get_newsletter**](docs/NewsletterApi.md#get_newsletter) | **GET** /newsletters/{id} | get one newsletter
*SwaggerClient::NewsletterApi* | [**get_newsletters**](docs/NewsletterApi.md#get_newsletters) | **GET** /lists/{lid}/newsletters | get all newsletters of the given list
*SwaggerClient::NewsletterApi* | [**get_reports**](docs/NewsletterApi.md#get_reports) | **GET** /lists/{lid}/newsletters/{nid}/aggregations | get reports for the newsletter aggregated by days
*SwaggerClient::NewsletterApi* | [**send_newsletter**](docs/NewsletterApi.md#send_newsletter) | **POST** /newsletters/{id}/send | Sends the newsletter to a list or group
*SwaggerClient::NewsletterApi* | [**update_newsletter**](docs/NewsletterApi.md#update_newsletter) | **PATCH** /newsletters/{id} | update the Newsletter
*SwaggerClient::RecipientApi* | [**add_recipient_to_group**](docs/RecipientApi.md#add_recipient_to_group) | **POST** /lists/{lid}/groups/{gid}/recipients/{id} | add single recipient to group
*SwaggerClient::RecipientApi* | [**add_recipients_to_group**](docs/RecipientApi.md#add_recipients_to_group) | **POST** /lists/{lid}/groups/{gid}/recipients | add all Recipients to the given group
*SwaggerClient::RecipientApi* | [**create_recipient**](docs/RecipientApi.md#create_recipient) | **POST** /recipients | create new recipient(s) or updates existing ones
*SwaggerClient::RecipientApi* | [**delete_recipient**](docs/RecipientApi.md#delete_recipient) | **DELETE** /lists/{lid}/recipients/{id} | delete the recipient
*SwaggerClient::RecipientApi* | [**get_recipients**](docs/RecipientApi.md#get_recipients) | **GET** /lists/{lid}/recipients | get all Recipients of selected list
*SwaggerClient::RecipientApi* | [**get_recipients_by_group**](docs/RecipientApi.md#get_recipients_by_group) | **GET** /lists/{lid}/groups/{gid}/recipients | get all Recipients of selected group
*SwaggerClient::RecipientApi* | [**import_recipients_init**](docs/RecipientApi.md#import_recipients_init) | **POST** /lists/{lid}/recipients/import/init | Initialize the import of recipients by file
*SwaggerClient::RecipientApi* | [**import_recipients_save**](docs/RecipientApi.md#import_recipients_save) | **POST** /lists/{lid}/recipients/import/save | Start the import recipients by file
*SwaggerClient::RecipientApi* | [**import_recipients_statistics**](docs/RecipientApi.md#import_recipients_statistics) | **GET** /import/{id}/info | Get statistics about the import by file
*SwaggerClient::RecipientApi* | [**remove_recipient_from_group**](docs/RecipientApi.md#remove_recipient_from_group) | **DELETE** /lists/{lid}/groups/{gid}/recipients/{id} | remove single recipient from group
*SwaggerClient::RecipientApi* | [**remove_recipients_from_group**](docs/RecipientApi.md#remove_recipients_from_group) | **DELETE** /lists/{lid}/groups/{gid}/recipients | remove all Recipients from given group
*SwaggerClient::RecipientApi* | [**remove_recipients_from_list**](docs/RecipientApi.md#remove_recipients_from_list) | **DELETE** /lists/{lid}/recipients | remove all Recipients from selected list
*SwaggerClient::RecipientApi* | [**subscribe_recipient**](docs/RecipientApi.md#subscribe_recipient) | **POST** /forms/submit/{code} | Creates a new recipient and sends a DOI-Mail
*SwaggerClient::RecipientApi* | [**update_recipient**](docs/RecipientApi.md#update_recipient) | **PATCH** /lists/{lid}/recipients/{id} | update the recipient.
*SwaggerClient::RecipientApi* | [**update_recipients**](docs/RecipientApi.md#update_recipients) | **PATCH** /lists/{lid}/recipients | update all Recipients in selected list
*SwaggerClient::ReportApi* | [**get_reports**](docs/ReportApi.md#get_reports) | **GET** /lists/{lid}/newsletters/{nid}/aggregations | get reports for the newsletter aggregated by days
*SwaggerClient::UserApi* | [**get_users**](docs/UserApi.md#get_users) | **GET** /users | get all users of the company where the current user has access to
*SwaggerClient::UserApi* | [**update_user**](docs/UserApi.md#update_user) | **PATCH** /users/{id} | update the user


## Documentation for Models

 - [SwaggerClient::ApiResponseDelete](docs/ApiResponseDelete.md)
 - [SwaggerClient::ApiResponsePost](docs/ApiResponsePost.md)
 - [SwaggerClient::AttributeGet](docs/AttributeGet.md)
 - [SwaggerClient::AttributePatch](docs/AttributePatch.md)
 - [SwaggerClient::AttributePost](docs/AttributePost.md)
 - [SwaggerClient::AttributeResponse](docs/AttributeResponse.md)
 - [SwaggerClient::CompanyGet](docs/CompanyGet.md)
 - [SwaggerClient::CompanyPatch](docs/CompanyPatch.md)
 - [SwaggerClient::CompanyResponse](docs/CompanyResponse.md)
 - [SwaggerClient::Data](docs/Data.md)
 - [SwaggerClient::Error](docs/Error.md)
 - [SwaggerClient::GroupGet](docs/GroupGet.md)
 - [SwaggerClient::GroupPatch](docs/GroupPatch.md)
 - [SwaggerClient::GroupPost](docs/GroupPost.md)
 - [SwaggerClient::GroupResponse](docs/GroupResponse.md)
 - [SwaggerClient::ImportGet](docs/ImportGet.md)
 - [SwaggerClient::ImportResponse](docs/ImportResponse.md)
 - [SwaggerClient::Info](docs/Info.md)
 - [SwaggerClient::InlineResponse200](docs/InlineResponse200.md)
 - [SwaggerClient::ListGet](docs/ListGet.md)
 - [SwaggerClient::ListPost](docs/ListPost.md)
 - [SwaggerClient::ListResponse](docs/ListResponse.md)
 - [SwaggerClient::ModelWithId](docs/ModelWithId.md)
 - [SwaggerClient::NewsletterGet](docs/NewsletterGet.md)
 - [SwaggerClient::NewsletterPost](docs/NewsletterPost.md)
 - [SwaggerClient::NewsletterResponse](docs/NewsletterResponse.md)
 - [SwaggerClient::NewsletterSend](docs/NewsletterSend.md)
 - [SwaggerClient::PatchResponse](docs/PatchResponse.md)
 - [SwaggerClient::RecipientGet](docs/RecipientGet.md)
 - [SwaggerClient::RecipientPatch](docs/RecipientPatch.md)
 - [SwaggerClient::RecipientPost](docs/RecipientPost.md)
 - [SwaggerClient::RecipientResponse](docs/RecipientResponse.md)
 - [SwaggerClient::RecipientSimple](docs/RecipientSimple.md)
 - [SwaggerClient::RecipientSubscribe](docs/RecipientSubscribe.md)
 - [SwaggerClient::RecipientSubscribeRecipient](docs/RecipientSubscribeRecipient.md)
 - [SwaggerClient::RecipientSubscribeResponse](docs/RecipientSubscribeResponse.md)
 - [SwaggerClient::RecipientSubscribeResponseValue](docs/RecipientSubscribeResponseValue.md)
 - [SwaggerClient::RecipientSubscribeResponseValueResult](docs/RecipientSubscribeResponseValueResult.md)
 - [SwaggerClient::RecipientSubscribeResponseValueResultError](docs/RecipientSubscribeResponseValueResultError.md)
 - [SwaggerClient::RecipientSubscribeResponseValueResultErrorRecipients](docs/RecipientSubscribeResponseValueResultErrorRecipients.md)
 - [SwaggerClient::RecipientSubscribeResponseValueResultSuccess](docs/RecipientSubscribeResponseValueResultSuccess.md)
 - [SwaggerClient::Report](docs/Report.md)
 - [SwaggerClient::ReportResponse](docs/ReportResponse.md)
 - [SwaggerClient::Token](docs/Token.md)
 - [SwaggerClient::UserGet](docs/UserGet.md)
 - [SwaggerClient::UserPatch](docs/UserPatch.md)
 - [SwaggerClient::UserResponse](docs/UserResponse.md)


## Documentation for Authorization


### OAuth

- **Type**: OAuth
- **Flow**: implicit
- **Authorization URL**: /oauth/v2/token
- **Scopes**: N/A

### Basic

- **Type**: HTTP basic authentication

