class CreateKitchens < ActiveRecord::Migration[5.1]
  def change
    create_table :kitchens do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :picture
      t.integer :price

      t.timestamps
    end
  end
end
