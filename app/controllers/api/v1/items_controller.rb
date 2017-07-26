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

  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end
end