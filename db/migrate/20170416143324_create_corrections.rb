class CreateCorrections < ActiveRecord::Migration[5.0]
  def change
    create_table :corrections do |t|
      t.integer :user_id
      t.integer :writing_id
      t.text :content

      t.timestamps
    end
  end
end
