class AddMoreColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :is_female, :boolean, defalut:false
    add_column :users, :qq_number, :string
    add_column :users, :phone_number, :string
    add_column :users, :school, :string
  end
end
