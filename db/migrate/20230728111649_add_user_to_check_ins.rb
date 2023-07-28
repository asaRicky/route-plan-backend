class AddUserToCheckIns < ActiveRecord::Migration[7.0]
  def change
    add_reference :check_ins, :user, null: false, foreign_key: true
  end
end
