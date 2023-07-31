FactoryBot.define do
  factory :season do
    league { nil }
    active { false }
    completed { false }
    overall_standings { false }
  end
end
