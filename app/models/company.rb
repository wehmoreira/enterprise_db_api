class Company < ApplicationRecord
  validates :name, presence: true
  validates :cnpj, presence: true
  validates :total_employees, numericality: {
    only_integer: true, :greater_than_or_equal_to => 0
  }
  validates :total_systems, numericality: {
    only_integer: true, :greater_than_or_equal_to => 0
  }
end
