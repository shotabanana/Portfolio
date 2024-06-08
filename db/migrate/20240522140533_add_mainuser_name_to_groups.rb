class AddMainuserNameToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :mainuser_name, :string
  end
end
