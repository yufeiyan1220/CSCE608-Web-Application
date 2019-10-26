class PurchaseItemsController < ApplicationController
  def index
    user_id = params[:user_id]
    
    if user_id
      @user = User.find(user_id)
      @apps = App.paginate(page: params[:page])
    else
      redirect_to users_path
    end
    
  end

  # GET /apps/1
  # GET /apps/1.json
  def show
    @purchase_item = PurchaseItem.find(params[:id])
  end

  # GET /apps/new
  def new
    user_id = params[:user_id]
    app_id = params[:app_id]
    @purchase_item = PurchaseItem.new
    
    if user_id and app_id
      @user = User.find(user_id)
      @app = App.find(app_id)
    else
      redirect_to users_path
    end
  end

  def create
    # price = purchase_item_params[:price]
    # user_id = params[:user_id]
    # app_id = params[:app_id]
    
    # purchase_info = {price: price, user_id: user_id, app_id: app_id}
    
    @purchase_item = PurchaseItem.new(purchase_item_params)
   
    if @purchase_item.save
      flash[:success] = "#{@purchase_item.app.name} was successfully purchased."
      redirect_to user_path(@purchase_item.user_id)
    else
      flash[:warning] = "Format error."
      redirect_to users_path
    end
  end
  
  def use
    if params[:id]
      purchase_item = PurchaseItem.find(params[:id])
      purchase_item.use
      flash[:success] = "#{purchase_item.app.name} used once."
      redirect_to user_path(purchase_item.user_id)
    else
      redirect_to users_path
    end
  end
  
  def destroy
    purchase_item = PurchaseItem.find(params[:id])
    purchase_item.destroy
    redirect_to user_path(purchase_item.user_id)
  end
  
  
  private
    def purchase_item_params
      params.require(:purchase_item).permit(:price, :user_id, :app_id)
    end
end
