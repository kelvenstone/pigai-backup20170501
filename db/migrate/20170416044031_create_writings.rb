class CreateWritings < ActiveRecord::Migration[5.0]
  def change
    create_table :writings do |t|
      t.integer :user_id
      t.integer :comp_id
      t.text :content

      t.timestamps
    end
  end
end
