class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :number
      t.string :name
      t.string :content
      t.integer :section_id
    end
  end
end
