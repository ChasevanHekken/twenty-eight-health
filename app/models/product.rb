class Product < ApplicationRecord
  belongs_to :category, dependent: :destroy

  has_many :patient_products
  has_many :patients, through: :patient_products

  def name_and_price
    "#{name}, $#{price}.00"
  end
end
