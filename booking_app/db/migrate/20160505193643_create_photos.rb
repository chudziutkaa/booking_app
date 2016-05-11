class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.references :gallery
    	t.string :image
    	t.attachment :image
    end
  end
end
