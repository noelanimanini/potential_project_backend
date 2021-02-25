class CreateUserStudyGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :user_study_groups do |t|
      t.integer :study_group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
