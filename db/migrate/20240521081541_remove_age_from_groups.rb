class RemoveAgeFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :age, :integer
  end
end
