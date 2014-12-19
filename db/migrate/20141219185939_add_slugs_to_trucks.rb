class AddSlugsToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :slug, :string
    add_index :trucks, :slug, unique: true
  end
end
