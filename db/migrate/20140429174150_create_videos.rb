class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url, null: false
      t.string :description, null: false
      t.integer :rating, default: 0
      t.timestamps
    end
  end
end
