class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.references :hotel
    	t.text :content
    	t.string :author
    end
  end
end
