class CreateHabrausers < ActiveRecord::Migration
  def self.up
    create_table :habrausers do |t|
      t.string :slug
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :habrausers
  end
end
