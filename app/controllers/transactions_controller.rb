class TransactionsController < ApplicationController

	before_action :authenticate_user!
	before_action :check_cart!
	belongs_to :reservation

  def new
  	gon.client_token = generate_client_token
  end

  def create
  	@result = Braintree::Transaction.sale(
  			  amount: current_user.cart_total_price,
  			  payment_method_nonce: params[:payment_method_nonce])
  	if @result.success?
  		current_user.purchase_cart_listings!
  		redirect_to root_url, notice: "Congratulations! Your transaction has been successful!"
  	else
  		flash[:alert] = "Something went wrong while processing your transaction. Please try again."
  		gon.client_token = generate_client_token
  		render :new
  	end
  end

  private

  def generate_client_token
  	Braintree::ClientToken.generate
  end

  def check_cart!
  	if current_user.get_cart_listings.blank?
  		redirect_to root_url, alert: "Please add some items in your cart before processing your transaction!"
  	end
  end
end
