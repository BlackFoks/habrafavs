class AddUserIdToHabrauser < ActiveRecord::Migration
  def self.up
    add_column :habrausers, :user_id, :integer
  end

  def self.down
    remove_column :habrausers, :user_id
  end
end
