class CreateSubjectsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :topic
      t.string :level_of_difficulty
    end
  end
end
