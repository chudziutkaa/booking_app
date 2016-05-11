class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
    	t.references :hotel
    end
  end
end
