require 'spec_helper'

describe Chapter do
  it { should have_many :sections }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :number }
  it { should validate_uniqueness_of :number }
  it { should validate_numericality_of :number}

  context ".unselected_chapters" do
    it "should return all chapters except the one selected" do
      easy = Chapter.create(name: "Easy", number: "1")
      hard = Chapter.create(name: "Hard", number: "2")
      section = Section.create(name: "Section", chapter_id: easy.id)
      Chapter.unselected_chapters(section).should eq [hard]
    end
  end
end
