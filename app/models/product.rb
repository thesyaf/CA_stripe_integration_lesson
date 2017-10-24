class Product < ApplicationRecord
  has_one :cart

  include ImageUploader[:image]

end
