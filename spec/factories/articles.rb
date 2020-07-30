# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { generate(:string) }
    post  { generate(:string) }

    association :user

    trait :invalid do
      title { '' }
    end
  end
end
