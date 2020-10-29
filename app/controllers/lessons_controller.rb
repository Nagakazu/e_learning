class LessonsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @user = current_user #User.find(params[:user_id])
    @lesson = Lesson.new #(lesson_params)
    # redirect_to new_category_lesson_answer_url(@category, @lesson)
  end

  def create
    @lesson = Lesson.new(params[:id])
    if @lesson.save
      redirect_to new_category_lesson_answer_url(category, @lesson)
    end
  end

  private
    def lesson_params
      params.require(:category_id).merge(user_id: current_user.id)
    end
end
