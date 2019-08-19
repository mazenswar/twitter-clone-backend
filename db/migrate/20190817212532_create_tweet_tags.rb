class CreateTweetTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_tags do |t|
      t.belongs_to :hashtag, foreign_key: true
      t.belongs_to :tweet, foreign_key: true

      t.timestamps
    end
  end
end
