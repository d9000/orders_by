class OrderSerializer < ActiveModel::Serializer
  attributes :id, :subtotal, :tax, :total

  has_many :line_items, serializer: LineItemSerializer
end
