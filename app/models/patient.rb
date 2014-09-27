class Patient < ActiveRecord::Base
  attr_accessible :name, :phone_number

  #==================== Associations ================================
  has_many :appointments
  has_many :doctors, :through => :appointments
end
