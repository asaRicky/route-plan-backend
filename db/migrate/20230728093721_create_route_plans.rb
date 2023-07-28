class CreateRoutePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :route_plans do |t|
      t.references :merchandiser, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
