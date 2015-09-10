json.user(@user.name)
json.(@user, :email)

json.messages @user.messages, :conversation, :content