class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.paginate(page: params[:page])
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    
    if @company.save
      flash[:success] = "#{@company.name} was successfully created."
      redirect_to companies_path
    else 
      flash[:warning] = "Format error."
      render new_company_path
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    @user = Company.find(params[:id])
    if @company.update_attributes(company_params)
      flash[:success] = "#{@company.name} was successfully updates."
      redirect_to companies_path
    else 
      flash[:warning] = "Error of format. "
      redirect_to edit_company_path(@user)
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:success] = "Company '#{@company.name}' deleted."
    redirect_to companies_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :number_employee, :country)
    end
end
