class CreateGuides < ActiveRecord::Migration[6.1]
  def change
    create_table :guides do |t|
      t.string :tittle
      t.text :body

      t.timestamps
    end
  end
end
