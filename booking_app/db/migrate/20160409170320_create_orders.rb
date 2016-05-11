class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.references :room
    	t.datetime :start_time
    	t.datetime :end_time
    end
  end
end
