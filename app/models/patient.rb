class Patient < ApplicationRecord
  has_many :patient_physicians
  has_many :physicians, through: :patient_physicians

  has_many :patient_products
  has_many :products, through: :patient_products

  def physician_request_params
    {
      "name": full_name,
      "email": email,
      "date_of_birth": date_of_birth,
      "state": state
    }.to_json
  end

  def get_physician
    physician_service = PhysicianService.new(self)
    physician_service.get_physician
  end

  def assign_product(product_id)
    self.products << Product.find(product_id)
  end
end