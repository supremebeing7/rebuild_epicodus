class Section < ActiveRecord::Base
  has_many :lessons
  validates :name, :number, presence: true, uniqueness: true
  validates_numericality_of :number
end
