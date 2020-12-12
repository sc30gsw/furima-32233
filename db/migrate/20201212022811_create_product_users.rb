class CreateProductUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :product_users do |t|
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
