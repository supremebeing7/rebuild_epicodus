class Lesson < ActiveRecord::Base
  validates :name, :number, :presence => true, :uniqueness => true
  validates_numericality_of :number
  belongs_to :section

  def next
    found_num = nil
    if self.number != Lesson.all.order(:number).last.number
      num = 1
      until found_num != nil
        found_num = Lesson.find_by(:number => (self.number.to_i + num).to_s)
        num += 1
      end
    end
    found_num
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
