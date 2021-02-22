class SalesReportsController < ApplicationController
    require "net/http"

    def request_api     
        url = "https://glacial-basin-87867.herokuapp.com/api/v1/sales/50000"

        @response = HTTParty.get(url)
        @response.parsed_response

        @result = @response.body

        respond_to do |format|
            format.json { render :json => JSON.parse(@result) }
            format.html { render "request_api.html.erb" }
        end
    end
   
    def import
        Sales.import(params[:file])
        redirect_to '/report'
    end

    def report
        @years = Sales.get_uniq_years
    end

    def sales_report
        start_year = params[:start_year]
        end_year = params[:end_year]
        @sales_value_per_month_by_start_year = Sales.get_sales_value_per_month_by_year(start_year)
        @sales_value_per_month_by_end_year = Sales.get_sales_value_per_month_by_year(end_year)

        @sales_profit_per_month_by_start_year = Sales.get_sales_profit_per_month_by_year(start_year)
        @sales_profit_per_month_by_end_year = Sales.get_sales_profit_per_month_by_year(end_year)

        @mtd_by_start_year = Sales.get_mtd_by_year(start_year)
        @mtd_by_end_year = Sales.get_mtd_by_year(end_year)

        @ytd_by_start_year = Sales.get_ytd_by_year(start_year)
        @ytd_by_end_year = Sales.get_ytd_by_year(end_year)
    end
end
