class Admin::CategoriesController < ApplicationController
  # before_action :if_not_admin
  before_action :require_admin

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_url
    else
      render 'new'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to admin_categories_path
  end

  def show
    @category = Category.find(params[:id])
    @words = @category.words.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to admin_categories_path
    else
      render 'edit'
    end
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 20)
  end

  private
  # def if_not_admin
  #   redirect_to root_path unless current_user.admin?
  # end
  
  def category_params
    params.require(:category).permit(:title, :description)
  end
end
