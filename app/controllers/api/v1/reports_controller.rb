class Api::V1::ReportsController < ApplicationController
    before_action :authorize_request

    def index
        report_data = generate_report

        render json: report_data, status: :ok
    end

    private

    def generate_report
        products = Product.includes(:cards).all
        report = products.map do |product|
          {
            product_id: product.id,
            product_name: product.name,
            product_price: product.price,
            product_currency: product.currency,
            cards_count: product.cards.count,
            cards_details: product.cards.map do |card|
              {
                activation_number: card.activation_number,
                purchase_pin: card.purchase_pin,
                created_at: card.created_at
              }
            end
          }
    end

    {
      total_products: products.count,
      products: report
    }
    end
end
