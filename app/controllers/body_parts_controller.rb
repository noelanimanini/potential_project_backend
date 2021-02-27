class BodyPartsController < ApplicationController
    # skip_before_action :authorized, only: [:index]
    #the authorize method allows people who are loggin in to see the data. The authorize method 
    #needs to be skipped in logging in and creating a user. 
    def index
        bodyparts = BodyPart.all
        render json: bodyparts, status: 200
    end 

end
