class Lesson < ActiveRecord::Base
  validates :name, :number, :presence => true, :uniqueness => true
end
