class CreateRetweets < ActiveRecord::Migration[5.2]
  def change
    create_table :retweets do |t|
      t.boolean :rt
      t.belongs_to :user, foreign_key: true
      t.belongs_to :tweet, foreign_key: true

      t.timestamps
    end
  end
end
