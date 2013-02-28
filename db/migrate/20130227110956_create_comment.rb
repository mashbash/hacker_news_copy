class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, :null => false
      t.integer :post_id, :null => false
      t.text :content, :null => false
      t.integer :commentvote_count, :default => 0
      t.timestamps
    end
  end
end
