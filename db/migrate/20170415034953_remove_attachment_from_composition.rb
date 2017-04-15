class RemoveAttachmentFromComposition < ActiveRecord::Migration[5.0]
  def change
    remove_column :compositions, :attachment
  end
end
