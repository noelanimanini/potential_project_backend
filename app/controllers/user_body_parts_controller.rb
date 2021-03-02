class UserBodyPartsController < ApplicationController

    def destroy
        user_body_partsId = @user_body_part.id
        @user_body_part.destroy
        render json: {message: 'you have left this study group!', user_body_partId: user_body_partsId}
    end 

    def create
        user_body_part = UserBodyPart.create(user_body_part_params)
        render json: @user_body_part, status: 201
    end 

    def update
        @user_body_part.update(user_body_part_params)
        render json: @user_body_part, status: 200
    end

    private

    def user_body_part_params
        params.permit(:card_stack_id, :body_part_id)
    end 
end
