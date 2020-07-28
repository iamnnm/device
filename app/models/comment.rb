# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :user, :article, presence: true
  validates :body, presence: true, length: { maximum: 10_000 }
end
