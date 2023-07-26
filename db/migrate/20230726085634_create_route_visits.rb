class CreateRouteVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :route_visits do |t|
      t.integer :outlet_id
      t.integer :user_id
      
      t.timestamps
    end
  end
end
