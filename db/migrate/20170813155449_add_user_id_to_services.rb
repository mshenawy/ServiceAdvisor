class AddUserIdToServices < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :user_id, :integer
  end
end
