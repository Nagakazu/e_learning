class CategoriesController < ApplicationController
before_action :only_loggedin_users, only: [:index, :show]

  def new
    @category = Category.find(params[:id])
  end

  def show
    @words = Word.find_by(params[:category_id])
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
    @words = Word.find_by(params[:category_id])

  end

  private
    def category_params
      params.require(:category).permit(:title, :description)
    end
  end
