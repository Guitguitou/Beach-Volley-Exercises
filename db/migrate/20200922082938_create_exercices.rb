class CreateExercices < ActiveRecord::Migration[6.0]
  def change
    create_table :exercices do |t|
      t.string :nom
      t.text :description
      t.string :worked
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
