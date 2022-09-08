class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_and_belongs_to_many :operations

  validates :name, presence: true
  validates :icon, presence: true

  def total
    operations.sum(:amount)
  end

  def icons
    @icons = ['🛫', '🏩', '❤️', '🏠', '🧘', '🏀', '🍕', '🎁', '🐕', '🧑🏼‍💻', '💅', '🛍️', '🍻', '🚗', '🛒']
  end
end
