class Api::V1::ItemsController <  ApiBaseController
  before_action :set_item, only: [:show, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def create
    @item = Item.create(item_params)
  end

  def destroy
    @item.destroy
    render status: 204, json: {}
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end

    def set_item
      @item = Item.find(params[:id])
    end
end