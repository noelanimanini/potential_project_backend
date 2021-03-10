class UserBodyPartsController < ApplicationController
    skip_before_action :authorized, only: [:create, :destroy, :update, :index]

    def index
        user_body_parts = UserBodyPart.where(user_id: @user.id)
        render json: user_body_parts
    end 

    def show
        user_body_part = UserBodyPart.find(params[:id])
        render json: user_body_part
    end 

    def destroy
        user_body_part = UserBodyPart.find(params[:id])
        user_body_part.destroy
        render json: {message: 'you have left this study group!'}
    end 

    def create
        user_body_part = UserBodyPart.create(user_body_part_params)
        render json: user_body_part, status: 201
    end 

    def update
        user_body_part = UserBodyPart.find(params[:id])
        user_body_part.update(user_body_part_params)
        render json: user_body_part, status: 200
    end

    private

    def user_body_part_params
        params.require(:user_body_part).permit(:card_stack_id, :body_part_id, :comments)
    end 
end
