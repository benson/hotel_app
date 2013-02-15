class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      flash[:success] = "Successfully added #{@customer.first_name}!"
      redirect_to customers_path
    else
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(params[:customer])
      flash[:success] = "Customer updated"
      redirect_to @customer
    else
      render 'edit'
    end
  end

  def index
    # @customers = Customer.paginate(page: params[:page])
    @customers = Customer.all
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end
end
