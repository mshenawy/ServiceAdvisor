class AddServiceIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :service_id, :integer
  end
end
