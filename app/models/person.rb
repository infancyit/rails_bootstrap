class Person < ApplicationRecord
  # validates_presence_of :first_name
  # validates_presence_of :last_name
  # validates_presence_of :email
  # validates_presence_of :email
  # validates_presence_of :country_field
  # validates_presence_of :state_field
  #
   belongs_to :country
   belongs_to :state
end
