class PatientsController < ApplicationController
  def index
    @patient = Patient.new
    @doctor = Doctor.new
    @appointment = Appointment.new
    @appointments = Appointment.all
  end

  def create
    @patient = Patient.new(params[:patient])
    @appointment = Appointment.new
    @patient.save
    render
  end

end
