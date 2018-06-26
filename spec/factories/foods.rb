FactoryBot.define do
  factory :food do
    sequence(:name) {|n| "pizza#{n}"}
    calories 500
  end
end
