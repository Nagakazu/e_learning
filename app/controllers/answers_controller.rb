class AnswersController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.paginate(page: params[:page], per_page: 1)
    @lesson = Lesson.find(param[:lesson_id])
    @answer = Answer.new
  end

  def create
        
  end
end
