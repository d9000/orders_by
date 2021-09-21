class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :subtotal, :tax, :total
end
