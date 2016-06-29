class AddOwnerToHotel < ActiveRecord::Migration
  def change
    add_reference :hotels, :owner, references: :users, index: true
    add_foreign_key :hotels, :users, column: :owner_id
  end
end
