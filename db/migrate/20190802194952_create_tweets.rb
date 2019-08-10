class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :content
      t.belongs_to :user, foreign_key: true
      t.text :retweets, array: true, default: []
      t.timestamps
    end
  end
end