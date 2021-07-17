class Category < ApplicationRecord
  belongs_to :user
  has_many :category_products
  has_many :products, through: :category_products 
  validates :name, presence: true, length:{ minimum: 4 } 
end
