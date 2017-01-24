class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :version
      t.string :link
      t.string :category

      t.timestamps null: false
    end
  end
end
