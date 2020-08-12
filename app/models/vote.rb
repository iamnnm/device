# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :user, presence: true
  validates :voteable_id, :voteable_type, presence: true

  # after_commit :change_user_reputation
  #
  # def change_user_reputation
  #   user = User.find(self.user)
  #
  #   case vote_type
  #   when :like
  #     user.increment!(:reputation)
  #   when :dislike
  #     user.decrement!(:reputation)
  #   else
  #     "Error: vote_type has an invalid value (#{vote_type})"
  #   end
  # end
end
