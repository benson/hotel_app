class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params[:customer])
    if !params[:company_name].empty?
      @company = Company.new(name: params[:company_name], number:params[:company_number])
      if !@company.save
        flash[:warning] = "If you fill out new company, fill out both fields!"
        render :new and return
      end
    end
    if @customer.save
      if !@company.nil?
        @customer.companies << @company
      end
      flash[:success] = "Successfully added #{@customer.initial_name}!"
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
    if !params[:company_name].empty?
      @company = Company.new(name: params[:company_name], number:params[:company_number])
      if !@company.save
        flash[:warning] = "If you fill out new company, fill out both fields!"
        render :new and return
      end
    end
    if @customer.update_attributes(params[:customer])
      if !@company.nil? 
        @customer.companies.delete_all  # can only have 1 company at a time (in this system)
        @customer.companies << @company
      end
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
