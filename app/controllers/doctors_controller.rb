class DoctorsController < ApplicationController
  def create
    @doctor = Doctor.new(params[:doctor])
    @appointment = Appointment.new
    @doctor.save
    render
  end
end
