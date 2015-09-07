
FactoryGirl.define do
  factory :conversation do
    name { FFaker::Movie.title}
  end
end
