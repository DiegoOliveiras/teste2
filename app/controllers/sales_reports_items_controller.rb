class SalesReportsItemsController < ApplicationController
    def index
        @salesReportsItem = SalesReportsItem.all 
        render json: @salesReportsItem
    end 

    def show
        @salesReportsItem = SalesReportsItem.find(params[:id])
        render json: @salesReportsItem
    end 

    def create
        @salesReportsItem = SalesReportsItem.create(
            apn_code: params[:apn_code],
            rrp: params[:rrp],
            last_buy_price: params[:last_buy_price],
            item_description: params[:item_description],
            author: params[:author],
            product_category: params[:product_category],
            actual_stock_on_hand: params[:actual_stock_on_hand],
            trans_date: params[:trans_date],
            trans_time: params[:trans_time],
            trans_document: params[:trans_document],
            trans_reference: params[:trans_reference],
            trans_quantity: params[:trans_quantity],
            trans_total_extax_value: params[:trans_total_extax_value],
            trans_total_tax: params[:trans_total_tax],
            trans_total_discount_given: params[:trans_total_discount_given]
        )
        render json: @salesReportsItem
    end 

    def update
        @salesReportsItem = SalesReportsItem.find(params[:id])
        @salesReportsItem.update(
            apn_code: params[:apn_code],
            rrp: params[:rrp],
            last_buy_price: params[:last_buy_price],
            item_description: params[:item_description],
            author: params[:author],
            product_category: params[:product_category],
            actual_stock_on_hand: params[:actual_stock_on_hand],
            trans_date: params[:trans_date],
            trans_time: params[:trans_time],
            trans_document: params[:trans_document],
            trans_reference: params[:trans_reference],
            trans_quantity: params[:trans_quantity],
            trans_total_extax_value: params[:trans_total_extax_value],
            trans_total_tax: params[:trans_total_tax],
            trans_total_discount_given: params[:trans_total_discount_given]
        )
        render json: @salesReportsItem
    end 

    def destroy
        @salesReportsItem = SalesReportsItem.all 
        @salesReportsItem = SalesReportsItem.find(params[:id])
        @salesReportsItem.destroy
        render json: @salesReportsItem
    end 

    def upload
    end

    def import
        SalesReportsItem.import(params[:file])
        redirect_to '/report'
    end

    def report
        @years = SalesReportsItem.get_uniq_years
    end

    def sales_report
        start_year = params[:start_year]
        end_year = params[:end_year]
        @sales_value_per_month_by_start_year = SalesReportsItem.get_sales_value_per_month_by_year(start_year)
        @sales_value_per_month_by_end_year = SalesReportsItem.get_sales_value_per_month_by_year(end_year)

        @sales_profit_per_month_by_start_year = SalesReportsItem.get_sales_profit_per_month_by_year(start_year)
        @sales_profit_per_month_by_end_year = SalesReportsItem.get_sales_profit_per_month_by_year(end_year)

        @mtd_by_start_year = SalesReportsItem.get_mtd_by_year(start_year)
        @mtd_by_end_year = SalesReportsItem.get_mtd_by_year(end_year)

        @ytd_by_start_year = SalesReportsItem.get_ytd_by_year(start_year)
        @ytd_by_end_year = SalesReportsItem.get_ytd_by_year(end_year)
    end
end
