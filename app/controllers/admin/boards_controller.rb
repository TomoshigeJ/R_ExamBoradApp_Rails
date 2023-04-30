class Admin::BoardsController < Admin::BaseController
  before_action :set_board, only: %i[edit update destroy]

  def index
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true).includes([:user, :bookmarks]).order(created_at: :desc).page(params[:page])
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end
  
  def set_board
    @board = Boards.find(params[:id])
  end

end
