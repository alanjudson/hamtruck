class AddFieldsToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :payment_options, :string
    add_column :trucks, :description, :text
    add_column :trucks, :price_range, :string
  end
end
