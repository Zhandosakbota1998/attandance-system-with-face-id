class AddLessonToStudents < ActiveRecord::Migration[6.0]
  def change
    add_reference :students, :lesson, null: true, foreign_key: true
  end
end
