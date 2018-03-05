class Person < ApplicationRecord
   #validates :email, format: { with: /@/ }, uniqueness: { case_sensitive: false }

   validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

   belongs_to :country
   belongs_to :state
end
