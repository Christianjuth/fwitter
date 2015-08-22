class CreateHashtags < ActiveRecord::Migration
  def up
    create_table :hashtags do |t|
    	t.string :name
    	t.timestamps null: false
    end
  end

  def down
    drop_table :hashtags
  end
end
