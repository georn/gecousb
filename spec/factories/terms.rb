FactoryGirl.define do
  factory :term do
    start_date { Date.today }
    end_date { 3.months.from_now.to_date }
    association(:user)

    trait :with_courses do
      after(:create) do |term, evaluator|
        terms { FactoryGirl.create_list(:course, rand(1..5), term: term) }
      end
    end
  end
end
