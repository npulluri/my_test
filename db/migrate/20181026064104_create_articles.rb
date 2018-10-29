class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, limit: 75
      t.string :name, limit: 75
      t.text :content
      t.belongs_to :user
      t.string :status, limit: 25
      t.timestamps
    end
  end
end
