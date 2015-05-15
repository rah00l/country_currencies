FactoryGirl.define do
  factory :country do
    name "India"
    # code  "IND"
    sequence(:code){|n| "country-#{n}" }
  end

  factory :currency do
    name "Rupee"
    sequence(:code){|n| "currency-#{n}" }
    # code  "rs"
  end

  factory :user do
    email "john@gmail.com"
    password "12345678"
    # firstname "John"
    # lastname  "Doe"
  end
end
