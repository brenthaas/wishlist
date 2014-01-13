class WishesController < ApplicationController
  before_action :authenticate_user!

  def create
    wish = current_user.wishes.build(validated_params)
    if wish.save
      render nothing: true
    else
      render :new
    end
  end

  def new
    @wish = Wish.new
  end

  def show
    @wish = Wish.find params[:id]
    render :show
  end

  def index
    @wishes = Wish.all
    render :index
  end


  private
    def validated_params
      params.require(:wish).permit(:title, :summary, :url, :image)
    end
end
