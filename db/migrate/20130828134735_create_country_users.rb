class CreateCountryUsers < ActiveRecord::Migration
  def self.up
    create_table :country_users do |t|
      t.string :country_code , :null => false
      t.integer :user_id , :null => false
      t.datetime :visited_at 
    end
    add_index :country_users, [:country_code, :user_id] , :unique => true
  end

  def self.down
    drop_table :country_users
  end
end
