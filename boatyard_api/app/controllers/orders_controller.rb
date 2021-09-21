class OrdersController < ApplicationController
  def create
    order = Order.create!(permitted_params)

    render json: order, serializer: OrderSerializer, status: :created
  rescue
    render json: { errors: { message: "error has occurred" } }, status: :unprocessable_entity
  end

  private

  def permitted_params
    params.fetch(:order, {}).
      permit(
        line_items_attributes: [
          :quantity, :amount
        ]
      )
  end
end
