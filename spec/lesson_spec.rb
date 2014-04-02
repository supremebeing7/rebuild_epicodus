require 'spec_helper'

describe Lesson do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_uniqueness_of :number }
  it { should validate_presence_of :number }
  it { should validate_numericality_of :number}
  it { should belong_to :section }

  context '#next' do
    it 'returns the lesson with the next highest number from the current lesson.' do
      current_lesson = Lesson.create({name: 'lesson1', number: 1})
      next_lesson = Lesson.create({name: 'lesson3', number: 3})
      current_lesson.next.should eq  next_lesson
    end
  end
end
