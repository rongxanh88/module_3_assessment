class Api::V1::ItemsController <  ActionController::Base
  protect_from_forgery with: :null_session

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.create(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render status: 204, json: {}
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end
end