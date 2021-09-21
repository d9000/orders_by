require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe 'calculations' do
    subject { described_class.new() }
      it 'do calculations' do
        order = Order.new()
        subject.order_id = order.id
        subject.quantity = 5
        subject.amount = 20
        subject.valid?

        expect(subject.subtotal).to eq(100)
        expect(subject.tax).to eq(8)
        expect(subject.total).to eq(108)
      end
  end
end
