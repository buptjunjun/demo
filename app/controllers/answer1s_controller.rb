class Answer1sController < ApplicationController

  #index.html.erb
  def index
    @answer1s = Answer1.all
  end

  #edit.html.erb
  def edit
    @answer1 = Answer1.find(params[:id])
  end

  #edit.html.erb
  def show
    @answer1 = Answer1.find(params[:id])
  end

  #new.html.erb
  def new
    @answer1 = Answer1.new
  end

  # new => create
  def create
    @answer1 = Answer1.new(params[:answer1])
    if @answer1.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end


  # edit => update
  def update
    id = params[:id]
    @answer1 = Answer1.find(id)
    if @answer1.update_attributes(params[:answer1])
      redirect_to :action => :show,:id=>@answer1
    else
      render :action => :edit, :id=>@answer1
    end
  end

  def destroy
    @answer1 = Answer1.find(params[:id])
    @answer1.destroy
    redirect_to :action => :index
  end


  def search
    q = params[:q]
    # if q != nil
    #   @answer1s = Answer1.where(["text1 like ?","%#{q}%"]).limit(20);
    # end
    @answer1s = Question1.searchAnswersByText1(q)
    #puts @answer1s.length
  end

end


