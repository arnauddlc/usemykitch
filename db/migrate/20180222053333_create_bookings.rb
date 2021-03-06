class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :total_price
      t.string :status, default: "pending"
      t.references :user, foreign_key: true
      t.references :kitchen, foreign_key: true

      t.timestamps
    end
  end
end
