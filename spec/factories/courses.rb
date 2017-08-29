FactoryGirl.define do
  factory :course do
    code "MyString"
    department "MyString"
    careers "MyString"


    association(:courses_plan)
    association(:post)
  end
end
