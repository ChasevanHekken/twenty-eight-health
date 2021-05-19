class AddProductsToPatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patient_products do |t|
      t.references :patient
      t.references :product
      t.timestamps
    end
  end
end
