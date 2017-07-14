class AddColumnTitleAndContentIntoPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :title, :string
    add_column :posts, :content, :text
    add_column :posts, :visible, :boolean, default: true
  end
end
