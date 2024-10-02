class Api::V1::CardsController < ApplicationController
    before_action :authorize_request

    def create
        card = Card.new(card_params)
        if card.save
          render json: card, status: :created
        else
          render json: card.errors, status: :unprocessable_entity
        end
    end

    def cancel
        card = Card.find(params[:id])
        card.cancel
        render json: { message: 'Card cancelled' }, status: :ok
    end

    private

    def card_params
        params.require(:card).permit(:product_id, :client_id, :activation_number, :purchase_pin)
    end
end
