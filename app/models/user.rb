class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_boards, through: :bookmarks, source: :board
  
  validates :password, length: {minimum: 3}, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true, length: {maximum: 255}
  validates :last_name, presence: true, length: {maximum: 255}

  def own?(object)
    id == object.user_id
  end

  def bookmark(board)
    bookmark_boards<<board
  end

  def unbookmark(board)
    bookmark_boards.destroy(board)
  end

  def bookmark?(board)
    # bookmark_boards.include?(board)
    # userを起点にbookmark_boardsを取りに行く(N+1問題)
    board.bookmarks.pluck(:user_id).include?(id)
    # これならboardを起点に検索をかけにいくのでN+1が起きない。(らしい)
    # .pluck(:user_id).include?(id)がポイント

  end

end