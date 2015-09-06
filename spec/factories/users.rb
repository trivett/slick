FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    name { FFaker::Name.name }
    password "secretsauce"
    password_confirmation "secretsauce"
  end
end