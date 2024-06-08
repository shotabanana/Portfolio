class AddAgeToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :age, :string
  end
end
