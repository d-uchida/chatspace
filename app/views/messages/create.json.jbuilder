
  json.id @message.id
  json.text @message.text
  json.image @message.image
  json.table @message.table
  json.group_id @message.group_id
  json.user_id @message.user_id
  json.name @message.user.name
  json.created_at @message.created_at