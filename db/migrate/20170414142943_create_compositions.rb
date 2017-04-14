class CreateCompositions < ActiveRecord::Migration[5.0]
  def change
    create_table :compositions do |t|
      t.integer :grade
      t.text :content

      t.timestamps
    end
  end
end
