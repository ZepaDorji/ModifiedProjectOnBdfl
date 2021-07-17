class Product < ApplicationRecord
    has_many :category_products
    has_many :categories, through: :category_products 
    validates :name, presence: true, length:{ minimum: 4 } 
    validates :price, presence: true
    validates :description, presence: true
end
