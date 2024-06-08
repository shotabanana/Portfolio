class AddMainuserIdToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :mainuser_id, :integer
  end
end
