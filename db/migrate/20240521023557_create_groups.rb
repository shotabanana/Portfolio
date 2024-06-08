class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :place_id
      t.integer :people
      t.integer :age
      t.string :theatre
      t.string :sex
      t.string :movie
      t.text :memo

      t.timestamps
    end
  end
end
