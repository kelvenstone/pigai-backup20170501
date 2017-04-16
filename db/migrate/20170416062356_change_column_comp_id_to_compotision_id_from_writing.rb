class ChangeColumnCompIdToCompotisionIdFromWriting < ActiveRecord::Migration[5.0]
  def change
    rename_column :writings, :comp_id, :composition_id
  end
end
