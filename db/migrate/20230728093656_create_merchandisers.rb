class CreateMerchandisers < ActiveRecord::Migration[7.0]
  def change
    create_table :merchandisers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :contact_number
      t.timestamps
    end
  end
end
