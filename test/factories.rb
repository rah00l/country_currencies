FactoryGirl.define do
  factory :country do
    name "Marko"
    code  "IND"
  end

  factory :user do
    email "john@gmail.com"
    password "12345678"
    # firstname "John"
    # lastname  "Doe"
  end
end
