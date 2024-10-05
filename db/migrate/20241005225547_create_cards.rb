class CreateCards < ActiveRecord::Migration[8.0]
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.belongs_to :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
