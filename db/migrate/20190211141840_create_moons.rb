class CreateMoons < ActiveRecord::Migration[5.2]
  def change
    create_table :moons do |t|
      t.string :name
      t.integer :user_id
      t.integer :planet_id
      t.string :img_url
      t.string :size
      t.string :distance
      t.string :year_discovery
      t.timestamps
    end
  end
end
