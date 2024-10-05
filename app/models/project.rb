class Project < ApplicationRecord
  has_many :lists, dependent: :destroy
end
