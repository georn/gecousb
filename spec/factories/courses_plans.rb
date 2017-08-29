FactoryGirl.define do
  factory :courses_plan do
    start_date { Date.today }
    end_date { 3.months.from_now.to_date }

    association(:user)
  end
end
