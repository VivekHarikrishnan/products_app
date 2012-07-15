class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :model
      t.string :make
      t.decimal :price

      t.timestamps
    end
  end
end
