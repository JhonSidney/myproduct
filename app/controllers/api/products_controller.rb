class Api::ProductsController < ActionController::API
    include ActionController::HttpAuthentication::Basic::ControllerMethods

    http_basic_authenticate_with name: "admin", password: "123"

    def index
        @products = Product.all
        @products = @products.where(category: params[:category]) if params[:category]
        @products = @products.where(price: params[:price]) if params[:price]
        @products = @products.where(stock: params[:stock]) if params[:stock]
        @products = @products.where('name ILIKE ?', "%#{params[:name]}%") if params[:name]
        render json: @products
    end

    def show
        @product = Product.find(params[:id])
        render json: @product
    end
end
