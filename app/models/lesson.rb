class Lesson < ActiveRecord::Base
  validates :name, :number, :presence => true, :uniqueness => true
  validates_numericality_of :number
  belongs_to :section

  def next
    num = 1
    found_num = nil
    until found_num != nil || num == Lesson.all.last.number
      found_num = Lesson.find_by(:number => (self.number.to_i + num).to_s)
      num += 1
    end
    found_num
  end
end
