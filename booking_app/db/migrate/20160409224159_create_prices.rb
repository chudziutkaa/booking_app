class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
    	t.references :hotel
    	t.string :name
    	t.decimal :price
    end
  end
end
