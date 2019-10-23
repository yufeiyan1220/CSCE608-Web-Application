class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  has_many :apps, dependent: :destroy
  validates :number_employee, numericality: {only_integer: true, greater_than: 0}
end
