class CreateTweetsHashtags < ActiveRecord::Migration
  def up
    create_table :tweets_hashtags do |t|
    	t.integer :tweet_id
    	t.integer :hashtag_id
    end
  end

  def down
    drop_table :tweets_hashtags
  end
end
