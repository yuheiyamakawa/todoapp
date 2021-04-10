class CardsController < ActionController::Base

layout 'application'

    def index
        @cards = Card.all
    end

    def show
    end

    def new
     @card = Card.new
    end

    def create
        board = Board.find(params[:board_id])
        @card = board.cards.build(card_params)
        if @card.save
            redirect_to board_path(board)
        else
            flash.now[:error] = '保存に失敗しました'
            render :new
        end
    end

    def destroy
        board = Board.find(params[:id])
        card = Card.find(params[:board_id])
        card.destroy!
        redirect_to board_path(board)
    end

    def edit
        @card = Card.find(params[:board_id])
    end

    def update
        board = Board.find(params[:id])
        @card = Card.find(params[:board_id])
        if @card.update(card_params)
            redirect_to board_path(board), notice: '更新できました'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit
        end
    end



    private
    def card_params
        params.require(:card).permit(:name, :description)
    end

end