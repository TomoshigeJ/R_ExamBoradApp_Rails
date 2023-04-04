class AddUniqueIndexToBookmarks < ActiveRecord::Migration[5.2]
  def change
    add_index :bookmarks, [:user_id, :board_id], unique: true
  end
end
