class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :null => false
      t.text :content, :null => false
      t.integer :user_id, :null => false
      t.integer :postvote_count, :default => 0
      t.timestamps
    end
  end
end
