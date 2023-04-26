class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def unsubscribe
  end

  def is_deleted
    @customer = current_customer
    @customer.is_deleted = true
    if @customer.save
      reset_session
      redirect_to root_path
    end
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update
  end
end
