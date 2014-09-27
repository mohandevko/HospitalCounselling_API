class AppointmentsController < ApplicationController

  def create
    @appointment = Appointment.new(params[:appointment])
    @appointments = Appointment.all
    @appointment.save
  end

end
