class BestBuyService
  def self.get_stores(zip_code)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip_code},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=100&apiKey=#{ENV['best_buy_api_key']}")
    result = JSON.parse(response.body, symbolize_names: true)
    result[:stores].map {|store| Store.new(store)}
  end
end