class Order < ApplicationRecord
  has_many :line_items, inverse_of: :order

  accepts_nested_attributes_for :line_items

  validates :line_items, presence: true

  after_validation :do_calculations

  private

  def do_calculations
    self.total = line_items.map { |h| h[:total] }.sum
    self.subtotal = line_items.map { |h| h[:subtotal] }.sum
    self.tax = line_items.map { |h| h[:tax] }.sum
  end
end
