class CreateBidders < ActiveRecord::Migration[7.1]
  def change
    create_table :bidders do |t|
      t.string :name
      t.string :cpf
      t.date :birth_date
      t.string :street
      t.string :number
      t.string :neighbourhood
      t.string :city
      t.string :state
      t.string :postcode
      t.string :telephone
      t.monetize :salary, amount: { null: true, default: nil }, currency: { null: true, default: nil }
      t.decimal :inss_discount, precision: 10, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
