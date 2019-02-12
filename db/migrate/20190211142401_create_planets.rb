class CreatePlanets < ActiveRecord::Migration[5.2]
  def change
    create_table :planets do |t|
      t.string :name
      t.integer :size
      t.string :img_url
      t.integer :moon_count

      t.timestamps
    end
  end
end
