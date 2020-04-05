class AddSubjectRefToLessons < ActiveRecord::Migration[6.0]
  def change
    add_reference :lessons, :subject, foreign_key: true
  end
end
