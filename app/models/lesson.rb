class Lesson < ActiveRecord::Base
  validates :name, :number, :presence => true, :uniqueness => true
  validates_numericality_of :number
  belongs_to :section
end
