class CreateMatrimonies < ActiveRecord::Migration[6.1]
  def change
    create_table :matrimonies do |t|
      t.string :name
      t.integer :age
      t.integer :spa
      t.text :main_image
      t.text :thumb_image

      t.timestamps
    end
  end
end
