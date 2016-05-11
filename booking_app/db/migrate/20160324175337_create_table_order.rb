class CreateTableOrder < ActiveRecord::Migration
  def change
    create_table :table_orders do |t|
    	t.references :room
    	t.datetime :start_time
    	t.datetime :end_time
    end
  end
end
