class ChargesController < ApplicationController

  def new
  end

  def show
    @product = Product.find(params[:id])

  end

  def create
    # Amount in cents
    @amount = 500

    if current_user.stripe_id?

      charge = Stripe::Charge.create(
        :customer    => user.stripe_id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )

    else
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      current_user.stripe_id = customer.id
      current_user.save

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
