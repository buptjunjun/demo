class Demo3Controller < ApplicationController

  Filebase = "/User/junjun/documents/pictures/"
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

  def listdata
    @type = params[:type]
    @count = params[:count]


    render :template => "demo3/listdata"
  end

  def dataarrange
    @type = params[:type]
    @count = params[:count]


    render :template => "demo3/listdata"
  end

  def addQuestion

    file  = params['file']
    if file != nil
      puts "upload="+file.original_filename

      filename = Filebase+file.original_filename;
      f = File.open(filename,"wb");
      f.write(file.read);
      f.close;
    end


    english = params[:english]
    chinese = params[:chinese]
    wiki = params[:wiki]

  end
end
