FactoryGirl.define do
  factory :country do
    name "India"
    code  "IND"
  end

  factory :currency do
    name "Rupee"
    code  "rs"
  end

  factory :user do
    email "john@gmail.com"
    password "12345678"
    # firstname "John"
    # lastname  "Doe"
  end
end
