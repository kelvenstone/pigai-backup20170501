class AddAttachmentToComposition < ActiveRecord::Migration[5.0]
  def change
    add_column :compositions, :attachment, :string

  end
end
