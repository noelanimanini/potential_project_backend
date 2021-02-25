class BodyPartsController < ApplicationController
    def index
        bodyparts = BodyPart.all
        render json: bodyparts, status: 200
    end 

end
