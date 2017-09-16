GGclass CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.integer :group_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end