class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit hide]
  before_action :set_question_for_current_user, only: %i[update destroy edit hide]

  def index
    @questions = Question.includes(:user, :author).order(created_at: :desc).first(10)
    @users = User.order(created_at: :desc).last(10)
    @hashtags = Hashtag.with_questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    question_params = params.require(:question).permit(:body, :user_id)

    @question = Question.new(question_params)
    @question.author = current_user

    if QuestionSave.(question: @question, params: question_params)
      redirect_to user_path(@question.user), notice: 'Новый вопрос создан!'
    else
      flash.now[:alert] = 'Неправильно заполнены поля вопроса'

      render :new
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :answer, :hidden)

    if QuestionSave.(question: @question, params: question_params)
      redirect_to user_path(@question.user), notice: 'Вопрос сохранен!'
    else
      flash.now[:alert] = 'При попытке сохранить вопрос возникли ошибки'

      render :edit
    end
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: 'Вопрос удален!'
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def edit
  end

  def hide
    @question.update(hidden: true)
    redirect_to question_path(@question)
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end
end
