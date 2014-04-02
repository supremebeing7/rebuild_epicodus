class Section < ActiveRecord::Base
  has_many :lessons
  validates :name, :number, presence: true, uniqueness: true
  validates_numericality_of :number

  def to_param
    "#{id}-#{name}"
  end

  def self.unselected_sections(lesson)
    Section.where('id != ?', lesson.section_id)
  end
end
