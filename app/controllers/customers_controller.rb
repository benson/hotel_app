class CustomersController < ApplicationController
  layout "webapp"
  def new
    @customer = Customer.new
    @customer.build_company
  end

  def create
    @customer = Customer.new(params[:customer])
    if !params[:customer][:company_id].empty? && !params[:customer][:company_attributes][:name].empty?
      flash[:warning] = "You can't select an existing company and create a new one at the same time."
      render :new and return
    end    
    if @customer.save
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
        @customer.company.delete_all  # can only have 1 company at a time (in this system)
        @customer.company << @company
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
