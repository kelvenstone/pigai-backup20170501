class AddUserIdToComposition < ActiveRecord::Migration[5.0]
  def change
    add_column :compositions, :user_id, :integer
  end
end
