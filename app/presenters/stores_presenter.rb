class StoresPresenter
  attr_reader :total_stores, :stores, :response
  def initialize(json_response)
    @response = json_response
    @total_stores = json_response[:total]
    @stores = []
    add_stores
  end

  def add_stores
    json_stores = response[:stores]
    json_stores.each do |store|
      @stores << Store.new(store)
    end
  end
end