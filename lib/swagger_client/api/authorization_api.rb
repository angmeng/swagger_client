=begin
Newsletter2Go-API (https://api.newsletter2go.com)

<h5>JSON first</h5><br/>Our REST API exchanges data in the JSON data format. Every parameter you pass (with a few exceptions e.g. when you upload files) should therefore be formatted in JSON and our API will always return results in JSON as well.<br/><br/><h5>Very RESTful</h5><br/>Our API follows a very RESTful approach.<br/>Most importantly, we implemented the following four request methods for CRUD operations:<br/><br/>POST - Create a new record<br/>GET - Retrieve / read records without changing anything<br/>PATCH - Update an existing record<br/>DELETE - Delete one or more records<br/><br/><h5>HTTP Status codes</h5><br/>We also follow the most common HTTP status codes when outputting the API response:<br/><br/><b>2xx - Successful calls</b><br/>200 - Success<br/>201 - Created<br/><br/><b>4xx - Error codes</b><br/>400 - API error - inspect the body for detailed information about what went wrong. The most common error is \"code\":1062, which means, that a unique constraint was hit. For example if the name of the group is already in use.<br/>401 - Not authenticated - invalid access_token. Check if the access_token has expired or is incorrect.<br/>403 - Access denied<br/>404 - Call not available or no records found<br/><br/><b>5xx - API error - please contact support</b><br/><br/><h5>Response format</h5><br/>The API always returns data in the following format<br/><br/><code>{<br/>&nbsp;&nbsp;\"info\": {<br/>&nbsp;&nbsp;&nbsp;&nbsp;\"count\": 0<br/>&nbsp;&nbsp;},<br/>&nbsp;&nbsp;\"value\": [<br/>&nbsp;&nbsp;&nbsp;{<br/>&nbsp;&nbsp;&nbsp;&nbsp;\"key\": \"value\"<br/>&nbsp;&nbsp;&nbsp;}<br/>&nbsp;&nbsp;]<br/>}</code><br/><br/><h5>Recurring GET parameters</h5><br/><ul><li>_filter - a complex filter for filtering the result set based on <a target=\"blank\" href=\"https://tools.ietf.org/html/draft-nottingham-atompub-fiql-00\">FIQL</a>.</li><li>_limit - the maximum number records returned.</li><li>_offset - pagination for the result-set</li><li>_expand - submit true to get all default fields of the resource</li><li>_fields - submit a comma-separated list of case-sensetive field-names to get the values of these fields in the response. You can use this the get values of custom attribute of recipients for example.</li></ul><br/><br/><h5>Filter language</h5><br/>The filter language for filtering results is based on <a target=\"blank\" href=\"https://tools.ietf.org/html/draft-nottingham-atompub-fiql-00\">FIQL</a>.<br/>With the only restriction, that plain values must be surrounded by \". For example first_name==\"Max\"<br/>The following operators are supported<ul><li>Equals - <b>==</b></li><li>Not equals - <b>=ne=</b></li><li>Greater than - <b>=gt=</b></li><li>Greater than equals - <b>=ge=</b></li><li>Lower than - <b>=lt=</b></li><li>Lower than equals - <b>=le=</b></li><li>Like - <b>=like=</b> (in combination with % you are able to search for <i>starts with</i>, <i>ends with</i>, <i>contains</i>. For example first_name=like=\"%Max%\")</li><li>Not like - <b>=nlike=</b></li><li>Logical and - <b>;</b></li><li>Logical or - <b>,</b></li></ul><br/><br/><h5>How to make Calls?</h5><br/>After you authenticated and received a valid access_token, you have to pass it in every consecutive call. Use the Authorization header for that purpose as follows:<br/><code>xhr.setRequestHeader(\"Authorization\", \"Bearer \" + your_access_token);</code><br/><br/>Every call takes additional parameters that can be used to modify the request. These parameters should be passed as JSON<br/><code>var params = {<br/>&nbsp;&nbsp;\"key\"= \"value\"<br/>}<br/>xhr.send(JSON.stringify(params));</code><br/><br/><h5>Sending transactional emails</h5><br/>It is very important to understand the following concept in order for you to take full advantage of our powerful personalization features and our detailed reports when sending transactional emails.<br/><br/>First, you will have to create a new mailing. We recommend that you create that mailing through our UI in order to take full advantage of our powerful newsletter builder. This way, we will automatically create cross-client optimized and responsive HTML. Yet another advantage lies in the possibility for other users (e.g. the marketing team) to change the layout or the content of the mailing without having to contact the developer (you).<br/><br/>Of course, it is also possible to create a mailing through the API. When doing so, you can also take advantage of our cross-client optimized responsive HTML by passing us JSON or YAML according to the Newsletter2Go Markup Language.<br/>No matter how you create the mailing, try to create *one* reusable template. You can customize individual emails by inserting placeholders for personalized fields such as name, products or other information that will be filled through an API call when sending.<br/><br/>By only creating one template, you can take advantage of our full reporting since all emails will be treated part of a \"campaign\". When you change that template, we will create a new version of the mailing in the background and you will be able to see the difference in performance in the reports. This is particularily useful when you are trying to test and optimize different versions of transactional emails such as a sign up email.<br/><br/>After creating a mailing, you will have access to its ID. Use that ID to actually send the email in the next step.<br/><br/>When sending an email, you have to pass the newsletter ID and information about the recipient. Either pass the recipient ID or pass all the recipient's data (including the e-mail-address) as JSON.<br/><br/>If you only pass the recipient ID, we will use his or her data from your list to personalize the mailing. If you pass full recipient data as JSON, we will try to merge the data with existing data from your list.<br/><br/>You can also pass additional data such as product data which is not saved in your list. Just make sure that the placeholders in the source of the mailing correspond to the parameters that you are passing.<br/>This way you can also create for-loops which can be useful if you pass different amounts of data for each recipient (e.g. a purchase confirmation where you want to list all the products that were just bought).

OpenAPI spec version: 1.0.0
Contact: support@newsletter2go.com
Generated by: https://github.com/swagger-api/swagger-codegen.git

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end

require "uri"

module SwaggerClient
  class AuthorizationApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Endpoint for retrieving a token
    # The Newsletter2Go API uses Basic Authorization for authentication. <br/>First, you will need to find your API credentials in your Newsletter2Go account by navigating to Account > API. You need the auth key, your user name and your password to use our API. <br/>We recommend that you create a dedicated user before you get started. This way, you can better manage permissions without account your account and do not have to worry about password changes. <br/>In order to make API calls you need to pass an access token in each request.<br/>To acquire this access token, first make a POST call to our oauth end point: {{/oauth/v2/token}}<br/>Make sure to pass your crendentials and our grant_type in the body (either as formData or as JSON. In the latter case, submit Content-Type: application/json in the header)<br/>(We will use JavaScript examples here - see our example implementations for other programming languages)<br/><code>var params = {<br/>&nbsp;&nbsp;\"username\": \"your@email.com\",<br/>&nbsp;&nbsp;\"grant_type\": \"https://nl2go.com/jwt\",<br/>&nbsp;&nbsp;\"password\": \"your_password\"<br/>}</code><br/>and add an Authorization header with your auth key:<br/><code>xhr.setRequestHeader(\"Authorization\", \"Basic \" + btoa(\"xhr5n6xf_Rtguwv_jzr1d3_LTshikn4_0dtesdahNvp1:Kqf2Hs#Wwazl\");</code><br/>send the request:<br/><code>xhr.send(JSON.stringify(params));</code><br/>and the API will return the access_token (valid for 120 minutes) and a refresh_token that you can use to create a new access_token after the first one has expired.<br/><code>{<br/>&nbsp;&nbsp;\"access_token\": \"string\",<br/>&nbsp;&nbsp;\"expires_in\": 0,<br/>&nbsp;&nbsp;\"token_type\": \"string\",<br/>&nbsp;&nbsp;\"refresh_token\": \"string\"<br/>}</code><br/>Make sure to save the access_token - you will need it for every following call that you make.
    # @param grant_type grant_type
    # @param [Hash] opts the optional parameters
    # @option opts [String] :username username. Required for grant_type https://nl2go.com/jwt
    # @option opts [String] :password password. Required for grant_type https://nl2go.com/jwt
    # @option opts [String] :refresh_token refresh_token. Required for grant_type https://nl2go.com/jwt_refresh
    # @return [Token]
    def get_token(grant_type, opts = {})
      data, _status_code, _headers = get_token_with_http_info(grant_type, opts)
      return data
    end

    # Endpoint for retrieving a token
    # The Newsletter2Go API uses Basic Authorization for authentication. &lt;br/&gt;First, you will need to find your API credentials in your Newsletter2Go account by navigating to Account &gt; API. You need the auth key, your user name and your password to use our API. &lt;br/&gt;We recommend that you create a dedicated user before you get started. This way, you can better manage permissions without account your account and do not have to worry about password changes. &lt;br/&gt;In order to make API calls you need to pass an access token in each request.&lt;br/&gt;To acquire this access token, first make a POST call to our oauth end point: {{/oauth/v2/token}}&lt;br/&gt;Make sure to pass your crendentials and our grant_type in the body (either as formData or as JSON. In the latter case, submit Content-Type: application/json in the header)&lt;br/&gt;(We will use JavaScript examples here - see our example implementations for other programming languages)&lt;br/&gt;&lt;code&gt;var params &#x3D; {&lt;br/&gt;&amp;nbsp;&amp;nbsp;\&quot;username\&quot;: \&quot;your@email.com\&quot;,&lt;br/&gt;&amp;nbsp;&amp;nbsp;\&quot;grant_type\&quot;: \&quot;https://nl2go.com/jwt\&quot;,&lt;br/&gt;&amp;nbsp;&amp;nbsp;\&quot;password\&quot;: \&quot;your_password\&quot;&lt;br/&gt;}&lt;/code&gt;&lt;br/&gt;and add an Authorization header with your auth key:&lt;br/&gt;&lt;code&gt;xhr.setRequestHeader(\&quot;Authorization\&quot;, \&quot;Basic \&quot; + btoa(\&quot;xhr5n6xf_Rtguwv_jzr1d3_LTshikn4_0dtesdahNvp1:Kqf2Hs#Wwazl\&quot;);&lt;/code&gt;&lt;br/&gt;send the request:&lt;br/&gt;&lt;code&gt;xhr.send(JSON.stringify(params));&lt;/code&gt;&lt;br/&gt;and the API will return the access_token (valid for 120 minutes) and a refresh_token that you can use to create a new access_token after the first one has expired.&lt;br/&gt;&lt;code&gt;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;\&quot;access_token\&quot;: \&quot;string\&quot;,&lt;br/&gt;&amp;nbsp;&amp;nbsp;\&quot;expires_in\&quot;: 0,&lt;br/&gt;&amp;nbsp;&amp;nbsp;\&quot;token_type\&quot;: \&quot;string\&quot;,&lt;br/&gt;&amp;nbsp;&amp;nbsp;\&quot;refresh_token\&quot;: \&quot;string\&quot;&lt;br/&gt;}&lt;/code&gt;&lt;br/&gt;Make sure to save the access_token - you will need it for every following call that you make.
    # @param grant_type grant_type
    # @param [Hash] opts the optional parameters
    # @option opts [String] :username username. Required for grant_type https://nl2go.com/jwt
    # @option opts [String] :password password. Required for grant_type https://nl2go.com/jwt
    # @option opts [String] :refresh_token refresh_token. Required for grant_type https://nl2go.com/jwt_refresh
    # @return [Array<(Token, Fixnum, Hash)>] Token data, response status code and response headers
    def get_token_with_http_info(grant_type, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: AuthorizationApi.get_token ..."
      end
      # verify the required parameter 'grant_type' is set
      fail ArgumentError, "Missing the required parameter 'grant_type' when calling AuthorizationApi.get_token" if grant_type.nil?
      # verify enum value
      unless ['https://nl2go.com/jwt', 'https://nl2go.com/jwt_refresh'].include?(grant_type)
        fail ArgumentError, "invalid value for 'grant_type', must be one of https://nl2go.com/jwt, https://nl2go.com/jwt_refresh"
      end
      # resource path
      local_var_path = "/oauth/v2/token".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/x-www-form-urlencoded']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}
      form_params["grant_type"] = grant_type
      form_params["username"] = opts[:'username'] if opts[:'username']
      form_params["password"] = opts[:'password'] if opts[:'password']
      form_params["refresh_token"] = opts[:'refresh_token'] if opts[:'refresh_token']

      # http body (model)
      post_body = nil
            auth_names = ['Basic']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Token')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AuthorizationApi#get_token\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
