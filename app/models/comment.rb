# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  has_many :votes, as: :voteable
  has_many :likes, -> { where vote_type: :like }, class_name: 'Vote', as: :voteable
  has_many :dislikes, -> { where vote_type: :dislike }, class_name: 'Vote', as: :voteable

  validates :user, :article, presence: true
  validates :body, presence: true, length: { maximum: 10_000 }
end
