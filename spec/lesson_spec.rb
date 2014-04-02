require 'spec_helper'

describe Lesson do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_uniqueness_of :number }
  it { should validate_presence_of :number }
  it { should validate_numericality_of :number}
  it { should belong_to :section }
end
