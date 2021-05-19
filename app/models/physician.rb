class Physician < ApplicationRecord
  has_many :patient_physicians
  has_many :patients, through: :patient_physicians
end