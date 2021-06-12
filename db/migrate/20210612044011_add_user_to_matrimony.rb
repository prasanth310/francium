class AddUserToMatrimony < ActiveRecord::Migration[6.1]
  def change
    add_reference :matrimonies, :user, null: false, foreign_key: true
  end
end
