class Api::V1::ItemsController <  ActionController::Base
  protect_from_forgery with: :null_session

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create

  end

  def destroy

  end
end