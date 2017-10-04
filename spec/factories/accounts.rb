FactoryGirl.define do
  factory :account do
    balance 1.5
    currency "rub"
    name "TestName"
    email "test@test.com"
  end
end
