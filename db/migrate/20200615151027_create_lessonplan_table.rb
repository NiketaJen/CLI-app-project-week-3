class CreateLessonplanTable < ActiveRecord::Migration[5.2]
  def change
    create_table(:lessonplan) do |t|
      t.string(:student)
      t.string(:subject)
  end
end
