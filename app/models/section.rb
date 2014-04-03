class Section < ActiveRecord::Base
  has_many :lessons
  belongs_to :chapter
  validates :name, :number, presence: true, uniqueness: true
  validates_numericality_of :number

  extend FriendlyId
  friendly_id :name

  def self.unselected_sections(lesson)
    Section.where('id != ?', lesson.section_id)
  end
end
