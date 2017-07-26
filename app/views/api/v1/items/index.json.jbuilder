json.items @items do |item|
  json.name item.name
  json.description item.description
  json.image_url url_for(item.image_url, format: :json)
end