class Student < ActiveRecord::Base
  validates :name, :presence => true
  validates :bio, length: { minimum: 5 }
end
