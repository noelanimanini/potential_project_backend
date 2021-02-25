class UserStudyGroupsController < ApplicationController
    def destroy
        user_study_groupId = @user_study_group.id
        @user_study_group.destroy
        render json: {message: 'you have left this study group!', user_study_groupId: user_study_groupId}
    end 
end
