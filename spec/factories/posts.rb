FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph(30) }
    association(:course)
    association(:user)
  end

  trait(:invalid) do
    title nil
  end
end
