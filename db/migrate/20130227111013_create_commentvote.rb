class CreateCommentvote < ActiveRecord::Migration
  def change
    create_table :commentvotes do |t|
      t.integer :user_id, :null => false
      t.integer :comment_id, :null => false
      t.timestamps
    end
  end
end
