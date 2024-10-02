class ApplicationController < ActionController::API
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
end
