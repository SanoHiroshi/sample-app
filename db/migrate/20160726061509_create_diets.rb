class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|

      t.float :weight
      t.float :height
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
      add_index :diets, [:user_id, :created_at]
  end
end
