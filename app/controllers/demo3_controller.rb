class Demo3Controller < ApplicationController

  def index
    @type = params[:type]
    @count = params[:count]


    render :template => "demo3/question1"
  end


  def index1
    @type = params[:type]
    @count = params[:count]


    render :template => "demo3/question2"
  end

  def freda
    @type = params[:type]
    @count = params[:count]


    render :template => "demo3/freda"
  end

end
