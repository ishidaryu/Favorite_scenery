class CreateSceneries < ActiveRecord::Migration[6.1]
  def change
    create_table :sceneries do |t|
      t.string "name"
      t.string "introduction"      
      t.timestamps
    end
  end
end
