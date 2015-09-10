json.conversation(@conversation.name)
json.(@conversation, :name)

json.messages @conversation.messages, :user, :content