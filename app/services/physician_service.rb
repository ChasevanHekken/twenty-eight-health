require 'faraday'

class PhysicianService
  URL = "https://challenge-28h.herokuapp.com/doctors/assign".freeze

  HEADERS = {
    "Content-Type" => "application/json"
  }

  def initialize(patient)
    @patient = patient
  end

  def get_physician
    response = Faraday.post(URL, @patient.physician_request_params, HEADERS)
    response_body = JSON.parse(response.body)
    physician = create_physician(response_body)
    assign_physician(physician)
  end

  private

  def create_physician(physician)
    Physician.create!(name: physician['details']['doctor'], token: physician['details']['token'])
  end

  def assign_physician(physician)
    PatientPhysician.create!(patient_id: @patient.id, physician_id: physician.id)
  end
end