class CreateTweetsHashtags < ActiveRecord::Migration
  def up
    create_table :tweets_hashtags do |t|
    	t.belongs_to :tweet, index: true
    	t.belongs_to :hashtag, index: true
    	t.timestamps null: false
    end
  end

  def down
    drop_table :tweets_hashtags
  end
end
