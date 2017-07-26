class BestBuyController < ApplicationController
  def home

  end

  def search
    # zip_code = params[:zip_code]
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,name&pageSize=10&apiKey=tq72hpvtbbd4mue6f23kmsw2")
    result = JSON.parse(response.body, symbolize_names: true)
    @presenter = StorePresenter.new(result)
    binding.pry
  end
end
