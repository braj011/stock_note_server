class CreateNotes < ActiveRecord::Migration[5.2]
  
  def change

    create_table :notes do |t|
      t.string :title
      t.string :content
      t.string :article_url
      t.references :user_stock, foreign_key: true

      t.timestamps
    end

  end
end
