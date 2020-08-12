# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_many :votes, as: :voteable
  has_many :likes, -> { where vote_type: :like }, class_name: 'Vote', as: :voteable
  has_many :dislikes, -> { where vote_type: :dislike }, class_name: 'Vote', as: :voteable

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :post, presence: true, length: { maximum: 10_000 }
end
