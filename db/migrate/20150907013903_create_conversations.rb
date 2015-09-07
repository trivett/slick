class CreateConversations < ActiveRecord::Migration
  def change
    drop_table :conversations
    create_table :conversations do |t|
      t.string :name
    end
  end
end
