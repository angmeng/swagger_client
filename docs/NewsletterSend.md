# SwaggerClient::NewsletterSend

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**scheduled** | **String** | ISO8601 timestamp for defining when the newsletter shall be send. If not set, the newsletter will be send immediatly | [optional] 
**group_ids** | **Array&lt;String&gt;** | a list of group ids to which the newsletter gets send (If neither group_ids nor recipient_ids are given, the newsletter gets send to the whole list) | [optional] 
**recipient_ids** | **Array&lt;String&gt;** | a list of recipient_ids ids to which the newsletter gets send (If group_ids is given, recipient_ids are ignored. If neither group_ids nor recipient_ids are given, the newsletter gets send to the whole list) | [optional] 
**contexts** | **Array&lt;Object&gt;** | A list of contexts in which every context must have at least an email-address under recipient &lt;code&gt;{\&quot;recipient\&quot;:{\&quot;email\&quot;:\&quot;...\&quot;}}&lt;/code&gt;.&lt;br&gt;Contexts are only allowed for mailings of type transaction | [optional] 


