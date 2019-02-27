class Person < ApplicationRecord
  # Associations
  # Validations
  # Methods

  validates :age, numericality: {
    less_than_or_equal_to: 150,
    greater_than_or_equal_to 80
  }

  validates :alive, inclusion: {
    in: %w ( true, false),
    message: "%{value} is invalid."
  }

  validates :gender, :name, :age, :alive, presence: true

  validates :hair_color, :eye_color, allow_blank: true

  validates :name, uniqueness: true

  # callback
  def self.order_age
    order(age: :desc)
  end

  before_create :set_alive
  def set_alive
    self.alive = true
  end

  
end
