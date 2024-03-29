class DoctorsController < ApplicationController
  
  include ActionController::MimeResponds
  include ActionController::Helpers
  include ActionController::Cookies
  include ActionController::ImplicitRender

  # curl -XGET http://localhost:3000/doctors.json
  def index
    @doctors = Doctor.all
    respond_to do |format|
      format.xml { render :xml => @doctors }
      format.json { render :json => @doctors }
    end
  end

  # curl -X POST -d 'doctor[name]=testdoctor&doctor[phone_number]=999999&doctor[specialization]=testsp' http://localhost:3000/doctors.json
  def create
    @doctor = Doctor.new(params[:doctor])

    if @doctor.save
      response_message = {:message => "Doctor created successfully."}
    else
      response_message = {:message => "Doctor creation failed. Please try again!"}
    end

    respond_to do |format|
      format.xml  { render :xml => response_message }
      format.json { render :json => response_message }
    end
  end
end
