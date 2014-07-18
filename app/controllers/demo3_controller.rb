class Demo3Controller < ApplicationController

  before_filter :getsparams,:only =>[:updateanswer1,:newanswer1, :editdata,:newdata,:updatequestion1,:addquestion1,:newquestion1]
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



  def getsparams
    @text1 = params[:text1]
    @text2 = params[:text2]
    @text3 = params[:text3]

    img  = params[:image]
    @img_name = "";
    if img != nil
      @img_name = img.original_filename
      savefile(img)
    end

    audio  = params[:audio]
    @audio_name = "";
    if audio != nil
      @audio_name = audio.original_filename
      savefile(audio)
    end

  end

  def addquestion1
    q1 = Question1.new
    q1.text1 = @text1
    q1.text2 = @text2
    q1.text3 = @text3
    q1.audio = @audio_name
    q1.image = @img_name
    q1.save
    redirect_to :action => "showquestion1",:id=>q1
  end

  def newquestion1
    q1 = Question1.new
    render :template => "demo3/newdata",:locals => {:q1=>q1}
  end

  def updatequestion1
    id = params[:id]

    q1 = Question1.find(id)
    attr_value = {}
    attr_value[:text1] = @text1
    attr_value[:text2] = @text2
    attr_value[:text3] = @text3
    if @audio_name.blank? == false
      attr_value[:audio] = @audio_name
    end

    if @img_name.blank? == false
      attr_value[:image] = @img_name
    end

    q1.update_attributes(attr_value);
    redirect_to :action => "showquestion1",:id=>q1

  end

def showquestion1
  id = params[:id]
  q1 = Question1.find(id)
  render :template => "demo3/showdata/",locals: {:q1=>q1}

end

def newanswer1
    a1 = Answer1.new
    render :template => "demo3/newanswer1",:locals => {:a1=>a1}
end

  def showanswer1
    id = params[:id]
    a1 = Answer1.find(id)
    render :template => "demo3/showanswer1",:locals => {:a1=>a1}
  end

  def editanswer1
    id = params[:id]
    a1 = Answer1.find(id)
    render :template => "demo3/editanswer1",:locals => {:a1=>a1}
  end

  def updateanswer1

    id = params[:id]

    a1 = Answer1.find(id)
    attr_value = {}
    attr_value[:text1] = @text1
    attr_value[:text2] = @text2
    attr_value[:text3] = @text3
    if @audio_name.blank? == false
      attr_value[:audio] = @audio_name
    end

    if @img_name.blank? == false
      attr_value[:image] = @img_name
    end

    a1.update_attributes(attr_value);
    redirect_to :action => "editanswer1",:id=>a1
  end

  def newanswer1

    a1 = Answer1.new
    a1.text1 = @text1
    a1.text2 = @text2
    a1.text3 = @text3
    a1.audio = @audio_name
    a1.image = @img_name
    a1.save

    redirect_to :action => "showanswer1",:id=>a1
  end

  def savefile (uploadFile)

    if uploadFile != nil
      puts "upload="+uploadFile.original_filename
      filename = Filebase+uploadFile.original_filename;
      f = File.open(filename,"wb");
      f.write(uploadFile.read);
      f.close;
    end
  end
end
