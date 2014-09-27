class Appointment < ActiveRecord::Base
  attr_accessible :doctor_id, :patient_id, :diseases
  #================ Associations ================================
  belongs_to :doctor
  belongs_to :patient
end
