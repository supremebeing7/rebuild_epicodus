class Lesson < ActiveRecord::Base
  validates :name, :number, :presence => true, :uniqueness => true
  validates_numericality_of :number
  belongs_to :section
  # default_scope :order => 'number ASC'

  extend FriendlyId
  friendly_id :name

  def next
    found = 0
    (1..Lesson.all.order(:number).last.number.to_i).detect do |num|
     found = Lesson.find_by(:number => (self.number.to_i + num).to_s)
    end
    found
  end

  def previous
    found_num = nil
    if self.number != Lesson.all.order(:number).first.number
      num = 1
      until found_num != nil
        found_num = Lesson.find_by(:number => (self.number.to_i - num).to_s)
        num += 1
      end
    end
    found_num
  end
end
