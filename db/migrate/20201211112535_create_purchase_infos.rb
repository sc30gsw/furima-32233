class CreatePurchaseInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_infos do |t|

      t.timestamps
    end
  end
end
