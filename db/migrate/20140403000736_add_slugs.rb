class AddSlugs < ActiveRecord::Migration
  def change
    add_column :chapters, :slug, :varchar
    add_column :sections, :slug, :varchar
    add_column :lessons, :slug, :varchar
  end
end
