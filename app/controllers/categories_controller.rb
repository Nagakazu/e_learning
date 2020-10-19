class CategoriesController < ApplicationController
before_action :only_loggedin_users, only: [:index, :show]

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  private
    def category_params
      params.require(:category).permit(:title, :description)
    end
  end
