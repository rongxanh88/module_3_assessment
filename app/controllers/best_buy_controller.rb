class BestBuyController < ApplicationController
  def home
  end

  def search
    response = BestBuyService.get_stores(params[:zip_code])
    result = JSON.parse(response.body, symbolize_names: true)
    @stores = result[:stores].map {|store| Store.new(store)}
    # binding.pry
    # "hello"
  end
end