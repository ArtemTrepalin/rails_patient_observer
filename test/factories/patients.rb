FactoryBot.define do
  factory :patient do
    first_name
    last_name
    sur_name
    phone_number
    address
    status
    watcher
  end
end
