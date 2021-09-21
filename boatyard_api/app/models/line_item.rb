class LineItem < ApplicationRecord
  belongs_to :order

  validates :quantity, :amount, presence: :true

  after_validation :do_calculations

  private

  def do_calculations
    self.subtotal = amount * quantity
    self.tax = (subtotal * 8) / 100
    self.total = subtotal + tax
  end
end
