class Api::V1::ProductsController < ApplicationController
    before_action :authorize_request

    def index
        products = Product.all
        render json: products, status: :ok
    end

    def create
        product = Product.new(product_params)
        if product.save
          render json: product, status: :created
        else
          render json: product.errors, status: :unprocessable_entity
        end
    end

    def update
        product = Product.find(params[:id])
        if product.update(product_params)
          render json: product, status: :ok
        else
          render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        product = Product.find(params[:id])
        if product.destroy
          render json: { message: 'Product deleted successfully.' }, status: :ok
        else
          render json: { error: 'Failed to delete product.' }, status: :unprocessable_entity
        end
    end

    private

    def product_params
        params.require(:product).permit(:name, :price, :currency, :brand_id, customizable_fields: {})
    end
end
