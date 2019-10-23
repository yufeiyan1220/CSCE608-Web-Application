class PlatformsController < ApplicationController
  before_action :set_platform, only: [:show, :edit, :update, :destroy]

  # GET /platforms
  # GET /platforms.json
  def index
    @platforms = Platform.all
  end

  # GET /platforms/1
  # GET /platforms/1.json
  def show
    @platforms = Platform.find(params[:id])
  end
  

  # GET /platforms/new
  def new
    @platform = Platform.new
  end

  # GET /platforms/1/edit
  def edit
    @platform = Platform.find(params[:id])
  end

  # POST /platforms
  # POST /platforms.json
  def create
    @platform = Platform.new(platform_params)

    if @platform.save
      flash[:success] = "#{@platform.name} was successfully created."
      redirect_to platforms_path
    else 
      flash[:warning] = "Format error."
      render new_platform_path
    end
  end

  # PATCH/PUT /platforms/1
  # PATCH/PUT /platforms/1.json
  def update
    @platform = Platform.find(params[:id])

    if @platform.update_attributes(platform_params)
      flash[:success] = "#{@platform.name} was successfully updated."
      redirect_to platforms_path
    else 
      flash[:warning] = "Format error."
      redirect_to edit_platform_path(@platform)
    end
  end

  # DELETE /platforms/1
  # DELETE /platforms/1.json
  def destroy
    @platform = Platform.find(params[:id])
    @platform.destroy
    flash[:success] = "Platform '#{@platform.name}' deleted."
    redirect_to platforms_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platform
      @platform = Platform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def platform_params
      params.require(:platform).permit(:name, :version)
    end
end
