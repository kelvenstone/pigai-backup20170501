class ChangeGradeFromIntToString < ActiveRecord::Migration[5.0]
  def change
    change_column :compositions, :grade, :string
  end
end
