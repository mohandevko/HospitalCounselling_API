class Doctor < ActiveRecord::Base
  attr_accessible :name, :phone_number, :specialization

  #================ Associations ===============================
  has_many :appointments
  has_many :patients, :through => :appointments
end
