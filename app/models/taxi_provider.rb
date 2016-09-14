class TaxiProvider < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
