class CreateBrbInvoices < ActiveRecord::Migration
  def change
    create_table :brb_invoices do |t|
      t.references :category, index: true
      t.timestamps null: false
    end
  end
end
