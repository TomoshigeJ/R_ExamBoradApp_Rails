class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :title, limit: 255, null: false
      t.text :body, limit: 65535, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end