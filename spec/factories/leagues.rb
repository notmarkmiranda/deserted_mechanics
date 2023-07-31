FactoryBot.define do
  factory :league do
    sequence(:name) { |n| "#{Faker::Team.name} - #{n}" }
    location { "#{Faker::Address.city}, #{Faker::Address.state_abbr}" }
    private_league { false }
  end
end
