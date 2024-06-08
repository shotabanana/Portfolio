class AddTimeToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :time, :datetime
  end
end
