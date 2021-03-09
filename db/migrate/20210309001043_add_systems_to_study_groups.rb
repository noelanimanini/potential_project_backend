class AddSystemsToStudyGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :study_groups, :system, :string
  end
end
