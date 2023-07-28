class CreateCheckIns < ActiveRecord::Migration[7.0]
  def change
    create_table :check_ins do |t|
      t.references :merchandiser, null: false, foreign_key: true
      t.references :outlet, null: false, foreign_key: true
      t.datetime :check_in_timestamp
      
      t.timestamps
    end
  end
end
