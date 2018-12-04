class AddArticleUrlToNote < ActiveRecord::Migration[5.2]
  def change

    add_column :notes, :article_url, :string

  end
end
