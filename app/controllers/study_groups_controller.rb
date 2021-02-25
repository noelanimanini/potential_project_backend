class StudyGroupsController < ApplicationController
    def index
        # studygroups = StudyGroup.where(user_id: @user.id) || 
        
        studygroups = StudyGroup.all
        render json: studygroups, status: 200
    end 

    def update
        @studygroup.update(study_params)
        render json: @studygroup
    end 

    def show
        render json: @studygroup, status: 200
    end 

    def destroy
        studygroupId = @studygroup.id
        @studygroup.destroy
        render json: {message: "you are no longer apart of this study group"}
    end 

    private

    def study_params
        params.permit(:name, :description)
    end 
end
