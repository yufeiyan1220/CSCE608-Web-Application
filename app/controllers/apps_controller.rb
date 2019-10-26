class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  # GET /apps
  # GET /apps.json
  def index
    @apps = App.paginate(page: params[:page])
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
    @app = App.find(params[:id])
  end

  # GET /apps/new
  def new
    @app = App.new
    @companies = Company.all
  end

  # GET /apps/1/edit
  def edit
    @companies = Company.all
  end

  # POST /apps
  # POST /apps.json
  def create
  
    @app = App.new(app_params)

    if @app.save
      @company = @app.company
      flash[:success] = "#{@app.name} was successfully created."
      redirect_to apps_path
    else
      flash[:warning] = "Format error."
      redirect_to new_app_path
    end
  end

  # PATCH/PUT /apps/1
  # PATCH/PUT /apps/1.json
  def update
    
    if @app.update_attributes(app_params)
      @company = @app.company
      flash[:success] = "#{@app.name} was successfully created."
      redirect_to apps_path
    else
      flash[:warning] = "Email and name could not be null."
      redirect_to edit_app_path
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    @app = App.find(params[:id])
    @app.destroy
    flash[:success] = "App '#{@app.name}' deleted."
    redirect_to apps_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:name, :app_type, :company_id, :version)
    end
end
