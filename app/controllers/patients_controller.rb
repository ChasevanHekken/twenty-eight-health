class PatientsController < ApplicationController

  def new
    @states = State.all.map { |s| {name: s.name, code: s.code, minimum_age: s.minimum_age, active: s.active } }
    @all_states = State.all.map { |s| [ s.name, s.id ] }
    @products = Product.all.map { |s| [ s.name, s.id ] }
    @patient = Patient.new
  end

  def create
    @patient = Patient.create!(
      full_name: params['patient']['full_name'],
      date_of_birth: params['patient']['date_of_birth'],
      email: params['patient']['email'],
      state: State.find(params['patient']['state']).code
    )

    if @patient.save
      @patient.assign_product(params['patient']['product'])
      @patient.get_physician
      redirect_to @patient
    else
      render :new
    end
  rescue StandardError => e
    Rails.logger.info("Exception in patients create #{e.message}")
  end

  def show
    @patient = Patient.find(params[:id])
  end

end
