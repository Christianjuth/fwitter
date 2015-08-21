class CreateHashtags < ActiveRecord::Migration
  def up
    create_table :hashtags do |t|
    	t.string :name
    end
  end

  def down
    drop_table :hashtags
  end
end
