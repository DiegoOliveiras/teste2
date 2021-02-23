class Sales < ApplicationRecord
  require "csv"

  def calculate_sale_value
    rrp * trans_quantity
  end

  def calculate_sale_profit
    (calculate_sale_value) - (last_buy_price) - (trans_total_tax) - (trans_total_discount_given)
  end

  def self.import(file)
    CSV.foreach(file, headers: ["apn_code", "rrp", "last_buy_price", "item_description", "author", "product_category", "actual_stock_on_hand", "trans_date", "trans_time", "trans_document", "trans_reference", "trans_quantity", "trans_total_extax_value", "trans_total_tax", "trans_total_discount_given"]) do |row|
      Sales.create(row.to_h)
    end
  end

  def self.get_uniq_years
    pluck(:trans_date).map { |y| y.year }.uniq.sort
  end

  def self.get_sales_per_month_by_year(year)
    sales_per_month_by_year = Array.new
    first_day = Date.new(year.to_i, 1, 1)
    last_day = Date.new(year.to_i, 1, 31)
    for i in 0..11
      sales_per_month_by_year << where(:trans_date => first_day..last_day)
      first_day = first_day >> 1
      last_day = last_day >> 1
    end
    sales_per_month_by_year
  end

  def self.get_sales_profit_per_month_by_year(year)
    sales_profit_per_month_by_year = Array.new(12, 0)
    sales_per_month_by_year = get_sales_per_month_by_year(year)
    for i in 0..11
      sales_per_month_by_year[i].each do |sale|
        sales_profit_per_month_by_year[i] += sale.calculate_sale_profit
      end
    end
    sales_profit_per_month_by_year
  end

  def self.get_sales_value_per_month_by_year(year)
    sales_value_per_month_by_year = Array.new(12, 0)
    sales_per_month_by_year = get_sales_per_month_by_year(year)
    for i in 0..11
      sales_per_month_by_year[i].each do |sale|
        sales_value_per_month_by_year[i] += sale.calculate_sale_value
      end
    end
    sales_value_per_month_by_year
  end

  def self.get_mtd_by_year(year)
    mtd_by_year = Array.new
    first_day = Date.new(year.to_i, 1, 1)
    last_day = Date.new(year.to_i, 1, Time.new.day - 1)
    sales_per_month_by_year = where(:trans_date => first_day..last_day)
    mtd_sales_profit_by_year = 0
    mtd_sales_value_by_year = 0
    sales_per_month_by_year.each do |sale|
      mtd_sales_value_by_year += sale.calculate_sale_value
      mtd_sales_profit_by_year += sale.calculate_sale_profit
    end
    return mtd_sales_value_by_year, mtd_sales_profit_by_year
  end

  def self.get_ytd_by_year(year)
    ytd_by_year = Array.new
    first_day = Date.new(year.to_i, 1, 1)
    last_day = Date.new(year.to_i, Time.new.month, Time.new.day - 1)
    sales_per_month_by_year = where(:trans_date => first_day..last_day)
    ytd_sales_profit_by_year = 0
    ytd_sales_value_by_year = 0
    sales_per_month_by_year.each do |sale|
      ytd_sales_value_by_year += sale.calculate_sale_value
      ytd_sales_profit_by_year += sale.calculate_sale_profit
    end
    return ytd_sales_value_by_year, ytd_sales_profit_by_year
  end
end
