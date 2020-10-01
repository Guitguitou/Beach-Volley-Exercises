class Exercice < ApplicationRecord
  belongs_to :user

  validates :nom, :description, :type, :worked, presence: true
end
