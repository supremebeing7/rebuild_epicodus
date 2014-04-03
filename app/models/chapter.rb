class Chapter < ActiveRecord::Base
  has_many :sections
  validates :name, :number, presence: true, uniqueness: true
  validates_numericality_of :number

  def self.unselected_chapters(section)
    Chapter.where('id != ?', section.chapter_id)
  end
end
