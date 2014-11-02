class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :cuisine_type
      t.string :address
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
