class AddSkillToProjects < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :skill, foreign_key: true
  end
end
