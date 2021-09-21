require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "POST /create" do
    scenario "with valid attributes" do
      post '/orders', params: {
        order: {
          line_items_attributes: [
            quantity: 10,
            amount: 10
          ]
          }
        }

      expect(response.status).to eq(201)

      json = JSON.parse(response.body).deep_symbolize_keys

      expect(json[:order][:subtotal]).to eq("100.0")
      expect(json[:order][:total]).to eq("108.0")
      expect(json[:order][:tax]).to eq("8.0")

      expect(Order.count).to eq(1)
      expect(LineItem.count).to eq(1)
    end

    scenario "with invalid line items attributes" do
      post '/orders', params: {
        order: {
          line_items_attributes: [
            quantity: 10
          ]
          }
        }

      expect(response.body).to include("errors")

      expect(Order.count).to eq(0)
      expect(LineItem.count).to eq(0)
    end
  end
end
