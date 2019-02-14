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

require 'date'

module SwaggerClient

  class ListPost
    # the name of the list
    attr_accessor :name

    # uses econda tracking or not
    attr_accessor :uses_econda

    # uses google-analytics tracking or not
    attr_accessor :uses_googleanalytics

    # uses open-tracking tracking or not
    attr_accessor :has_opentracking

    # uses click-tracking tracking or not
    attr_accessor :has_clicktracking

    # uses conversion-tracking tracking or not
    attr_accessor :has_conversiontracking

    # the link to the imprint for this list, which can be used in mailings
    attr_accessor :imprint

    # the email which is used as the from field in a newsletter
    attr_accessor :header_from_email

    # the name which is used as the from field in a newsletter
    attr_accessor :header_from_name

    # the email which is used as the reply field in a newsletter
    attr_accessor :header_reply_email

    # the name which is used as the reply field in a newsletter
    attr_accessor :header_reply_name

    # a custom tracking url which is used instead of our default one
    attr_accessor :tracking_url


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'name' => :'name',
        :'uses_econda' => :'uses_econda',
        :'uses_googleanalytics' => :'uses_googleanalytics',
        :'has_opentracking' => :'has_opentracking',
        :'has_clicktracking' => :'has_clicktracking',
        :'has_conversiontracking' => :'has_conversiontracking',
        :'imprint' => :'imprint',
        :'header_from_email' => :'header_from_email',
        :'header_from_name' => :'header_from_name',
        :'header_reply_email' => :'header_reply_email',
        :'header_reply_name' => :'header_reply_name',
        :'tracking_url' => :'tracking_url'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'name' => :'String',
        :'uses_econda' => :'BOOLEAN',
        :'uses_googleanalytics' => :'BOOLEAN',
        :'has_opentracking' => :'BOOLEAN',
        :'has_clicktracking' => :'BOOLEAN',
        :'has_conversiontracking' => :'BOOLEAN',
        :'imprint' => :'String',
        :'header_from_email' => :'String',
        :'header_from_name' => :'String',
        :'header_reply_email' => :'String',
        :'header_reply_name' => :'String',
        :'tracking_url' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.has_key?(:'uses_econda')
        self.uses_econda = attributes[:'uses_econda']
      end

      if attributes.has_key?(:'uses_googleanalytics')
        self.uses_googleanalytics = attributes[:'uses_googleanalytics']
      end

      if attributes.has_key?(:'has_opentracking')
        self.has_opentracking = attributes[:'has_opentracking']
      end

      if attributes.has_key?(:'has_clicktracking')
        self.has_clicktracking = attributes[:'has_clicktracking']
      end

      if attributes.has_key?(:'has_conversiontracking')
        self.has_conversiontracking = attributes[:'has_conversiontracking']
      end

      if attributes.has_key?(:'imprint')
        self.imprint = attributes[:'imprint']
      end

      if attributes.has_key?(:'header_from_email')
        self.header_from_email = attributes[:'header_from_email']
      end

      if attributes.has_key?(:'header_from_name')
        self.header_from_name = attributes[:'header_from_name']
      end

      if attributes.has_key?(:'header_reply_email')
        self.header_reply_email = attributes[:'header_reply_email']
      end

      if attributes.has_key?(:'header_reply_name')
        self.header_reply_name = attributes[:'header_reply_name']
      end

      if attributes.has_key?(:'tracking_url')
        self.tracking_url = attributes[:'tracking_url']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @name.to_s.length < 
      return false if @imprint.to_s.length < 
      return false if @header_from_email.to_s.length < 
      return false if @header_from_name.to_s.length < 
      return false if @header_reply_email.to_s.length < 
      return false if @header_reply_name.to_s.length < 
      return false if @tracking_url.to_s.length < 
      return true
    end

    # Custom attribute writer method with validation
    # @param [Object] name Value to be assigned
    def name=(name)
      if name.nil?
        fail ArgumentError, "name cannot be nil"
      end

      if name.to_s.length < 
        fail ArgumentError, "invalid value for 'name', the character length must be great than or equal to ."
      end

      @name = name
    end

    # Custom attribute writer method with validation
    # @param [Object] imprint Value to be assigned
    def imprint=(imprint)
      if imprint.nil?
        fail ArgumentError, "imprint cannot be nil"
      end

      if imprint.to_s.length < 
        fail ArgumentError, "invalid value for 'imprint', the character length must be great than or equal to ."
      end

      @imprint = imprint
    end

    # Custom attribute writer method with validation
    # @param [Object] header_from_email Value to be assigned
    def header_from_email=(header_from_email)
      if header_from_email.nil?
        fail ArgumentError, "header_from_email cannot be nil"
      end

      if header_from_email.to_s.length < 
        fail ArgumentError, "invalid value for 'header_from_email', the character length must be great than or equal to ."
      end

      @header_from_email = header_from_email
    end

    # Custom attribute writer method with validation
    # @param [Object] header_from_name Value to be assigned
    def header_from_name=(header_from_name)
      if header_from_name.nil?
        fail ArgumentError, "header_from_name cannot be nil"
      end

      if header_from_name.to_s.length < 
        fail ArgumentError, "invalid value for 'header_from_name', the character length must be great than or equal to ."
      end

      @header_from_name = header_from_name
    end

    # Custom attribute writer method with validation
    # @param [Object] header_reply_email Value to be assigned
    def header_reply_email=(header_reply_email)
      if header_reply_email.nil?
        fail ArgumentError, "header_reply_email cannot be nil"
      end

      if header_reply_email.to_s.length < 
        fail ArgumentError, "invalid value for 'header_reply_email', the character length must be great than or equal to ."
      end

      @header_reply_email = header_reply_email
    end

    # Custom attribute writer method with validation
    # @param [Object] header_reply_name Value to be assigned
    def header_reply_name=(header_reply_name)
      if header_reply_name.nil?
        fail ArgumentError, "header_reply_name cannot be nil"
      end

      if header_reply_name.to_s.length < 
        fail ArgumentError, "invalid value for 'header_reply_name', the character length must be great than or equal to ."
      end

      @header_reply_name = header_reply_name
    end

    # Custom attribute writer method with validation
    # @param [Object] tracking_url Value to be assigned
    def tracking_url=(tracking_url)
      if tracking_url.nil?
        fail ArgumentError, "tracking_url cannot be nil"
      end

      if tracking_url.to_s.length < 
        fail ArgumentError, "invalid value for 'tracking_url', the character length must be great than or equal to ."
      end

      @tracking_url = tracking_url
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          name == o.name &&
          uses_econda == o.uses_econda &&
          uses_googleanalytics == o.uses_googleanalytics &&
          has_opentracking == o.has_opentracking &&
          has_clicktracking == o.has_clicktracking &&
          has_conversiontracking == o.has_conversiontracking &&
          imprint == o.imprint &&
          header_from_email == o.header_from_email &&
          header_from_name == o.header_from_name &&
          header_reply_email == o.header_reply_email &&
          header_reply_name == o.header_reply_name &&
          tracking_url == o.tracking_url
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [name, uses_econda, uses_googleanalytics, has_opentracking, has_clicktracking, has_conversiontracking, imprint, header_from_email, header_from_name, header_reply_email, header_reply_name, tracking_url].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /^(true|t|yes|y|1)$/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = SwaggerClient.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
