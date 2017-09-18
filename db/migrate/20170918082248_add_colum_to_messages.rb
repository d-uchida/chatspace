class AddColumToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :body, :text, null: false, after: :id
    add_column :messages, :image, :string, after: :body
  end
end
