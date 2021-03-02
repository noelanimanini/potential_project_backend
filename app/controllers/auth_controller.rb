class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            my_token = encode_token({user_id: @user.id})
            cardstacks = CardStack.where(user_id: @user.id)
            render json: {id: @user.id, username: @user.username, token: my_token, card_stack: cardstacks}
        else 
            render json: {error: 'That user could not be found'}, status: 401
        end 
    end 

    def show
      cardstacks = CardStack.where(user_id: @user.id)
      render json: {id: @user.id, username: @user.username, card_stack: cardstacks}
    end

end 