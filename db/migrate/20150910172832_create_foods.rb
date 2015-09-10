class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :image_url
      t.text :text

      t.timestamps null: false
    end
  end
end
