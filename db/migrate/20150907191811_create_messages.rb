class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.belongs_to :conversation, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
