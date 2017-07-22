json.body @message.body
json.user_id @message.user_id
json.group_id @message.group_id
json.user_name @message.user.name
json.image @message.image.url
json.created_time @message.created_at.strftime("%Y/%m/%d %H:%M")
json.image2 @message.image

