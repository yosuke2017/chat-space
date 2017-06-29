class ChangeColumnnToGroups < ActiveRecord::Migration[5.0]
  def change
    change_column :groups, :name, :string, unique: true, null: false, default: 0
  end
end
