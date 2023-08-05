FactoryBot.define do
  factory :game do
    season
    date { "2023-08-05 14:08:52" }
    completed { false }
    buy_in { 100 }
    location { Faker::Address.city }
    estimated_player_count { 6 }
    payout_schedule { { 1 => 50, 2 => 30, 3 => 20 } }
  end
end
