class AddDownloadUrlToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :download_url, :string
  end
end
