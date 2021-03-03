class CardStacksController < ApplicationController
    skip_before_action :authorized, only: [:create, :destroy, :update, :index]

    def index
        # cardstacks = CardStack.all
        cardstacks = CardStack.where(user_id: @user.id)
        render json: cardstacks, status: 200
    end 

    def create 
        cardstack = CardStack.create(title: card_params["title"], user_id: decoded_token[0]["user_id"], description: card_params["description"])
        render json: cardstack, status: 201
    end 

    def update
        cardstack = CardStack.find(params[:id])
       
        cardstack.update(card_params)
        render json: cardstack, status: 200
    end 

    def destroy 
        cardstack = CardStack.find(params[:id])
        cardstack.destroy
        render json: {message: 'cardstack deleted!'}
    end 

    private

    def card_params
        params.require(:card_stack).permit(:title, :user_id, :description)
    end 
end
