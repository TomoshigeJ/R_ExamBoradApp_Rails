class BoardsController < ApplicationController
  before_action :set_board, only: %i[edit update destroy]
  def index
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true).includes([:user, :bookmarks]).order(created_at: :desc).page(params[:page])
    # @boards = Board.all.includes([:user, :bookmarks]).order(created_at: :desc).page(params[:page])
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, success: t('defaults.message.created', item: Board.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Board.model_name.human)
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    @comments = @board.comments.includes(:user).order(crated_at: :desc)
  end

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board), success: t('defaults.message.updated', item: Board.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Board.model_name.human)
      render :edit
    end
  end

  def destroy
    @board.destroy!
    redirect_to boards_path, success: t('defaults.message.delete', item: Board.model_name.human)
  end

  def bookmarks
    @q = current_user.bookmark_boards.ransack(params[:q])
    @bookmark_boards = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end
  
  def set_board
    @board = current_user.boards.find(params[:id])
  end

end