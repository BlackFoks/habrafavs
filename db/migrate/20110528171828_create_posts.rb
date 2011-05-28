class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :blog_id
      t.string :title
      t.string :content
      t.integer :total_votes
      t.integer :habrauser_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
