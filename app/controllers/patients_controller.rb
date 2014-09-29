class PatientsController < ApplicationController

  include ActionController::MimeResponds
  include ActionController::Helpers
  include ActionController::Cookies
  include ActionController::ImplicitRender

  # curl -XGET  http://localhost:3000/patients.json
  def index
    @patient = Patient.new
    @doctor = Doctor.new
    @appointment = Appointment.new
    @appointments = Appointment.all

    #render json: @patients, status: :ok
    respond_to do |format|
      format.xml { render :xml => @patients }
      format.json { render :json => @patients }
    end

  end
  
  # curl -X POST -d 'patient[name]=anil&patient[phone_number]=999999' http://localhost:3000/patients.json
  def create
    @patient = Patient.new(params[:patient])
    @appointment = Appointment.new
    if @patient.save
      response_message = {:message => "Patient created successfully."}
    else
      response_message = {:message => "Patient creation failed. Please try again!"}
    end
    respond_to do |format|
      format.xml  { render :xml => response_message }
      format.json { render :json => response_message }
    end
  end

end
