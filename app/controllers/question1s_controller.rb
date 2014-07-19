class Question1sController < ApplicationController

  @@lasttag= "";
  def create
    @question1 = Question1.new(params[:question1])
    @@lasttag = @question1.tag
    if @question1.save
      redirect_to :action => :index
    else
      render :template => "question1s/show"
    end
  end

  #new.html.erb
  def new
    @question1 = Question1.new
    @question1.tag= @@lasttag;
  end

  def update
    create_json_demo3('Jupiter')
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
      if @answer1 != nil && @question1 != nil && (@question1.answer1s.length == 0 || @question1.answer1s.where(:id=>aid).length==0)
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


  def download
     tag = params[:tag]
     if tag != nil
       filepath = create_json_demo3(tag)

       send_file filepath
     end

  end


  private

  def getquestion1
    @question1  = Question1.find(params[:id])
  end

  Jsonbase = "public/json/"
  def create_json_demo3(tag)
    ret = {
        "sumary"=>{"title"=>tag},
        "part1"=>[]
    }
    questions = Question1.all
    questions.each do |q|
        hq = {
            "type"=> "picture",
            "text1"=> q.text2,
            "text2"=> q.text1,
            "audio"=>q.audio,
            "wiki"=> q.text3,
            "answers"=> [],
            "right"=>1
        }

        answer1s = q.answer1s

        if answer1s != nil
            answerid = q.answer
            type = "picture"
            if  answer1s[0].image == nil
              type = "question"
              hq['type']="question"
            end

            answer1s.each_with_index  do |a,index|
                if type=="picture"
                  hq['answers'].push(a.image)
                else
                  hq['answers'].push(a.text1)
                end

                if answerid == a.id
                   hq['right']= index+1
                end
            end # end of answer1s.each
        end# end of answer1s != nil
        ret['part1'].push(hq);
    end

    #generate json file
    jsonstr = JSON.generate(ret)

    path = Jsonbase+tag+".json"
    file = File.open(path,"w")
    file.write(jsonstr)
    file.close

    return path;
  end

end
