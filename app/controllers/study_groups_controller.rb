class StudyGroupsController < ApplicationController
  skip_before_action :authorized, only: [:create, :destroy, :update, :index]
    def index
        # studygroups = StudyGroup.where(user_id: @user.id) || 
        
        study_groups = StudyGroup.all
        render json: study_groups, status: 200
    end 

    def create
      study_group = StudyGroup.create(study_params)
      render json: study_group, status: 200
    end 

    def update
        study_group = StudyGroup.find(params[:id])
        study_group.update(study_params)
        render json: study_group
    end 

    def show
      study_group = StudyGroup.find(params[:id])
        render json: study_group, status: 200
    end 

    def destroy
      study_group = StudyGroup.find(params[:id])
      study_group.destroy
        render json: {message: "you are no longer apart of this study group"}
    end 

    private

    def study_params
        params.require(:study_group).permit(:name, :date, :body_part_id,:description)
    end 
end
