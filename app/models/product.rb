class Product < ApplicationRecord

  include ImageUploader[:image]

  has_many :order_items

  default_scope { where(active: true) }
end
