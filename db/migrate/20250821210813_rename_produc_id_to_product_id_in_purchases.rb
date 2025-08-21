class RenameProducIdToProductIdInPurchases < ActiveRecord::Migration[7.2]
  def change
    rename_column :purchases, :produc_id, :product_id
  end
end
