class AppointmentsController < ApplicationController

  include ActionController::MimeResponds
  include ActionController::Helpers
  include ActionController::Cookies
  include ActionController::ImplicitRender

  #===== command ========================
  # # curl -XGET  http://localhost:3000/appointments.json
  def index
    @appointments = Appointment.all
    respond_to do |format|
      format.xml { render :xml => @appointments }
      format.json { render :json => @appointments }
    end
  end

  # curl -X POST -d 'appointment[patient_id]=1&appointment[doctor_id]=1&appointment[diseases]=test&' 	    http://localhost:3000/appointments.json
  def create
    @appointment = Appointment.new(params[:appointment])

    if @appointment.save
      response_message = {:message => "Appointment was created successfully."}
    else
      response_message = {:message => "Appointment creation failed. Please try again!"}
    end

    respond_to do |format|
      format.xml  { render :xml => response_message }
      format.json { render :json => response_message }
    end

  end

end
