class CreateLists < ActiveRecord::Migration[8.0]
  def change
    create_table :lists do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
