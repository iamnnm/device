# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user

  validates :user, presence: true

  validates :title, presence: true, length: { maximum: 100 }
  validates :post, presence: true, length: { maximum: 10_000 }
end
