class Rename < ActiveRecord::Migration[6.1]
  def change
    rename_table :sales_reports_items, :sales
  end
end
