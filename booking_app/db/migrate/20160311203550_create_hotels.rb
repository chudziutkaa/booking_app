class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
    	t.string :name
    	t.string :standard
    	t.text :description
    	t.string :location
    end
  end
end
