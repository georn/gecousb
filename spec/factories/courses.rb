FactoryGirl.define do
  factory :course do
    code { Faker::Lorem.characters(rand(1..6)) }
    department { Faker::Lorem.sentence[0..rand(1..64)] }
  end
end
