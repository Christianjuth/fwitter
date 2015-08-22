class CreateTweets < ActiveRecord::Migration
  def up
    create_table :tweets do |t|
      t.string :user_id
      t.string :msg
      t.timestamps null: false
    end
  end

  def down
    drop_table :tweets
  end
end
