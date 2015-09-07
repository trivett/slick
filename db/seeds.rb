

users = FactoryGirl.create_list(:user, 20)
# puts users
conversations = FactoryGirl.create_list(:conversation, 20)

i = 1

users.each do |u|
  Conversation.find(i).users << u
  Message.create(user_id: u.id, conversation_id: i, content: FFaker::HipsterIpsum.phrase )

  r = (1..20).to_a.sample
  Conversation.find(r).users << u
  Message.create(user_id: u.id, conversation_id: r, content: FFaker::HipsterIpsum.phrase )
  r = (1..20).to_a.sample
  Conversation.find(r).users << u
  Message.create(user_id: u.id, conversation_id: r, content: FFaker::HipsterIpsum.phrase )
  i += 1
end

