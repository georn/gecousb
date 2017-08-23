FactoryGirl.define do
  factory :post do
    title "SISTEMAS NO HOMOGÉNEOS. ECUACIÓN DIFERENCIAL LINEAL"
    course "MA-2115"
    content "Text content for testing"
    association(:user)
  end
end
