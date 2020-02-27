class Cart < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :items, optional: true
end
