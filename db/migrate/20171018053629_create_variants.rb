class CreateVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :variants do |t|
      t.references :product, foreign_key: true
      t.integer :waist
      t.integer :length
      t.string :style
      t.integer :count

      t.timestamps
    end
  end
end
