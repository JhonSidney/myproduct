class Product < ApplicationRecord
    validates :category, :name, :description, :price, :stock, presence: true
end
