FactoryGirl.define do
  factory :term do
    start_date { Date.today }
    end_date { 3.months.from_now.to_date }
    association(:user)
    association(:course)
  end
end
