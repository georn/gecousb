FactoryGirl.define do
  factory :course do
    code { Faker::Lorem.characters(rand(1..6)) }
    department { Faker::Lorem.sentence[0..rand(1..64)] }

    trait :with_terms do
      after(:create) do |course, evaluator|
        courses { FactoryGirl.create_list(:term, rand(1..5), term: term) }
      end
    end
  end
end
