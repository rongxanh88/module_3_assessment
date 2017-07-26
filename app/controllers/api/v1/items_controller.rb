class Api::V1::ItemsController <  ActionController::Base
  protect_from_forgery with: :null_session

  def index
    @items = Item.all
    render json: @items
  end

  def show

  end

  def create

  end

  def destroy

  end
end