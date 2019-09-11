class CreateMentions < ActiveRecord::Migration[5.2]
  def change
    create_table :mentions do |t|
      t.belongs_to :tweet, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.boolean :read, default: false
      
      t.timestamps
    end
  end
end
