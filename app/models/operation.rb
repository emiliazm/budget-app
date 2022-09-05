class Operation < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_operacions

  validates :name, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
