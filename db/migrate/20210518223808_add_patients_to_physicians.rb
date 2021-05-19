class AddPatientsToPhysicians < ActiveRecord::Migration[6.1]
  def change
    create_table :patient_physicians do |t|
      t.references :patient
      t.references :physician
      t.timestamps
    end
  end
end
