class Api::V1::ClientsController < ApplicationController
    def index
        clients = Client.all
        render json: clients, status: :ok
    end

    def create
        client = Client.new(client_params)
        if client.save
          render json: client, status: :created
        else
          render json: client.errors, status: :unprocessable_entity
        end
    end

    private

    def client_params
        params.require(:client).permit(:name, :email, :payout_rate)
    end
end
