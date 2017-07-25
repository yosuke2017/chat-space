json.messages @messages do |message|
  json.time message.created_at.strftime('%Y/%m/%d %H:%M')
  json.name message.user.name
  json.text message.body
  json.image message.image
end
