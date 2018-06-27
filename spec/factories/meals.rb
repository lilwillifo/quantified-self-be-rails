FactoryBot.define do
  factory :meal do
    sequence(:name) {|n| "meal#{n}"}
  end
end
