json.array!(@products) do |product|
  json.extract! product, :id, :name, :avatar, :resume
  json.url product_url(product, format: :json)
end
