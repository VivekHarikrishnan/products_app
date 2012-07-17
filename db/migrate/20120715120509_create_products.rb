class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :type
      t.integer :item_id

      t.timestamps
    end
  end
end
