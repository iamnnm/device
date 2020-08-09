FactoryBot.define do
  factory :vote do
    user { nil }
    voteable { nil }
    vote_type { "MyString" }
  end
end
