class AppReleasePlatformsController < ApplicationController
  def index
    app_id = params[:app_id]
    @app = App.find(app_id)
    @relation_app_platforms = AppReleasePlatform.where(:app_id => app_id);
  end
  
  def create
    app_id = params[:app_id]
    
    @relation_app_platform = AppReleasePlatform.new(app_id: app_id, platform_id: app_platform_params[:platform_id])
    
    
    if @relation_app_platform.save
      redirect_to app_app_release_platforms_path
    else
      render new_app_app_release_platform_path(app_id)
    end
  end

  def new
    app_id = params[:app_id]
    @app = App.find(app_id)
    @apps = App.all
    @platforms = Platform.all
    @relation_app_platform = AppReleasePlatform.new(:app_id => app_id)
    # byebug
  end

  def destroy
    @relation_app_platform = AppReleasePlatform.find(params[:id])
    @relation_app_platform.destroy
    redirect_to app_app_release_platforms_path
  end
  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_platform_params
      params.require(:app_release_platform).permit(:platform_id)
    end
end
