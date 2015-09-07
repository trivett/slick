FactoryGirl.define do
  factory :message do
    content { FFaker::HipsterIpsum.phrase }
    user_id 1
    conversation_id 1

  end

end
