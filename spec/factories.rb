FactoryGirl.define do
  factory :taxi_provider do
    sequence(:name) { |n| "taxi_provider_#{n}" }
  end

  factory :taxi_ride do
    sequence(:start_address) { |n| "Słomińskiego #{n}, Warszawa, Polska"  }
    sequence(:destination_address) { |n| "Wiatraczna #{n}, Warszawa, Polska" }
    fare { "#{1 + rand(100)}.#{rand(100)}" }
    taxi_provider { create(:taxi_provider) }
    distance { 1 + rand(10) }
  end
end
