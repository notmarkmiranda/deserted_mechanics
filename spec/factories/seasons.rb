FactoryBot.define do
  factory :season do
    league
    active { true }
    completed { false }
    overall_standings { true }
  end
end
