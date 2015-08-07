class AddProjectDescriptionColumnToOpening < ActiveRecord::Migration
  def change
    add_column :openings, :project_description, :string
  end
end
