class BookmarksController < ApplicationController
  def create
    board = Board.find(params[:board_id])
    current_user.bookmark(board)
    redirect_to boards_path, success: t('defaults.message.bookmarked', item: Bookmark.model_name.human)
  end

  def destroy
    board = current_user.bookmarks.find(params[:id]).board
    current_user.unbookmark(board)
    redirect_to boards_path, success: t('defaults.message.unbookmarked', item: Bookmark.model_name.human)
  end
end
