class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :details
      t.date :end_date
      t.integer :reserve_price
      t.integer :current_price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
