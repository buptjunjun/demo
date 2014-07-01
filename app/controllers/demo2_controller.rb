class Demo2Controller < ApplicationController

  before_filter :find_topic
  def index
    if @count < @total
        @question = Question.where(:qtype=>@q_type,:topic_id => @topic.id)[@count]
        @count = @count+1

        if @q_type == 0
           text = @question.text
           texts = text.split("||")
           render :template => "demo2/index",locals: {:teststr=>'test',:q=>@question,:texts => texts}
        elsif  @q_type == 1
            answers = @question.answers
            render :template => "demo2/question2", locals: { :topic=>@topic,:question=>@question,:answers=>answers}
        elsif @q_type == 2
          answers = @question.answers
          images = answers[0].text.split(",")
          render :template => "demo2/question3", locals: {:images=>images}
        else
          redirect_to ("/demo2/index?t_id=#{@topic.id}&q_id=0&q_type=0")
        end
    else
      redirect_to ("/demo2/index?t_id=#{@topic.id}&q_id=0&q_type=0")
    end
  end



  def upload

  end

  protected
  def find_topic
    @topic = Topic.first
    @count = Integer(params[:q_id])
    @q_type = Integer(params[:q_type])
    @total = @topic.questions.where(:qtype=>@q_type).count
    puts @question
  end
end
