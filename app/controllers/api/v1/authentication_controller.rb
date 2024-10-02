class Api::V1::AuthenticationController < ApplicationController
    before_action :authorize_request, except: [:login, :register]

    # POST /auth/login
    def login
        @user = User.find_by(email: params[:email])
        if @user&.valid_password?(params[:password])
          token = JsonWebToken.encode(user_id: @user.id)
          render json: { token: token, exp: 24.hours.from_now }, status: :ok
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
    end

    def register
        @user = User.new(user_params)
        if @user.save
          token = JsonWebToken.encode(user_id: @user.id)
          render json: { token: token, exp: 24.hours.from_now }, status: :created
        else
          render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end


    # Authorization method
    def authorize_request
        header = request.headers['Authorization']
        return render json: { error: 'Missing token' }, status: :unauthorized unless header

        token = header.split(' ').last
        decoded = JsonWebToken.decode(token)

        if decoded && decoded[:user_id]
        @current_user = User.find_by(id: decoded[:user_id])
        unless @current_user
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
        else
        render json: { error: 'Invalid token' }, status: :unauthorized
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

    # Check if the action requires authorization
    #def auth_required?
      # List of actions that don't require authorization
      #controller_name != 'authentication' && action_name != 'login' && action_name != 'register'
    #end
end
