class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.string :image
      t.references :group , foreign_key: 'group_id' , null: false
      t.references :user , foreign_key: 'user_id' , null: false
      t.timestamps
    end
  end
end
