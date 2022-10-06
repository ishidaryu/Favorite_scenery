class CreateSceneryComments < ActiveRecord::Migration[6.1]
  def change
    create_table :scenery_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :scenery_id
      t.timestamps
    end
  end
end
