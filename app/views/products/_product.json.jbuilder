json.extract! product, :id, :category, :name, :description, :price, :stock, :created_at, :updated_at
json.url product_url(product, format: :json)
