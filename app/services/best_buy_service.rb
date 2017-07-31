class BestBuyService
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def self.get_stores(zip_code)
    service = BestBuyService.new(zip_code)
    Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip_code},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=10&apiKey=#{ENV['best_buy_api_key']}")
  end

  # def response
  #   connection.get("/stores(area(#{zip_code},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=10&apiKey=#{ENV['best_buy_api_key']}")
  # end

  private
    attr_reader :zip_code
end