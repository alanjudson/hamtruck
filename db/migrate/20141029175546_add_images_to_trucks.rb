class AddImagesToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :image_file_name, :string
  end
end
