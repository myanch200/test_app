class Project < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :cards, through: :lists
end
