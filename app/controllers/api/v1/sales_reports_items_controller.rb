module Api
	module V1
		class SalesReportsItemsController < ApplicationController
            def index
				sales = SalesReportsItem.order('trans_date DESC');
				render json: {status: 'SUCCESS', message:'All Sales Loaded', data:sales},status: :ok
			end

            def show
				sale = SalesReportsItem.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded Sale', data:sale},status: :ok
			end

			def create
				sale = SalesReportsItem.new(sale_params)
				if sale.save
					render json: {status: 'SUCCESS', message:'Saved sale', data:sale},status: :ok
				else
					render json: {status: 'ERROR', message:'Sale not saved', data:sale.erros},status: :unprocessable_entity
				end
			end

			def destroy
				sale = SalesReportsItem.find(params[:id])
				sale.destroy
				render json: {status: 'SUCCESS', message:'Deleted sale', data:sale},status: :ok
			end

			def update
				sale = SalesReportsItem.find(params[:id])
				if sale.update_attributes(sale_params)
					render json: {status: 'SUCCESS', message:'Updated sale', data:sale},status: :ok
				else
					render json: {status: 'ERROR', message:'Sale not update', data:sale.erros},status: :unprocessable_entity
				end
			end

			private
			def sale_params
				params.permit(:apn_code, :rrp, :last_buy_price, :item_description, :author, :product_category, :actual_stock_on_hand, :trans_date, :trans_time, :trans_document, :trans_reference, :trans_quantity, :trans_total_extax_value, :trans_total_tax, :trans_total_discount_given])
			end
        end
    end
end