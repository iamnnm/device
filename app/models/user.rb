# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :set_name, on: [:create]

  has_many :articles
  has_many :comments

  validates :name, presence: true, length: { maximum: 35 } #, uniqueness: true

  private

  def set_name
    self.name = "Comrade ##{rand(777777)}" if name.blank?
  end
end
