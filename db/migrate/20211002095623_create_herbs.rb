class CreateHerbs < ActiveRecord::Migration[5.2]
  def change
    create_table :herbs do |t|
      t.string :herb_name
      t.string :herb_image_id
      t.string :department_name
      t.text :caption

      t.timestamps
    end
  end
end
