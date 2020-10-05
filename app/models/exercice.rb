class Exercice < ApplicationRecord
  belongs_to :user

  validates :nom, :description, :fonction, :worked, presence: true
end
