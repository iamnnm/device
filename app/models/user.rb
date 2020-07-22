class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 35 }

  before_validation :set_name, on: [:create]

  private

  def set_name
    self.name = "Comrade ##{rand(777)}" if name.blank?
  end
end
