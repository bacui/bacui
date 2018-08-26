class QuestionsController < ApplicationController
  access instructor: [:edit_questionnaire], instructor_pending: [:edit_questionnaire], admin: :all

  def edit_questionnaire
    @questions = Question.where(task_id: params[:review_task_id])
    @review_task = ReviewTask.find(params[:review_task_id])
  end
end