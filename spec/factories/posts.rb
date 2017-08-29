FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    course "MA-2115"
    content { Faker::Lorem.paragraph(30) }
    association(:user)
  end

  factory :invalid_post, parent: :post do
    title nil
  end
end
