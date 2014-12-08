class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :truck, index: true
      t.references :cuisine_type, index: true

      t.timestamps
    end
  end
end
