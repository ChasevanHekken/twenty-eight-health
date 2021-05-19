class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_table :products do |t|
      t.string :name
      t.string :ndc
      t.integer :quantity
      t.integer :price
      t.string :instructions
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
