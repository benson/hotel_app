class CompaniesController < ApplicationController
  layout "webapp"
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      flash[:success] = "Successfully added #{@company.name}!"
      redirect_to companies_path
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      flash[:success] = "Company updated"
      redirect_to @company
    else
      render 'edit'
    end
  end

  def index
    # @companys = Company.paginate(page: params[:page])
    @companies = Company.all
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
  end
end
