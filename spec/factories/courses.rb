FactoryGirl.define do
  factory :course do
    code { Faker::Lorem.characters(rand(1..6)) }
    department { Faker::Lorem.sentence[0..rand(1..64)] }

    trait :with_posts do
      after(:create) do |course, evaluator|
        create_list(:post, 2, course: course)
      end
    end

    trait :with_terms do
      after(:create) do |course, evaluator|
        create_list(:term, 2, course_ids: course.id)
      end
    end
    # rand(1..5)
  end
end
