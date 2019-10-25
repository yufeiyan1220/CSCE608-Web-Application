class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    
  end
  
  def new
    if params[:user_id]
      @user = User.find(params[:user_id])
    else
      @users = User.all
    end
    @apps = App.all
    @review = Review.new
  end

  def create
    
    @review = Review.new(reviews_params)
   
    if @review.save
      flash[:success] = "#{@review.app.name} was successfully purchased."
      redirect_to reviews_path
    else
      flash[:warning] = "Format error."
      redirect_to reviews_path
    end
  end
  
  def destroy
    @review = Review.find(params[:id]);
    @review.destroy
    redirect_to reviews_path
  end

  private
    def reviews_params
      params.require(:review).permit(:user_id, :app_id, :star, :comment)
    end
end
