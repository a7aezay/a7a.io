class CreateThoughts < ActiveRecord::Migration[5.2]
  def change
    create_table :thoughts do |t|
      t.text :head
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :thoughts, [:user_id, :created_at]
  end
end
