class CardStacksController < ApplicationController
    
    def index
        cardstacks = CardStack.where(user_id: @user.id)
        render json: cardstacks, status: 200
    end 

    def create 
        cardstack = CardStack.create(title: card_params["title"], user_id: decoded_token[0]["user_id"], description: card_params["description"])
        render json: cardstack, status: 201
    end 

    def update
        @cardstack.update(card_params)
        render json: cardstack, status: 200
    end 

    def destroy 
        cardstackId = @cardstack.id
        @cardstack.destroy
        render json: {message: 'cardstack deleted!', cardstackId: cardstackId}
    end 

    private

    def card_params
        params.permit(:title, :user_id, :description)
    end 
end
