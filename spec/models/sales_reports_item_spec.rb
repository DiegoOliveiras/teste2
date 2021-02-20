require 'rails_helper'

describe SalesReportsItem do
  before do
    @item = SalesReportsItem.new(:apn_code => 9780670040247, :rrp => 32.95, :last_buy_price => 17.97, :item_description => "MAO'S LAST DANCER", :author => "CUNXIN LI", :product_category => "BI", :actual_stock_on_hand => 0, :trans_date => "2003-01-01", :trans_time => "2000-01-01 14:46:00.000000000 +0000", :trans_document => "POS:010567", :trans_reference => "POS:010567", :trans_quantity => 2, :trans_total_extax_value => 59.31, :trans_total_tax => 6.59, :trans_total_discount_given => 0)
  end
  
  describe ".calculate_sale_value" do      
    context "when called" do
      it "should return the sale value" do
        expect(@item.calculate_sale_value).to eq(65.9)
      end
    end
  end

  describe '.calculate_sale_profit' do
    context "when called" do
      it "should return the sale profit" do
        expect(@item.calculate_sale_profit).to eq(41.34)
      end
    end
  end

  describe 'self.get_uniq_years' do
    context "when called" do
      it "should return an array with all uniques years" do
        expect(SalesReportsItem.get_uniq_years).to eq([2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018])
      end
    end
  end

  describe 'self.get_sales_profit_per_month_by_year(year)' do
    context "when given a year" do
      it "should return an array that contains tue sum of the sales profits of each month of the year passed" do
        expect(SalesReportsItem.get_sales_profit_per_month_by_year(2003)).to eq([41.34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
      end
    end
  end

  describe 'self.get_sales_value_per_month_by_year(year)' do
    context "when given a year" do
      it "should return an array that contains the sum of the sales values of each month of the year passed" do
        expect(SalesReportsItem.get_sales_value_per_month_by_year(2003)).to eq([65.9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
      end
    end
  end
end