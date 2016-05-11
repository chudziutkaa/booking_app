class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
    	t.integer :number
    	t.references :hotel
    end
  end
end
