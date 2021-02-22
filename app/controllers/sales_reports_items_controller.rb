class SalesReportsItemsController < ApplicationController
    require "net/http"

    def request_api     
        url = "http://127.0.0.1:3000/api/v1/sales_reports_items/1000"

        resp = Net::HTTP.get_response(URI.parse(url))
        data = JSON.parse(resp.body)
        render json: {status: 'SUCCESS', message:'Loaded', data:data},status: :ok
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
