class CreateLessonsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :student_id
      t.integer :subject_id
    end
  end
end
