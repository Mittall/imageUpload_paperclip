json.set! :files do
  json.array! [@product] do |product|
    json.name product.avatar_file_name 
    json.size product.avatar_file_size
    json.url product.avatar.url(:original)
    json.delete_url product_path(@product)
    json.delete_type "DELETE"
  end
end 
