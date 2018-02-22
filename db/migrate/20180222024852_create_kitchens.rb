class CreateKitchens < ActiveRecord::Migration[5.1]
  def change
    create_table :kitchens do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :picture, default: "http://res.cloudinary.com/arnauddlc/image/upload/o_55/v1519290830/kitchen_std.webp"
      t.integer :price

      t.timestamps
    end
  end
end
