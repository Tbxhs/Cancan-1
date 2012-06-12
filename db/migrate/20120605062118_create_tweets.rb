class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.integer :can_id
      t.string :content
      t.integer :type

      t.timestamps
    end
  end
end
