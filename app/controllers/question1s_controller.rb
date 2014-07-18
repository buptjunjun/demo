class Question1sController < ApplicationController

  def create
    @question1 = Question1.new(params[:question1])
    if @question1.save
      redirect_to :action => :index
    else
      render :template => "question1s/show"
    end
  end

  #new.html.erb
  def new
    @question1 = Question1.new
  end

  def update
    @question1 = Question1.find(params[:id])
    if @question1.update_attributes(params[:question1])
      redirect_to :action => :show, :id=>@question1
    else
      render :action => :edit
    end
  end

  #edit.html.erb
  def edit
    @question1 = Question1.find(params[:id])
  end

  # index.html.erb
  def index
    @question1s = Question1.all
  end

  #  show.html.erb
  def show
    q = params[:q]
    @question1 = Question1.find(params[:id])
    # the answers of question1
    @qanswer1s = @question1.answer1s

    @answer1s = Question1.searchAnswersByText1(q)
  end

  def destroy
    @question1 = Question1.find(params[:id])
    @question1.answer1s.clear;
    @question1.destroy;

    redirect_to :action => :index
  end

  def addanswers
    qid = params[:qid]
    aid = params[:aid]

    if aid != nil && qid != nil
       @question1 = Question1.find(qid)
       @answer1 = Answer1.find(aid)
    end

    begin
      if @answer1 != nil && @question1 != nil && (@question1.answer1s.length == 0 || @question1.answer1s.where(:id=>aid).length)
        @question1.answer1s<<@answer1
      end
    rescue => e
      puts "+++++"+e.inspect
    end

    redirect_to :controller => :question1s, :action => :show, :id=>@question1
  end

  def delanswers
    qid = params[:qid]
    aid = params[:aid]

    if aid != nil && qid != nil
      @question1 = Question1.find(qid)
      @answer1 = Answer1.find(aid)
    end

    if @answer1 != nil && @question1 != nil
      @question1.answer1s.delete(@answer1)
    end

    redirect_to :controller => :question1s, :action => :show, :id=>@question1
  end

  def markanswer
    qid = params[:qid]
    aid = params[:aid]

    if aid != nil && qid != nil
      @question1 = Question1.find(qid)
      @answer1 = Answer1.find(aid)
      @question1.answer=@answer1.id
      @question1.save
    end

    redirect_to :controller => :question1s, :action => :show, :id=>@question1
  end

  private
  def getquestion1
    @question1  = Question1.find(params[:id])
  end

end
