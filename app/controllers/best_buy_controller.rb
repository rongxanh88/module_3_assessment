class BestBuyController < ApplicationController
  require 'will_paginate/array'
  
  def home
  end

  def search
    @stores = BestBuyService.get_stores(params[:zip_code])
                            .paginate(:page => params[:page], :per_page => 10)
  end
end