class BoardsController < ActionController::Base
    
  layout 'application'

    def index
       @boards = Board.all
    end

    def show
       @board = Board.find(params[:id])
       @cards = @board.cards
    end

    def new
      @board = Board.new
    end

    def create
      @board = current_user.boards.build(board_params)
      if @board.save
          redirect_to root_path, notice: '保存できました'
      else
          flash.now[:error] = '保存に失敗しました'
          render :new
      end
    end

    def edit
      @board = current_user.boards.find(params[:id])
    end

    def update
      @board = current_user.boards.find(params[:id])
      if @board.update(board_params)
          redirect_to root_path, notice: '更新できました'
      else
          flash.now[:error] = '更新できませんでした'
          render :edit
      end
    end

    def destroy
      board = current_user.boards.find(params[:id])
      board.destroy!
      redirect_to root_path, notice:'削除に成功しました'
    end



    private
    def board_params
        params.require(:board).permit(:name, :description)
    end

end