require 'spec_helper'

describe Section do
  it { should have_many :lessons }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :number }
  it { should validate_uniqueness_of :number }
  it { should validate_numericality_of :number}

  context ".unselected_sections" do
    it "should return all sections except the one selected" do
      easy = Section.create(name: "Easy", number: "1")
      hard = Section.create(name: "Hard", number: "2")
      lesson = Lesson.create(name: "Lesson", section_id: easy.id)
      Section.unselected_sections(lesson).should eq [hard]
    end
  end
end
