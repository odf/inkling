class CreateInklingTables < ActiveRecord::Migration
  def self.up
    create_table :inkling_users do |t|
      t.database_authenticatable
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      t.timestamps
      t.timestamps
    end
    
    create_table :inkling_roles do |t|
      t.string :name, :null => false
      t.timestamps
    end
    
    create_table :inkling_role_memberships do |t|
      t.integer :user_id, :null => false
      t.integer :role_id, :null => false
    end
    
    create_table :inkling_paths do |t|
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.string :slug, :null => false
      t.references :content, :polymorphic => true
      t.timestamps
    end    
    
    create_table :inkling_types do |t|
      t.string :klass_name
      t.timestamps
    end    
    
    create_table :inkling_can_can_actions do |t|
      t.string :name
      t.timestamps
    end    
    
    create_table :inkling_permissions do |t|
      t.integer :type_id
      t.integer :role_id, :null => false
      t.integer :can_can_action_id
      t.timestamps
    end    

    create_table :inkling_themes do |t|
      t.string :name, :null => false
      t.text :body
      t.string :extension, :null => false, :default => ".html.erb"
      t.timestamps
    end    

    create_table :inkling_logs do |t|
      t.timestamp :created_at, :null => false
      t.text :text, :null => false
      t.string :category, :null => false
      t.integer :user_id
    end    

    create_table :inkling_feeds do |t|
      t.timestamp :created_at, :null => false
      t.integer :user_id, :null => false  # Who created the feed
      t.string :title, :null => false     # Name of the feed
      t.string :format, :null => false    # Delivery mechanism (Atom, RSS2, Email, etc)
      t.string :source, :null => false    # Class name which implements the methods of Inkling::FeedSource
      t.string :criteria                  # A string that gets passed to the FeedSource
    end    

    create_table :inkling_feed_roles do |t|
      t.timestamp :created_at, :null => false
      t.string :title, :null => false
      t.integer :feed_id, :null => false
      t.integer :role_id, :null => false
    end    

  end

  def self.down
    drop_table :inkling_feed_roles
    drop_table :inkling_feeds
    drop_table :inkling_paths
    drop_table :inkling_can_can_actions
    drop_table :inkling_types    
    drop_table :inkling_permissions
    drop_table :inkling_role_memberhips    
    drop_table :inkling_roles
    drop_table :inkling_users
  end
end
