FactoryGirl.define do
  factory :taxi_provider do
    sequence(:name) { |n| "taxi_provider_#{n}" }
  end
end
