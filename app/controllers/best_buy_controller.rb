class BestBuyController < ApplicationController
  def home

  end

  def search
    zip_code = params[:zip_code]
    response = BestBuyService.get_stores(zip_code)
    result = JSON.parse(response.body, symbolize_names: true)
    @presenter = StoresPresenter.new(result)
  end
end