class Admin::WordsController < ApplicationController
  before_action :if_not_admin

  def new
    @word = Word.new
  end

  def create
    @category = Category.find(params[:category_id])
    # @word = Word.new(word_params)
    @word = @category.words.build(word_params)
    if @word.save
      redirect_to admin_categories_url
    else
      # abort
      render 'new'
    end
  end

  def destroy
    Word.find(params[:id]).destroy
    redirect_to admin_categories_url
  end

  def show
    @words = Word.find_by(params[:category_id])
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update_attributes(word_params)
      redirect_to admin_categories_url
    else
      render 'edit'
    end
  end

  def index
    @words = Word.find_by(params[:category_id])
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def word_params
    params.require(:word).permit(:word, :category_id)
  end
end
