class AddGroupRefToSubjects < ActiveRecord::Migration[6.0]
  def change
    add_reference :subjects, :group, foreign_key: true
  end
end
