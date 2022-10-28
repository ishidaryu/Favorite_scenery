class CreateSceneries < ActiveRecord::Migration[6.1]
  def change
    create_table :sceneries do |t|
      t.integer :genre_id, null: true
      t.string :name, null: false
      t.string :introduction, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
