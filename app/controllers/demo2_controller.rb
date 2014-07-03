class Demo2Controller < ApplicationController

  before_filter :find_topic
  def index
    if @count < @total
        @question = Question.where(:qtype=>@q_type,:topic_id => @topic.id)[@count]
        if @q_type == 0

          #用于预加载
          if @count+1 < @total
            @question1 = Question.where(:qtype=>@q_type,:topic_id => @topic.id)[@count+1]
          end
           text = @question.text
           texts = text.split("|||")
           chineses = texts[0].split("|")
           englishes = texts[1].split("|")
           words = []
           chineses.each_with_index { |c, index|
                e = englishes[index]
                word = {"c"=>c,"e"=>e}
                words.append(word)
           }
           render :template => "demo2/index",locals: {:teststr=>'test',:q1=>@question1, :q=>@question, :texts => texts, :words=>words}
        elsif  @q_type == 1
            answers = @question.answers
            text = @question.text
            texts = text.split("|")

            render :template => "demo2/question2", locals: { :topic=>@topic,:question1 => @question1,:texts=>texts,:answers=>answers}
        elsif @q_type == 2
          answers = @question.answers
          images = answers[0].text.split(",")
          length = images.length
          width = 12/length
          render :template => "demo2/question3", locals: {:images=>images,:width=>width, :question=>@question}
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
