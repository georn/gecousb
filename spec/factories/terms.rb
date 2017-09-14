FactoryGirl.define do
  factory :term do
    start_date { Date.today }
    end_date { 3.months.from_now.to_date }
    association(:user)

    trait :with_courses do
      after(:create) do |term, evaluator|
        create_list(:course, 2, term_ids: term.id)
      end
    end
  end
end
