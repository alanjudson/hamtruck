class AddExtraImageFieldsToTrucks < ActiveRecord::Migration
  def change
  	add_column :trucks, :image_content_type, :string
  	add_column :trucks, :image_file_size, :integer
  	add_column :trucks, :image_updated_at, :datetime
  end
end
