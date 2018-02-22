class AddReferenceToKitchens < ActiveRecord::Migration[5.1]
  def change
    add_reference :kitchens, :user, index: true
  end
end

