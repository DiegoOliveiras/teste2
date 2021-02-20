class CreateSalesReportsItems < ActiveRecord::Migration[6.1]
  def change
    create_table :sales_reports_items do |t|
      t.float :apn_code	
      t.float :rrp	
      t.float :last_buy_price	
      t.string :item_description	
      t.string :author	
      t.string :product_category	
      t.float :actual_stock_on_hand	
      t.date :trans_date	
      t.time :trans_time	
      t.string :trans_document 
      t.string :trans_reference 
      t.float :trans_quantity	
      t.float :trans_total_extax_value	
      t.float :trans_total_tax	
      t.float :trans_total_discount_given
    end
  end
end
