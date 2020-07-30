# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { generate(:string) }

    association :user
    association :article
  end
end
