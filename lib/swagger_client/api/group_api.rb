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
  class GroupApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # add single recipient to group
    # add Recipient to Group
    # @param lid the id of the list
    # @param gid the id of the group
    # @param id the id of the recipient
    # @param [Hash] opts the optional parameters
    # @return [PatchResponse]
    def add_recipient_to_group(lid, gid, id, opts = {})
      data, _status_code, _headers = add_recipient_to_group_with_http_info(lid, gid, id, opts)
      return data
    end

    # add single recipient to group
    # add Recipient to Group
    # @param lid the id of the list
    # @param gid the id of the group
    # @param id the id of the recipient
    # @param [Hash] opts the optional parameters
    # @return [Array<(PatchResponse, Fixnum, Hash)>] PatchResponse data, response status code and response headers
    def add_recipient_to_group_with_http_info(lid, gid, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: GroupApi.add_recipient_to_group ..."
      end
      # verify the required parameter 'lid' is set
      fail ArgumentError, "Missing the required parameter 'lid' when calling GroupApi.add_recipient_to_group" if lid.nil?
      # verify the required parameter 'gid' is set
      fail ArgumentError, "Missing the required parameter 'gid' when calling GroupApi.add_recipient_to_group" if gid.nil?
      # verify the required parameter 'id' is set
      fail ArgumentError, "Missing the required parameter 'id' when calling GroupApi.add_recipient_to_group" if id.nil?
      # resource path
      local_var_path = "/lists/{lid}/groups/{gid}/recipients/{id}".sub('{format}','json').sub('{' + 'lid' + '}', lid.to_s).sub('{' + 'gid' + '}', gid.to_s).sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
            auth_names = ['OAuth']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PatchResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GroupApi#add_recipient_to_group\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # add all Recipients to the given group
    # add all Recipients to the given group. Pay attention to the filter, if you forget to submit it, all recipients of the current list are getting added to the group!
    # @param lid the id of the list
    # @param gid the id of the group
    # @param [Hash] opts the optional parameters
    # @option opts [String] :_filter a FIQL-Filter
    # @return [PatchResponse]
    def add_recipients_to_group(lid, gid, opts = {})
      data, _status_code, _headers = add_recipients_to_group_with_http_info(lid, gid, opts)
      return data
    end

    # add all Recipients to the given group
    # add all Recipients to the given group. Pay attention to the filter, if you forget to submit it, all recipients of the current list are getting added to the group!
    # @param lid the id of the list
    # @param gid the id of the group
    # @param [Hash] opts the optional parameters
    # @option opts [String] :_filter a FIQL-Filter
    # @return [Array<(PatchResponse, Fixnum, Hash)>] PatchResponse data, response status code and response headers
    def add_recipients_to_group_with_http_info(lid, gid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: GroupApi.add_recipients_to_group ..."
      end
      # verify the required parameter 'lid' is set
      fail ArgumentError, "Missing the required parameter 'lid' when calling GroupApi.add_recipients_to_group" if lid.nil?
      # verify the required parameter 'gid' is set
      fail ArgumentError, "Missing the required parameter 'gid' when calling GroupApi.add_recipients_to_group" if gid.nil?
      # resource path
      local_var_path = "/lists/{lid}/groups/{gid}/recipients".sub('{format}','json').sub('{' + 'lid' + '}', lid.to_s).sub('{' + 'gid' + '}', gid.to_s)

      # query parameters
      query_params = {}
      query_params[:'_filter'] = opts[:'_filter'] if opts[:'_filter']

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
            auth_names = ['OAuth']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PatchResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GroupApi#add_recipients_to_group\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # creates a new group
    # creates a new group.
    # @param group the data to save
    # @param [Hash] opts the optional parameters
    # @return [ApiResponsePost]
    def create_group(group, opts = {})
      data, _status_code, _headers = create_group_with_http_info(group, opts)
      return data
    end

    # creates a new group
    # creates a new group.
    # @param group the data to save
    # @param [Hash] opts the optional parameters
    # @return [Array<(ApiResponsePost, Fixnum, Hash)>] ApiResponsePost data, response status code and response headers
    def create_group_with_http_info(group, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: GroupApi.create_group ..."
      end
      # verify the required parameter 'group' is set
      fail ArgumentError, "Missing the required parameter 'group' when calling GroupApi.create_group" if group.nil?
      # resource path
      local_var_path = "/groups".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(group)
      auth_names = ['OAuth']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ApiResponsePost')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GroupApi#create_group\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # delete the Group
    # delete one Group
    # @param id the id of the Group
    # @param [Hash] opts the optional parameters
    # @return [ApiResponseDelete]
    def delete_group(id, opts = {})
      data, _status_code, _headers = delete_group_with_http_info(id, opts)
      return data
    end

    # delete the Group
    # delete one Group
    # @param id the id of the Group
    # @param [Hash] opts the optional parameters
    # @return [Array<(ApiResponseDelete, Fixnum, Hash)>] ApiResponseDelete data, response status code and response headers
    def delete_group_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: GroupApi.delete_group ..."
      end
      # verify the required parameter 'id' is set
      fail ArgumentError, "Missing the required parameter 'id' when calling GroupApi.delete_group" if id.nil?
      # resource path
      local_var_path = "/groups/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
            auth_names = ['OAuth']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ApiResponseDelete')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GroupApi#delete_group\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # get all Group of selected list
    # get Groups
    # @param lid the id of the list
    # @param [Hash] opts the optional parameters
    # @option opts [String] :_filter a FIQL-Filter
    # @option opts [Integer] :_limit a limit for list-responses (default to 50)
    # @option opts [Integer] :_offset an offset for list-responses (default to 0)
    # @option opts [BOOLEAN] :_expand true if attributes should be returned or not
    # @option opts [Array<String>] :_fields list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed
    # @return [GroupResponse]
    def get_groups(lid, opts = {})
      data, _status_code, _headers = get_groups_with_http_info(lid, opts)
      return data
    end

    # get all Group of selected list
    # get Groups
    # @param lid the id of the list
    # @param [Hash] opts the optional parameters
    # @option opts [String] :_filter a FIQL-Filter
    # @option opts [Integer] :_limit a limit for list-responses
    # @option opts [Integer] :_offset an offset for list-responses
    # @option opts [BOOLEAN] :_expand true if attributes should be returned or not
    # @option opts [Array<String>] :_fields list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed
    # @return [Array<(GroupResponse, Fixnum, Hash)>] GroupResponse data, response status code and response headers
    def get_groups_with_http_info(lid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: GroupApi.get_groups ..."
      end
      # verify the required parameter 'lid' is set
      fail ArgumentError, "Missing the required parameter 'lid' when calling GroupApi.get_groups" if lid.nil?
      # resource path
      local_var_path = "/lists/{lid}/groups".sub('{format}','json').sub('{' + 'lid' + '}', lid.to_s)

      # query parameters
      query_params = {}
      query_params[:'_filter'] = opts[:'_filter'] if opts[:'_filter']
      query_params[:'_limit'] = opts[:'_limit'] if opts[:'_limit']
      query_params[:'_offset'] = opts[:'_offset'] if opts[:'_offset']
      query_params[:'_expand'] = opts[:'_expand'] if opts[:'_expand']
      query_params[:'_fields'] = @api_client.build_collection_param(opts[:'_fields'], :csv) if opts[:'_fields']

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
            auth_names = ['OAuth']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GroupResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GroupApi#get_groups\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # get all Recipients of selected group
    # get Recipients
    # @param lid the id of the list
    # @param gid the id of the group
    # @param [Hash] opts the optional parameters
    # @option opts [String] :_filter a FIQL-Filter
    # @option opts [Integer] :_limit a limit for list-responses (default to 50)
    # @option opts [Integer] :_offset an offset for list-responses (default to 0)
    # @option opts [BOOLEAN] :_expand true if attributes should be returned or not
    # @option opts [Array<String>] :_fields list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed
    # @return [RecipientResponse]
    def get_recipients_by_group(lid, gid, opts = {})
      data, _status_code, _headers = get_recipients_by_group_with_http_info(lid, gid, opts)
      return data
    end

    # get all Recipients of selected group
    # get Recipients
    # @param lid the id of the list
    # @param gid the id of the group
    # @param [Hash] opts the optional parameters
    # @option opts [String] :_filter a FIQL-Filter
    # @option opts [Integer] :_limit a limit for list-responses
    # @option opts [Integer] :_offset an offset for list-responses
    # @option opts [BOOLEAN] :_expand true if attributes should be returned or not
    # @option opts [Array<String>] :_fields list of case-sensetive fields which should be returned.    Only needed if _expand is false or special attributes are needed
    # @return [Array<(RecipientResponse, Fixnum, Hash)>] RecipientResponse data, response status code and response headers
    def get_recipients_by_group_with_http_info(lid, gid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: GroupApi.get_recipients_by_group ..."
      end
      # verify the required parameter 'lid' is set
      fail ArgumentError, "Missing the required parameter 'lid' when calling GroupApi.get_recipients_by_group" if lid.nil?
      # verify the required parameter 'gid' is set
      fail ArgumentError, "Missing the required parameter 'gid' when calling GroupApi.get_recipients_by_group" if gid.nil?
      # resource path
      local_var_path = "/lists/{lid}/groups/{gid}/recipients".sub('{format}','json').sub('{' + 'lid' + '}', lid.to_s).sub('{' + 'gid' + '}', gid.to_s)

      # query parameters
      query_params = {}
      query_params[:'_filter'] = opts[:'_filter'] if opts[:'_filter']
      query_params[:'_limit'] = opts[:'_limit'] if opts[:'_limit']
      query_params[:'_offset'] = opts[:'_offset'] if opts[:'_offset']
      query_params[:'_expand'] = opts[:'_expand'] if opts[:'_expand']
      query_params[:'_fields'] = @api_client.build_collection_param(opts[:'_fields'], :csv) if opts[:'_fields']

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
            auth_names = ['OAuth']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'RecipientResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GroupApi#get_recipients_by_group\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # remove single recipient from group
    # remove Recipient to Group
    # @param lid the id of the list
    # @param gid the id of the group
    # @param id the id of the recipient
    # @param [Hash] opts the optional parameters
    # @return [PatchResponse]
    def remove_recipient_from_group(lid, gid, id, opts = {})
      data, _status_code, _headers = remove_recipient_from_group_with_http_info(lid, gid, id, opts)
      return data
    end

    # remove single recipient from group
    # remove Recipient to Group
    # @param lid the id of the list
    # @param gid the id of the group
    # @param id the id of the recipient
    # @param [Hash] opts the optional parameters
    # @return [Array<(PatchResponse, Fixnum, Hash)>] PatchResponse data, response status code and response headers
    def remove_recipient_from_group_with_http_info(lid, gid, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: GroupApi.remove_recipient_from_group ..."
      end
      # verify the required parameter 'lid' is set
      fail ArgumentError, "Missing the required parameter 'lid' when calling GroupApi.remove_recipient_from_group" if lid.nil?
      # verify the required parameter 'gid' is set
      fail ArgumentError, "Missing the required parameter 'gid' when calling GroupApi.remove_recipient_from_group" if gid.nil?
      # verify the required parameter 'id' is set
      fail ArgumentError, "Missing the required parameter 'id' when calling GroupApi.remove_recipient_from_group" if id.nil?
      # resource path
      local_var_path = "/lists/{lid}/groups/{gid}/recipients/{id}".sub('{format}','json').sub('{' + 'lid' + '}', lid.to_s).sub('{' + 'gid' + '}', gid.to_s).sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
            auth_names = ['OAuth']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PatchResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GroupApi#remove_recipient_from_group\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # remove all Recipients from given group
    # remove all Recipients from given group. Pay attention to the filter, if you forget to submit it, all recipients are getting removed from the group!
    # @param lid the id of the list
    # @param gid the id of the group
    # @param [Hash] opts the optional parameters
    # @option opts [String] :_filter a FIQL-Filter
    # @return [PatchResponse]
    def remove_recipients_from_group(lid, gid, opts = {})
      data, _status_code, _headers = remove_recipients_from_group_with_http_info(lid, gid, opts)
      return data
    end

    # remove all Recipients from given group
    # remove all Recipients from given group. Pay attention to the filter, if you forget to submit it, all recipients are getting removed from the group!
    # @param lid the id of the list
    # @param gid the id of the group
    # @param [Hash] opts the optional parameters
    # @option opts [String] :_filter a FIQL-Filter
    # @return [Array<(PatchResponse, Fixnum, Hash)>] PatchResponse data, response status code and response headers
    def remove_recipients_from_group_with_http_info(lid, gid, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: GroupApi.remove_recipients_from_group ..."
      end
      # verify the required parameter 'lid' is set
      fail ArgumentError, "Missing the required parameter 'lid' when calling GroupApi.remove_recipients_from_group" if lid.nil?
      # verify the required parameter 'gid' is set
      fail ArgumentError, "Missing the required parameter 'gid' when calling GroupApi.remove_recipients_from_group" if gid.nil?
      # resource path
      local_var_path = "/lists/{lid}/groups/{gid}/recipients".sub('{format}','json').sub('{' + 'lid' + '}', lid.to_s).sub('{' + 'gid' + '}', gid.to_s)

      # query parameters
      query_params = {}
      query_params[:'_filter'] = opts[:'_filter'] if opts[:'_filter']

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
            auth_names = ['OAuth']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PatchResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GroupApi#remove_recipients_from_group\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # update the Group
    # update one Group
    # @param id the id of the Group
    # @param group the data to update
    # @param [Hash] opts the optional parameters
    # @return [PatchResponse]
    def update_group(id, group, opts = {})
      data, _status_code, _headers = update_group_with_http_info(id, group, opts)
      return data
    end

    # update the Group
    # update one Group
    # @param id the id of the Group
    # @param group the data to update
    # @param [Hash] opts the optional parameters
    # @return [Array<(PatchResponse, Fixnum, Hash)>] PatchResponse data, response status code and response headers
    def update_group_with_http_info(id, group, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: GroupApi.update_group ..."
      end
      # verify the required parameter 'id' is set
      fail ArgumentError, "Missing the required parameter 'id' when calling GroupApi.update_group" if id.nil?
      # verify the required parameter 'group' is set
      fail ArgumentError, "Missing the required parameter 'group' when calling GroupApi.update_group" if group.nil?
      # resource path
      local_var_path = "/groups/{id}".sub('{format}','json').sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(group)
      auth_names = ['OAuth']
      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PatchResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GroupApi#update_group\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
