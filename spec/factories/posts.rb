FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    course "MA-2115"
    content { Faker::Lorem.paragraphs(4) }
    association(:user)
  end
end
