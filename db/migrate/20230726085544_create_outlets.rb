class CreateOutlets < ActiveRecord::Migration[7.0]
  def change
    create_table :outlets do |t|
      t.string :name
      t.string :address
      t.float :location
      t.timestamps
    end
  end
end
