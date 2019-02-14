# SwaggerClient::RecipientGet

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | the id of the recipient | [optional] 
**email** | **String** | the email of the recipient | [optional] 
**phone** | **String** | the phone number of the recipient | [optional] 
**gender** | **String** | m for male and f for female | [optional] 
**first_name** | **String** | the first name of the recipient | [optional] 
**last_name** | **String** | the last name of the recipient | [optional] 
**is_unsubscribed** | **BOOLEAN** | weither the recipient is unsubscribed or not | [optional] 
**is_blacklisted** | **BOOLEAN** | weither the recipient is blacklisted or not | [optional] 
**_custom_attribute_** | **String** | every custom attribute can be submitted | [optional] 
**rating** | **Integer** | Indicating the quality of the recipient. Between 0 and 5 | [optional] 
**statistic_mails_received** | **Integer** | how many newsletters the recipient has received | [optional] 
**statistic_mails_opened** | **Integer** | how many newsletters the recipient has opened | [optional] 
**statistic_mails_unique_opened** | **Integer** | how many newsletters the recipient has uniqly opened | [optional] 
**statistic_mails_clicked** | **Integer** | how often the recipient has clicked on links in newsletters | [optional] 
**statistic_conversions** | **Integer** | how often the recipient has converted | [optional] 
**statistic_conversions_sum** | **Float** | how much the recipient has spent | [optional] 
**statistic_last_mail_action** | **DateTime** | when the recipient has had the last interaction with a newsletter | [optional] 
**statistic_last_mail_received** | **DateTime** | when the recipient has had received the last newsletter | [optional] 
**statistic_last_mail_opened** | **DateTime** | when the recipient has had opened the last newsletter | [optional] 
**statistic_last_mail_clicked** | **DateTime** | when the recipient has had clicked the last newsletter | [optional] 
**statistic_last_mail_converted** | **DateTime** | when the recipient has had converted the last time | [optional] 
**statistic_last_useragent_device** | **String** | the last useragent device used for opening a newsletter | [optional] 
**statistic_last_useragent_family** | **String** | the last useragent family used for opening a newsletter | [optional] 
**statistic_last_latitude** | **Float** | the last latitude where the recipient has opened a newsletter | [optional] 
**statistic_last_longitude** | **Float** | the last longitude where the recipient has opened a newsletter | [optional] 
**statistic_last_blacklist_list** | **DateTime** | when the recipient was blacklisted the last time | [optional] 
**statistic_last_unsubscribe_list** | **DateTime** | when the recipient was unsubscribed the last time | [optional] 
**statistic_last_blacklist_list_reason** | **String** | the reason the recipient got blacklisted the last time | [optional] 
**statistic_last_unsubscribe_list_reason** | **String** | the reason the recipient got unsubscribed the last time | [optional] 


