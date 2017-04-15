class AddColumnComTitleToComposition < ActiveRecord::Migration[5.0]
  def change
    add_column :compositions, :com_title, :string
  end
end
