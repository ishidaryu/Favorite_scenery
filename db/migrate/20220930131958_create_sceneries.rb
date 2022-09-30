class CreateSceneries < ActiveRecord::Migration[6.1]
  def change
    create_table :sceneries do |t|
      t.string "title"
      t.string "body"      
      t.timestamps
    end
  end
end
