class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body, limit: 65535, null: false
      t.references :board, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
