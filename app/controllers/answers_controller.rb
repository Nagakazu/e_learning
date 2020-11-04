class AnswersController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.paginate(page: params[:page], per_page: 1)
    @words = @category.words.paginate(page: params[:page], per_page: 1)
    @lesson = Lesson.find(params[:lesson_id])
    @answer = Answer.new
  end

  def create
    @category = Category.find(params[:category_id])
    @lesson = Lesson.find(params[:lesson_id])
    @word = Word.find(params[:word_id])
    @choice = Choice.find(params[:choice_id])
    @answer = @lesson.answers.build(answer_params)
    if @lesson.save
      unless params[:page].empty?
        redirect_to new_category_lesson_answer_url(@category, @lesson, page: params[:page])
      else
        result = 0
        @lesson.answers.each do |answer|
          if answer.choice.correct?
            result += 1
          end
          @lesson.update_attributes(:result => result)
        end
        redirect_to category_lesson_url(@category, @lesson)
      end
    end
  end

  private
  def answer_params
    params.permit(:word_id, :choice_id, :lesson_id)
  end
end
