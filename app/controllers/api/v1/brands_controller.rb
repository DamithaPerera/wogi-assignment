class Api::V1::BrandsController < ApplicationController
    before_action :authorize_request

    def index
        brands = Brand.all
        render json: brands, status: :ok
    end

    def create
        brand = Brand.new(brand_params)
        if brand.save
          render json: brand, status: :created
        else
          render json: brand.errors, status: :unprocessable_entity
        end
    end

    private

    def brand_params
        params.require(:brand).permit(:name, customizable_fields: {})
    end
end
