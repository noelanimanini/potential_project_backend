class UserBodyPartsController < ApplicationController
    def destroy
        user_body_partsId = @user_body_part.id
        @user_body_part.destroy
        render json: {message: 'you have left this study group!', user_body_partId: user_body_partsId}
    end 
end
