class ChangeColumnToGroups < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :groups do |t|
        dir.up   { t.change :name, null: false, unique: true }
        dir.down { t.change :name, null: false, unique: true }
      end
    end
  end
end
