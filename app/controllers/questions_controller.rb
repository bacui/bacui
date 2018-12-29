class QuestionsController < ApplicationController
  access instructor: [:edit_questionnaire, :add_question, :sort], instructor_pending: [:edit_questionnaire, :add_question, :sort], admin: :all

  def edit_questionnaire
    @questions = Question.where(task_id: params[:review_task_id])
    @questions = @questions.order(:position)
    @review_task = ReviewTask.find(params[:review_task_id])
  end

  def sort
    # respond_to do |format|
      params[:question].each_with_index do |id, index|
        Question.where(id: id).update_all(position: index + 1)
    #  end
    end

    head :ok
  end

  def add_question
    respond_to do |format|
      if Question.create(question_params)
        flash[:notice] = 'Question added successfully'
      else
        flash[:alert] = 'Failed to add question. Please try again.'
      end
      format.html {redirect_to :controller => 'questions', :action => 'edit_questionnaire',
                               review_task_id: params[:question][:task_id]}
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :description, :type, :weight, :min_score, :max_score, :task_id)
  end
end