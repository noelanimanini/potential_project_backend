class UsersController < ApplicationController
    def index
        users = User.all
        render json: users, status: 200
    end 

    def create
        @user = User.create(user_params)
        if @user.valid? 
          my_token = encode_token({user_id: @user.id})
          render json: {id: @user.id, username: @user.username, token: my_token}
        else 
          render json: {error: 'failed to create a user'}
        end 
      end
    
      private
    
      def user_params
        params.require(:user).permit(:username, :password)
      end
end
